package com.kh.boardwiths.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.boardwiths.admin.common.AdminPagination;
import com.kh.boardwiths.admin.common.PageInfo;
import com.kh.boardwiths.admin.common.TempKey;
import com.kh.boardwiths.admin.model.exception.AdminException;
import com.kh.boardwiths.admin.model.service.AdminService;
import com.kh.boardwiths.admin.model.vo.Daily;
import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.users.model.vo.Users;
@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	
	@Autowired
	private BCryptPasswordEncoder bCrypt;
	
	@RequestMapping("adminMain.ad")
	public String adminMain(Model model) { // 관리자 메인 화면으로 이동시켜주는 메소드
//			2) 일자별 요약 정보를 조회해온다. 
//			(일자, 방문자, 가입자 수, 새로운 게시글 수, 새로운 댓글수, 신고 횟수, 후기 횟수)
		ArrayList<Daily> dList = new ArrayList<Daily>();
		
		HashMap<String, ArrayList<Daily>> list = aService.dailyRecentList();
		
		ArrayList<Daily> normal = list.get("normalList");
		ArrayList<Daily> enrollList = list.get("enrollList");
		ArrayList<Daily> categoryList = list.get("categoryList");
		ArrayList<Daily> commentList = list.get("commentList");
		ArrayList<Daily> reportList = list.get("reportList");
		
		for(int i = 0; i < normal.size(); i++) {
			Daily d = new Daily();
			d.setDaily(normal.get(i).getDaily());
			d.setEnrollNo(enrollList.get(i).getEnrollNo());
			d.setNewCommentNo(commentList.get(i).getNewCommentNo());
			d.setNewMarketNo(categoryList.get(i).getNewMarketNo());
			d.setNewReportNo(reportList.get(i).getNewReportNo());
			d.setNewMatchingNo(categoryList.get(i).getNewMatchingNo());
			d.setUsersCount(normal.get(i).getUsersCount());
			dList.add(d);
		}
		model.addAttribute("dList", dList);
		
//			3) 회원 목록 정보를 조회 => 회원번호, 아이디, 이름, 신고횟수, 상태 
		ArrayList<Users> uList = aService.usersRecentList();
		model.addAttribute("uList", uList);
		
//			4) 신고 목록 정보를 조회 => 신고일자, 신고자, 신고대상, 게시글, 신고메시지
		ArrayList<Report> rList = aService.reportRecentList();
		model.addAttribute("rList", rList);
		
//			5) 게임 목록 정보를 조회 => 게임명, 소요시간, 게임난이도, 마켓 건, 소셜 건
		ArrayList<Game> gList = aService.gameRecentList();
		model.addAttribute("gList", gList);
		
//			6) 조회 정보를 Model.addAttribute()로 저장하여 관리자 메인 View(adminMain.jsp)로 이동한다.
		if(dList != null && uList != null && rList != null && gList != null) {
			return "adminMain";
		} else {
			throw new AdminException("관리자 메인페이지 서비스 요청이 실패하였습니다.");
		}
	}

	@RequestMapping("dailyInfo.ad")
	public String dailyInfo(@RequestParam(value="page", defaultValue="1") int currentPage,
							Model model) {
		ArrayList<Daily> result = new ArrayList<Daily>();
		int listCount = aService.dailyListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("beginDt", "all");
		
		HashMap<String, ArrayList<Daily>> list = aService.dailyInfoList(map, pi);
		
		ArrayList<Daily> normal = list.get("normalList");
		ArrayList<Daily> enroll = list.get("enrollList");
		ArrayList<Daily> category = list.get("categoryList");
		ArrayList<Daily> comment = list.get("commentList");
		ArrayList<Daily> report = list.get("reportList");
		
		//System.out.println(category);
		
		
		for(int i = 0; i < normal.size(); i++) {
			Daily d = new Daily();
			d.setDaily(normal.get(i).getDaily());
			d.setUsersCount(normal.get(i).getUsersCount());
			d.setNewCommentNo(comment.get(i).getNewCommentNo());
			d.setNewMarketNo(category.get(i).getNewMarketNo());
			d.setNewMatchingNo(category.get(i).getNewMatchingNo());
			d.setNewReportNo(report.get(i).getNewReportNo());
			d.setEnrollNo(enroll.get(i).getEnrollNo());
			
			result.add(d);
		}
		
		model.addAttribute("result", result);
		model.addAttribute("pi", pi);
		model.addAttribute("all", "all");
		
		return "dailyInfo";
	}

	@RequestMapping("dailyInfoSearch.ad")
	public String dailyInfoSearch(@RequestParam(value="beginDt", required=false) String beginDt,
									@RequestParam(value="endDt", required=false) String endDt,
									@RequestParam(value="term", required=false) String term,
									@RequestParam(value="page", defaultValue="1") int currentPage, 
									Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<String, ArrayList<Daily>> list = new HashMap<String, ArrayList<Daily>>();
		ArrayList<Daily> result = new ArrayList<Daily>();
		PageInfo pi = null;
		
//			2) 컨텐츠의 갯수를 계산하여 PageInfo 객체를 생성한다.
		if(term == null) {
			// 두 날짜를 정렬시킨다.
			String[] beginArr = beginDt.split("-");
			Date begin = new Date(Integer.parseInt(beginArr[0])-1900,Integer.parseInt(beginArr[1])-1,Integer.parseInt(beginArr[2]));
			String[] endArr = endDt.split("-");
			Date end = new Date(Integer.parseInt(endArr[0])-1900,Integer.parseInt(endArr[1])-1,Integer.parseInt(endArr[2]));
			
			Date beginDate = begin.getTime() <= end.getTime() ? begin : end; 
			Date endDate = begin.getTime() <= end.getTime() ? end : begin; 
			
			String beginString = beginDate.toString().substring(2);
			String endString = endDate.toString().substring(2);
						
			map.put("beginDt", beginString);
			map.put("endDt", endString);
			long listCount = (endDate.getTime() - beginDate.getTime()) / (1000*60*60*24);
			pi = AdminPagination.getPageInfo(currentPage, (int)listCount, 10);
			
			model.addAttribute("beginDt", beginDt);
			model.addAttribute("endDt", endDt);
			} else if(term.equals("week")) { 
				map.put("beginDt", "week");
				pi = AdminPagination.getPageInfo(currentPage, 7, 10);
				model.addAttribute("term", "week");
			} else if(term.equals("month")) {
				map.put("beginDt", "month");
				pi = AdminPagination.getPageInfo(currentPage, 30, 10);
				model.addAttribute("term", "month");
			}
		
		list = aService.dailyInfoList(map, pi);
		System.out.println(pi);
//			5) 전달받은 데이터를 가공한다.
		ArrayList<Daily> normal = list.get("normalList");
		ArrayList<Daily> enrollList = list.get("enrollList");
		ArrayList<Daily> categoryList = list.get("categoryList");
		ArrayList<Daily> commentList = list.get("commentList");
		ArrayList<Daily> reportList = list.get("reportList");
		
		for(int i = 0; i < normal.size(); i++) {
			Daily d = new Daily();
			d.setDaily(normal.get(i).getDaily());
			d.setUsersCount(normal.get(i).getUsersCount());
			d.setNewCommentNo(commentList.get(i).getNewCommentNo());
			d.setNewMarketNo(categoryList.get(i).getNewMarketNo());
			d.setNewReportNo(reportList.get(i).getNewReportNo());
			d.setNewMatchingNo(categoryList.get(i).getNewMatchingNo());
			d.setEnrollNo(enrollList.get(i).getEnrollNo());
			result.add(d);
		}
		 
//			6) 컨텐츠 출력을 위한 List와 페이징 기능을 위한 PageInfo 객체를 View(dailyInfo.jsp)에게 전달한다.
		if(!list.isEmpty()) {
			model.addAttribute("result", result);
			model.addAttribute("pi", pi);
			return "dailyInfo";
		} else {
			throw new AdminException("조회결과가 존재하지 않습니다.");
		}
	}
	
	// 회원 목록 조회
	@RequestMapping("userList.ad")
	public ModelAndView userList(@RequestParam(value="page", defaultValue="1") int currentPage,
							ModelAndView mv) {
//		2) 회원 목록 정보를 조회해온다. 
//		(회원번호, 아이디, 비밀번호, 닉네임, 이름, 전화번호, 이메일, 회원등급, 회원상태, 신고횟수, 가입일자, 탈퇴일자, 탈퇴메시지, 수정일자, 관리자여부)
		//HashMap<String, String> map = new HashMap<String, String>();
		//map.put("flag", null); // 모든 목록 출력을 위한 listCount인지 검색결과 출력을 위한 listCount인지를 구분짓기 위함
		
		int listCount = aService.usersListCount(null);
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Users> list = aService.usersSelectList(null, pi);
		
		
		if(!list.isEmpty()) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("userList");
		} else {
			throw new AdminException("회원 목록 조회 요청에 실패하였습니다.");
		}
		return mv;
	}
	
	// 최근 일주일 가입자만 조회해오기
	@RequestMapping("weekSearchUsers.ad")
	public String weekSearchUsers(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		int listCount = aService.weekSearchUsersListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		
		ArrayList<Users> list = aService.weekSearchUsers(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("term", "week");
		return "userList";
	}
	
	
	//회원 검색
	@RequestMapping("searchUsers.ad")
	public ModelAndView searchUsers(@ModelAttribute Users users, 
								@RequestParam("beginDt") String beginDt,
								@RequestParam("endDt") String endDt,
								@RequestParam(value="page", defaultValue="1") int currentPage,
								ModelAndView mv) {
//		아이디가 공백이 아닐 때만 Map에 저장
//		등급에 "-"가 포함되지 않았을 때만 Map에 저장
//		회원상태에 "-"가 포함되지 않았을 때만 Map에 저장
//		시작일-종료일이 모두 넘어왔을 때만 Map에 저장하는데 날짜를 정렬시키고 적당히 잘라낸 상태여야함
		
		HashMap<String, String> op = new HashMap<String, String>();
		op.put("id", users.getId());
		op.put("grade", users.getGrade());
		op.put("usersStatus", users.getUsersStatus());
		op.put("beginDt", beginDt);
		op.put("endDt", endDt);
		
//		검색 조건을 Map에 저장할 수 있도록 가공하자. 왜냐하면 기간 검색에 대한 날짜도 같이 전달해줘야 하는데 Users객체에는 모두 담을 수가 없기 때문이다.
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(users.getId() != null) map.put("id", users.getId());
		
		if(!users.getGrade().equals("-")) {
			switch (users.getGrade()) {
			case "normal" : map.put("grade", "B"); break;
			case "sup" : map.put("grade", "A"); break;
			case "admin" : map.put("grade", "S"); break;
			}
		}
		
		if(!users.getUsersStatus().equals("-")) {
			map.put("usersStatus", users.getUsersStatus());
		}
		
		if(beginDt.length() > 0 && endDt.length() > 0) { // 시작일자와 종료일자를 모두 입력받았을 때만 Map에 날짜를 저장한다.
			String[] beginArr = beginDt.split("-");
			String[] endArr = endDt.split("-");
			Date begin = new Date(Integer.parseInt(beginArr[0])-1900, Integer.parseInt(beginArr[1])-1, 
					Integer.parseInt(beginArr[2]));
			Date end = new Date(Integer.parseInt(endArr[0])-1900, Integer.parseInt(endArr[1])-1, Integer.parseInt(endArr[2]));
			
			Date start = begin.getTime() <= end.getTime() ? begin : end; 
			Date finish = begin.getTime() > end.getTime() ? begin : end;
			
			map.put("beginDate", start.toString().substring(2));
			map.put("endDate", finish.toString().substring(2));
		}
		
		map.put("flag", "search"); // mapper에서 검색결과를 위한 listCount인지 전체목록조회를 위한 listCount인지 구분짓는 용도
		
//		페이징 처리된 목록을 가져온다.
		int listCount = aService.usersListCount(map);
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Users> list = aService.usersSelectList(map, pi);
		
//		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("op", op); // View로 검색조건을 함께 넘겨주어야 이후에 페이징 처리가 지속될 수 있음!
		
		mv.setViewName("userList");
		
		return mv;
	}
	
	// 회원 상태 변경 (회원 Y/N)
	@RequestMapping("updateStatus.ad")
	@ResponseBody // 비동기 통신에 대한 텍스트 응답
	public String updateStatus(@ModelAttribute Users user) {
		int result = aService.updateStatus(user);
		return result == 1 ? "success" : "fail";
	}
	
	
	// 회원정보 상세조회 : userInfo.ad?usersNo=1&page=3
	@RequestMapping("userInfo.ad")
	public ModelAndView userInfo(@RequestParam("usersNo") int usersNo, 
									@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		Users user = aService.userInfo(usersNo);
		
		if(user != null) {
			mv.addObject("user", user);
			mv.addObject("page", currentPage);
			mv.setViewName("userInfo");
		} else {
			throw new AdminException("회원정보 상세보기에 대한 서비스 요청이 실패하였습니다.");
		}
		return mv;
	}
	
	//탈퇴자 이메일 응답
	@RequestMapping("leaveMsg.ad")
	@ResponseBody
	public String sendEmail(@RequestParam("toEmail") String toEmail,
							@RequestParam("sendTitle") String sendTitle,
							@RequestParam("sendText") String sendText) {
		String result = aService.sendEmail(toEmail, sendTitle, sendText);
		return result;
	}
	
	
	// 회원정보 수정 페이지 userModifyForm.ad?usersNo=30&page=3
	@RequestMapping("userModifyForm.ad")
	public String userModifyForm(@RequestParam("usersNo") int usersNo,
									@RequestParam("page") int currentPage, Model model) {
		Users user = aService.userInfo(usersNo);
		
		if(user != null) {
			model.addAttribute("user", user);
			model.addAttribute("page", currentPage);
			return "userModify";
		} else {
			throw new AdminException("회원정보 수정 서비스 요청이 실패하였습니다.");
		}
	}
	
	// 회원정보 중 닉네임과 신고횟수 업데이트 요청 userModify.ad
	@RequestMapping("userModify.ad")
	public String userModify(@RequestParam("page") int currentPage,
								@ModelAttribute Users user, Model model) {
		int result = aService.userModify(user);
		
		if(result > 0) {
			model.addAttribute("page", currentPage);
			model.addAttribute("usersNo", user.getUsersNo());
			return "redirect:userInfo.ad";
		} else {
			throw new AdminException("회원정보 수정에 실패하였습니다.");
		}
	}
	
	// 회원정보 중 비밀번호 초기화 요청
	@RequestMapping("pwdReset.ad")
	@ResponseBody
	public String pwdReset(@RequestParam("usersNo") int usersNo, @RequestParam("toEmail") String toEmail) {
		// 초기화된 비밀번호를 생성하고 암호화한다.
		String newPwd = TempKey.generateKey(10);
		String newPwdEncode = bCrypt.encode(newPwd); // 인코딩
		
		// 초기화된 비밀번호를 사용자에게 메일 전송
		String sendTitle = "회원님의 비밀번호가 초기화되었습니다.";
		String eResult = aService.pwdReset(toEmail, sendTitle, newPwd);
		// 초기화된 비밀번호의 인코딩된 결과를 DB에 저장
		Users u = new Users();
		u.setUsersNo(usersNo);
		u.setPwd(newPwdEncode);
		int uResult = aService.pwdResetUpdate(u);
		
		if(eResult.equals("success") && uResult > 0) return "success";
		else return "fail";
	}
	
	// 회원 등급 변경 요청
	@RequestMapping("updateGrade.ad")
	@ResponseBody
	public String updateGrade(@ModelAttribute Users user) {
		switch(user.getGrade()) {
		case "관리자" : user.setGrade("S"); user.setIsManager("Y"); break;
		case "우수" : user.setGrade("A"); break;
		case "일반" : user.setGrade("B"); break;
		}
		int result = aService.updateGrade(user);
		return result == 1 ? "success" : "fail";
	}
	
	//게임목록 출력
	@RequestMapping("gameList.ad")
	public String gameList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
//		2) 게임 목록 정보를 조회해온다 (게임번호, 게임명, 제조사, 게임장르, 게임시간, 게임난이도, 게임인원, 거래건, 모임건)
		int listCount = aService.gameListCount(null); // 게임 테이블의 컬럼갯수만 알아오면 됨
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10); // 우선은 boardLimit를 10으로 설정 => 앨범형으로 바꿀시에는 바뀔 수 있음
		ArrayList<Game> list = aService.gameList(null, pi);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "gameList";
		} else {
			throw new AdminException("조회결과가 없습니다.");
		}
	}
	
	@RequestMapping("searchGame.ad")
	public String searchGame(@RequestParam("searchOption") String searchOption,
								@RequestParam("searchContent") String searchContent,
								@RequestParam(value="page", defaultValue="1") int currentPage,
								Model model) {
		// 파라미터 전달받기
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchContent", searchContent);
		
		// PageInfo 객체 생성
		int listCount = aService.gameListCount(map);
		
		
		
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Game> list = aService.gameList(map, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("map", map);
		
		return "gameList";
	}
	
	@RequestMapping("deleteGame.ad")
	@ResponseBody
	public void deleteGame(@RequestParam("gameNoArr[]") ArrayList<String> gameNoList,
							@RequestParam("gameImgArr[]") ArrayList<String> gameImgList,
								PrintWriter out) {
		// View에서 전달한 JS Array는 배열명[]=[96, 95] 와 같이 넘어오기 때문에 파라미터명을 "배열명[]"으로 받아와야함 
		int gResult = aService.deleteGame(gameNoList);
		int iResult = aService.deleteImage(gameImgList); 
		
		if(gResult == gameNoList.size()) {
			out.print("success");
		} else {
			throw new AdminException("서비스 요청이 실패하였습니다.");
		}
	}
	
	// 추가할 게임 정보를 입력할 수 있는 페이지로 이동
	@RequestMapping("insertGameForm.ad")
	public String insertGameForm() {
		return "gameAdd";
	}
	
	//
	@RequestMapping("insertGame.ad") //
	public String insertGame(@RequestParam("gameName") ArrayList<String> gameNames,
							 	@RequestParam("gameCompany") ArrayList<String> gameCompanys,
							 	@RequestParam("gameGenre") ArrayList<String> gameGenres,
							 	@RequestParam("gamePlayTime") ArrayList<Integer> gamePlayTimes,
							 	@RequestParam("gameLevel") ArrayList<Double> gameLevels,
							 	@RequestParam("gamePeople") ArrayList<Integer> gamePeoples,
								@RequestParam("gameImage") ArrayList<MultipartFile> files,
								HttpServletRequest request) {
		if(gamePeoples.get(0) == null) {
			throw new AdminException("게임 목록 등록 중 에러 발생");
		}
		
//		3) 전달받은 게임정보(들)를 Game객체로 바꾸어 저장한다.
		ArrayList<Game> gList = new ArrayList<Game>();
		
		// 게임 장르 가공
		String[] genreArr = null;
		
		String genre = ""; // 가공끝낸 장르들을 ,로 연결지어서 저장할 문자열
		int check = 0;
		for(Integer i : gamePeoples) {
			if(i != null) check++;
		}
		
		for(int i = 0; i < check; i++) {
			ArrayList<String> genreList = new ArrayList<String>(); // "-"가 포함되지않은 장르가 몇개일지 모르기 때문에 List로 저장하자
			Game game = new Game();
			
			game.setGameName(gameNames.get(i));
			game.setGameCompany(gameCompanys.get(i));
			
			genreArr = gameGenres.get(i).split("/");
			
			
			for(String g : genreArr) {
				if(!g.contains("-")) {
					genreList.add(g); // "-"가 포함된 항목을 걸러내고 List에 저장
				}
			}
			
			Collections.sort(genreList); // List를 정렬
			for(int k = 0; k < genreList.size(); k++) {
				if(k != genreList.size() - 1) {
					genre += genreList.get(k) + ",";
				}
				else {
					genre += genreList.get(k);
				}
				game.setGameGenre(genre);
				genre = "";
			}
			
			game.setGamePlayTime(gamePlayTimes.get(i));
			game.setGameLevel(gameLevels.get(i));
			game.setGamePeople(gamePeoples.get(i));
			
			gList.add(game);
		}
		
//		4) Game객체(들)을 DB에 삽입한다.
		int gResult = aService.insertGame(gList);		
		
//		** 새롭게 생겨난 게임번호들을 받아온다 => rownum으로 골라오기 위해 1을 증가시켰다
		ArrayList<Integer> newGameNoList = aService.newGameNoList(gList.size()+1); 
		
//		1) 전달받은 MultipartFile 객체들을 Image 객체로 바꾸어 저장한다.
		ArrayList<Image> iList = new ArrayList<Image>();
		for(int i = 0; i< files.size(); i++) {
			MultipartFile upload = files.get(i);
			if(upload != null && !upload.isEmpty()) {
				String renameFileName = saveFile(upload, request);
				Image img = new Image();
				img.setImgName(upload.getOriginalFilename());
				img.setImgRename(renameFileName);
				img.setImgGroup('G'); // 게임목록의 이미지를 "G" 그룹으로 가정한다.
				img.setImgRefNo(newGameNoList.get(i));
				iList.add(img);
			}
		}
		
//		2) Image 객체들을 DB에 삽입한다. 이 때 DB에서 발생한 imgId값을 가져와야 한다.
		int iResult = aService.insertGameImage(iList);
		// 삽입 실패시 저장소에서 삭제하는 코드를 추가한다.
		ArrayList<Integer> imageIdList = aService.imageIdList(iList);
		if(iResult < iList.size()) {
			for(Image img : iList) {
				deleteFile(img.getImgRename(), request);
			}
		}
		
//		5) Image객체들과 Game객체들의 삽입결과에 따라 View를 분기한다.
		if(iResult == iList.size() && gResult == gList.size()) return "redirect:gameList.ad";
		else throw new AdminException("게임 등록 요청에 실패하였습니다."); 
	}
	
	// MultipartFile객체에 대한 파일을 1) 저장소 지정 및 생성 후 저장 2) 리네임을 지정하여 저장소 위치와 리네임을 반환 
	public String saveFile(MultipartFile upload, HttpServletRequest request) {
//		1) 저장소 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources")
							+ "\\uploadFiles";
//		2) 저장소 생성
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs();
		
//		3) 리네임 지정
		int ranNum = (int)(Math.random()*100000);
		String originalFileName = upload.getOriginalFilename(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String renameFileName = sdf.format(new java.util.Date()) + ranNum
									+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
//		4) 저장소에 업로드된 파일의 복사본을 저장한다.
		String renamePath = folder + "\\" + renameFileName; // 복사할 파일 대한 경로를 지정
		try {
			upload.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
//		5) 리턴
		return renameFileName;
	}
	
	public void deleteFile(String rename, HttpServletRequest request) {
//		1) 저장소에 접근한다.
		String savePath = request.getSession().getServletContext().getRealPath("resources")
							+ "\\uploadFiles";
//		2) 저장소 내의 해당 파일에 접근한다.
		File saveFile = new File(savePath + "\\" + rename);
//		3) 저장소에서 해당 파일을 삭제한다.
		if(saveFile.exists()) saveFile.delete();
	}
	
//	게임정보 조회 : gameDetail.ad?gameNo=136
	@RequestMapping("gameDetail.ad")
	public String gameDetail(@RequestParam("gameNo") Integer gameNo, Model model) {
		Game game = aService.gameDetail(gameNo);
		if(game != null) {
			model.addAttribute("game", game);
			
			String[] genreArr = game.getGameGenre().split(",");
			model.addAttribute("genre0", genreArr[0]);
			if(genreArr.length > 1) {
				model.addAttribute("genre1", genreArr[1]);
			}
			if(genreArr.length > 2) {
				model.addAttribute("genre2", genreArr[2]);
			}
			return "gameDetail";
		} else {
			throw new AdminException("게임 목록 조회에 실패하였습니다.");
		}
	}
	
	// 게임 정보 수정 페이지로 이동
	@RequestMapping("gameEditForm.ad")//gameEditForm.ad?gameNo=136
	public String gameEditForm(@RequestParam("gameNo") int gameNo, Model model) {
		Game game = aService.gameDetail(gameNo);
		if(game != null) {
			model.addAttribute("game", game);
			
			String[] genreArr = game.getGameGenre().split(",");
			model.addAttribute("genre0", genreArr[0]);
			if(genreArr.length > 1) {
				model.addAttribute("genre1", genreArr[1]);
			}
			if(genreArr.length > 2) {
				model.addAttribute("genre2", genreArr[2]);
			}
			return "gameEdit";
		} else {
			throw new AdminException("게임 정보 조회에 실패하였습니다.");
		}
	}
	
	// 게임정보 수정 중 게임이름에 대한 중복확인
	@RequestMapping("checkGameName.ad")
	@ResponseBody
	public String checkGameName(@RequestParam("gameName") String gameName) {
		int result = aService.checkGameName(gameName);
		return result == 0? "success" : "fail";
	}
	
	// 게임 정보 수정
	@RequestMapping("updateGame.ad") 
	public String updateGame(@ModelAttribute Game game, @RequestParam("delAnswer") String delAnswer, 
								@RequestParam("delInfo") String delInfo,
								@RequestParam("upload") MultipartFile upload,
								HttpServletRequest request) {
		int iResult = 0; // 새로운 이미지를 저장한 반환값 저장
		int gResult = 0; // 게임정보를 수정한 반환값 저장
		
		String delImgId = delInfo.split("/")[0];
		String delImgRename = delInfo.split("/")[1];
		
		String[] genreArr = game.getGameGenre().split(",");
		ArrayList<String> genreList = new ArrayList<String>();
		String genre = ""; // 가공을 끝낸 장르를 저장할 문자열
		for(String g : genreArr) {
			if(!g.contains("-")) genreList.add(g);
		}
		Collections.sort(genreList);
		for(int i = 0; i < genreList.size(); i++) {
			if(i != genreList.size() - 1) genre += genreList.get(i) + ",";
			else genre += genreList.get(i);
		}
		game.setGameGenre(genre);
		
//		1) MultipartFile 객체를 Image객체로 가공하고 기존의 이미지를 삭제한다.
		Image img = new Image();
//		기존의 파일을 삭제하겠다고 한 경우
//			1) 기존의 이미지 파일을 삭제한다. : 저장소, DB
//			2) 게임 정보를 수정한다.
//			3) 새로운 이미지를 삽입한다.
		if(delAnswer.contains("ON")) { // 기존의 이미지 파일을 삭제하겠다는 경우 => 가공 필요
			img.setImgGroup('G');
			img.setImgName(upload.getOriginalFilename());
			img.setImgRename(saveFile(upload, request)); // 저장소에 새로운 이미지를 저장
			img.setImgRefNo(game.getGameNo());
			
			deleteFile(delImgRename, request); // 1-1) [저장소]에서 기존의 이미지 파일을 삭제
			int delResult = aService.realDeleteImage(delImgId); // 1-2) [DB]에서 기존의 이미지를 삭제

			gResult = aService.updateGame(game); // 2) 게임정보를 수정한다.
			
			iResult = aService.updateGameImage(img); // 3) DB에 새로운 이미지 저장
			if(iResult == 0) {
				deleteFile(img.getImgRename(), request); // 새로운 이미지 저장에 실패했으면 저장소에서도 그 이미지를 날려야함
			}
		} else { // 기존의 이미지 파일을 삭제하지 않겠다는 경우 => 1) 게임 정보를 수정
			gResult = aService.updateGame(game);
		}
		
		if(gResult == 1) {
			return "redirect:gameDetail.ad?gameNo=" + game.getGameNo();
		} else {
			throw new AdminException("게임정보 수정에 대한 요청이 실패하였습니다.");
		}
	}
	
	@RequestMapping("reportList.ad")
	public String reportList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
//		2) 신고 목록 정보를 조회해온다 (신고번호, 신고회원, 신고대상, 글번호, 신고일자, 신고메시지, 신고컴펌)
		int listCount = aService.reportListCount(null);
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		////페이징 처리된 컨텐츠 정보 조회//
		ArrayList<Report> list = aService.reportAllList(pi);
		
//		3) 신고 목록 정보를 Model.addAttribute()로 저장하여 View(reportList.jsp)로 이동한다.
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			throw new AdminException("신고목록 조회 요청에 실패하였습니다.");
		}
		return "reportList";
	}
	
	// 신고목록 검색 기능
	@RequestMapping("searchReport.ad")
	public String searchReport(@RequestParam("sel") String sel, @RequestParam("targetId") String targetId,
								@RequestParam("beginDt") String beginDt, @RequestParam("endDt") String endDt,
								@RequestParam(value="page", defaultValue="1") int currentPage,
								Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", "exist");
		
		if(!targetId.equals("") && !beginDt.equals("") && !endDt.equals("")) {
			ArrayList<Integer> userNoList = aService.getUserNo(targetId);
			map.put("sel", sel.substring(0,6) + "_" + sel.substring(6));
			map.put("targetId", userNoList);
			
			String[] beginArr = beginDt.split("-");
			String[] endArr = endDt.split("-");
			
			Date begin = new Date(Integer.parseInt(beginArr[0])-1900, Integer.parseInt(beginArr[1])-1,
									Integer.parseInt(beginArr[2]));
			Date end = new Date(Integer.parseInt(endArr[0])-1900, Integer.parseInt(endArr[1])-1,
					Integer.parseInt(endArr[2]));
			Date orderBegin = begin.getTime() <= end.getTime() ? begin : end;
			Date orderEnd = begin.getTime() > end.getTime() ? begin : end;
			
			map.put("beginDate", orderBegin.toString().substring(2));
			map.put("endDate", orderEnd.toString().substring(2));
		} else if(!targetId.equals("")) { // 아이디 검색을 요청한 경우
			ArrayList<Integer> userNoList = aService.getUserNo(targetId); // 아이디가 포함된 회원번호들을 조회
			map.put("sel", sel.substring(0,6) + "_" + sel.substring(6));
			map.put("targetId", userNoList);
		} else if(!beginDt.equals("") && !endDt.equals("")) {
			// 날짜 정렬
			String[] beginArr = beginDt.split("-");
			String[] endArr = endDt.split("-");
			
			Date begin = new Date(Integer.parseInt(beginArr[0])-1900, Integer.parseInt(beginArr[1])-1,
									Integer.parseInt(beginArr[2]));
			Date end = new Date(Integer.parseInt(endArr[0])-1900, Integer.parseInt(endArr[1])-1,
					Integer.parseInt(endArr[2]));
			Date orderBegin = begin.getTime() <= end.getTime() ? begin : end;
			Date orderEnd = begin.getTime() > end.getTime() ? begin : end;
			
			map.put("beginDate", orderBegin.toString().substring(2));
			map.put("endDate", orderEnd.toString().substring(2));
		} 
		
		int listCount = aService.reportListCount(map);
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Report> list = aService.reportSearchList(map, pi);
		HashMap<String, String> op = new HashMap<String, String>();
		op.put("sel", sel);
		op.put("targetId", targetId);
		op.put("beginDt", beginDt);
		op.put("endDt", endDt);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("op", op);
		} else {
			throw new AdminException("신고목록 조회 요청에 실패하였습니다.");
		}
		return "reportList";
	}
	
	//신고목록 중 미처리만 보기
	@RequestMapping("noConfirmReport.ad")
	public String noConfirmReport(@RequestParam(value="page", defaultValue="1") int currentPage,
									Model model) {
		int listCount = aService.noConfirmListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Report> list = aService.noConfirmReportList(pi);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "reportList";
		} else {
			throw new AdminException("신고 목록 조회에 실패하였습니다");
		}
	}
	
	// 신고글 상태 변경
	@RequestMapping("updateReport.ad")
	@ResponseBody
	public String updateReport(@ModelAttribute Report report) {
		int result = aService.updateReport(report);
		
		if(result > 0) {
			return result > 0 ? "success" : "fail";
		} else {
			throw new AdminException("신고목록 컨펌변경에 대한 요청이 실패하였습니다.");
		}
	}
	
	@RequestMapping("weekReportList.ad")
	public String weekReportList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		int listCount = aService.weekReportListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
//		System.out.println(pi);
		
		ArrayList<Report> list = aService.weekReportList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("term", "week");
		return "reportList";
	}
	
	@RequestMapping("weekQueryList.ad") // 일추일치 문의글 목록 출력
	public String weekQueryList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		int listCount = aService.weekQueryListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<BoardQuery> qList = aService.weekQueryList(pi);
		model.addAttribute("qList", qList);
		model.addAttribute("pi", pi);
		model.addAttribute("term", "week");
		return "queryList";
	}
	
	
	
	@RequestMapping("AllQueryList.ad") // 전체 문의글 목록 출력
	public String queryList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		int listCount = aService.AllQueryListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<BoardQuery> qList = aService.AllQueryList(pi);
		model.addAttribute("qList", qList);
		model.addAttribute("pi", pi);
		model.addAttribute("term", "all");
		return "queryList";
	}
	
	@RequestMapping("noConfirmQuery.ad")
	public String noConfirmQuery(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		int listCount = aService.noConfirmQueryListCount();
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<BoardQuery> qList = aService.noConfirmQuery(pi);
		model.addAttribute("qList", qList);
		model.addAttribute("pi", pi);
		return "queryList";
	}
	
	@RequestMapping("updateQuery.ad")
	@ResponseBody
	public String updateQuery(@RequestParam("refBoardNo") int refBoardNo, @RequestParam("queryConfirm") String changeConfirm) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("refBoardNo", refBoardNo);
		map.put("changeConfirm", changeConfirm);
		int result = aService.updateQuery(map);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("queryDetail.ad")
	public String queryDetail(@RequestParam("page") int currentPage, @RequestParam("queryNo") int queryNo, Model model) {
		BoardQuery query = aService.queryDetail(queryNo);
		Board board = aService.queryBoardDetail(queryNo);
		
		if(query == null || board == null) {
			throw new AdminException("문의글 상세조회 요청에 실패하였습니다.");
		} else {
			model.addAttribute("query", query);
			model.addAttribute("board", board);
			model.addAttribute("page", currentPage);
			
			return "queryDetail";
		}
	}
	
	@RequestMapping("deleteQuery.ad")
	@ResponseBody
	public String deleteQuery(@RequestParam("boardNo") int boardNo) {
		int bResult = aService.deleteBoardQuery(boardNo);
		return bResult == 1 ? "success" : "fail";
	}
	
	@RequestMapping("getEmail.ad")
	@ResponseBody
	public String getEmail(@RequestParam("usersNo") int usersNo) {
		String email = aService.getEmail(usersNo);
		return email;
	}
	
	@RequestMapping("querySendEmail.ad")
	@ResponseBody
	public String querySendEmail(@RequestParam("toEmail") String toEmail, @RequestParam("sendTitle") String sendTitle,
									@RequestParam("sendText") String sendText) {
		return sendEmail(toEmail, sendTitle, sendText);
	}
	
	@RequestMapping("searchQuery.ad")
	public String searchQuery(@RequestParam(value="queryReason", required=false) String queryReason, 
								@RequestParam(value="beginDt", required=false) String beginDt,
								@RequestParam(value="endDt", required=false) String endDt,
								@RequestParam(value="page", defaultValue="1") int currentPage,
								Model model)  {
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(!queryReason.equals("")) {
			map.put("queryReason", queryReason);
		}
		if(!beginDt.equals("") && !endDt.equals("")) {
			String[] beginArr = beginDt.split("-");
			String[] endArr = endDt.split("-");
			
			Date begin = new Date(Integer.parseInt(beginArr[0])-1900, Integer.parseInt(beginArr[1])-1,
									Integer.parseInt(beginArr[2]));
			Date end = new Date(Integer.parseInt(endArr[0])-1900, Integer.parseInt(endArr[1])-1,
					Integer.parseInt(endArr[2]));
			Date orderBegin = begin.getTime() <= end.getTime() ? begin : end;
			Date orderEnd = begin.getTime() > end.getTime() ? begin : end;
			
			map.put("beginDate", orderBegin.toString().substring(2));
			map.put("endDate", orderEnd.toString().substring(2));
		}
		
		int listCount = aService.searchQueryListCount(map);
		PageInfo pi = AdminPagination.getPageInfo(currentPage, listCount, 10);
		
		
		ArrayList<BoardQuery> qList = aService.searchQueryList(map, pi);
		model.addAttribute("qList", qList);
		model.addAttribute("pi", pi);
		model.addAttribute("term", "search");
		model.addAttribute("op", map);
		
		return "queryList";
	}
}
