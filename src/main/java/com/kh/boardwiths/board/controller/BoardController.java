package com.kh.boardwiths.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.exception.BoardException;
import com.kh.boardwiths.board.model.service.BoardService;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.common.BoardPagination;
import com.kh.boardwiths.users.model.vo.Users;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public String selectBoardList(@RequestParam(value="page", defaultValue="1") int currentPage,
			@RequestParam(value="category", defaultValue="0") String category, HttpSession session, Model model) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		String checkMgr = null;
		ArrayList<Board> list = null;
		if(loginUser != null) {
			checkMgr = loginUser.getIsManager();
		}
		
		HashMap<String, String> map = new HashMap();
			map.put("category", category);
		
		int listCount = bService.getListCount(map);
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		if(!category.equals("6")) {
			list = bService.selectBoardList(pi, map);
		}
		
		if(list != null) {
			Map<Integer, Integer> boardLikesMap = new HashMap();
			for (Board board : list) {
	            int bNo = board.getBoardNo();
	            int boardLikes = bService.countBLikes(bNo);
	            boardLikesMap.put(bNo, boardLikes);
	        }
			if(checkMgr != null) {
				model.addAttribute("checkMgr", checkMgr);
			}
			if(category != "0") {
				model.addAttribute("category", category);
			}
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("boardLikesMap", boardLikesMap);
			return "boardList";
		}
		throw new BoardException("페이지 불러오기에 실패했습니다.");
	}
	
	@RequestMapping("selectBoard.bo")
	public String selectBoard(@RequestParam("bNo") int bNo, @RequestParam("page") int page, HttpSession session, Model model) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		int loginUsersNo = 0;
		if(loginUser != null) {
			loginUsersNo = loginUser.getUsersNo();
		}
		//게시글 일반 (조회수 검색을 위해 loginUsersNo)
		Board board = bService.selectBoard(bNo, loginUsersNo);
		if(board.getCategory().equals("6") && loginUsersNo != board.getUsersNo()) {
			throw new BoardException("게시글 상세조회에 실패했습니다.");
		} 
		
		switch(board.getCategory()) {
		//게시글 마켓
			case "2": case "3": case "2,3":
				BoardMarket bmk = bService.selectBoardMarket(bNo);
				model.addAttribute("bmk", bmk);	
				break;
		//게시글 매칭
			case "4": case "5": case "4,5":
				BoardMatching bmc = bService.selectBoardMatching(bNo);
				model.addAttribute("bmc", bmc);
		//게시글 문의
			case "6": 
				BoardQuery bq = bService.selectBoardQuery(bNo);
				model.addAttribute("bq", bq);
		}
		
		//댓글
		ArrayList<Comments> cList = bService.selectComments(bNo);
		//게시글 좋아요
		int boardLikes = bService.countBLikes(bNo); // 좋아요 수
		int checkBLikes = checkBLikes(bNo, loginUsersNo); // 좋아요 여부
		//게임
		Game refGame = bService.selectGame(bNo);
		String GimgRename = "";
		if(board.getGameNo() != 0) {
			HashMap<String, Object> gmap = new HashMap();
			gmap.put("imgGroup", 'G');
			gmap.put("refNo", refGame.getGameNo());
			GimgRename = bService.selectImageRename(gmap);
			model.addAttribute("GimgRename", GimgRename);
		}
		//첨부사진파일
		String BimgRename = "";
		HashMap<String, Object> bmap = new HashMap();
		bmap.put("imgGroup", 'B');
		bmap.put("refNo", bNo);
		BimgRename = bService.selectImageRename(bmap);
		if(BimgRename != null) {
		model.addAttribute("BimgRename", BimgRename);
		}
		
			model.addAttribute("g", refGame);
			model.addAttribute("b", board);
			model.addAttribute("page", page);
			model.addAttribute("checkBLikes", checkBLikes);
			model.addAttribute("boardLikes", boardLikes);
			model.addAttribute("cList", cList);
			return "boardDetail";
	}

	@RequestMapping("searchBoardList.bo")
	public String searchBoardList(@RequestParam(value="page", defaultValue="1") int currentPage,
			@RequestParam(value="category", defaultValue="0") String category,  @RequestParam("condition") String condition, @RequestParam("value") String value, HttpSession session, Model model) {
			
		Users loginUser = (Users)session.getAttribute("loginUser");
		String checkMgr = null;
		if(loginUser != null) {
			checkMgr = loginUser.getIsManager();
		}
		
		HashMap<String, String> map = new HashMap();
			map.put("condition", condition);
			map.put("value", value);
			map.put("category", category);
			
			int listCount = bService.getSearchListCount(map);
			PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
			ArrayList<Board> list = bService.selectSearchList(pi, map);
			
		if(list != null) {
			Map<Integer, Integer> boardLikesMap = new HashMap();
			for (Board board : list) {
	            int bNo = board.getBoardNo();
	            int boardLikes = bService.countBLikes(bNo);
	            boardLikesMap.put(bNo, boardLikes);
	        }
			if(checkMgr != null) {
				model.addAttribute("checkMgr", checkMgr);
			}
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("boardLikesMap", boardLikesMap);
			model.addAttribute("category", category);
			model.addAttribute("condition", condition);
			model.addAttribute("value", value);
			return "boardList";
		}
		throw new BoardException("페이지 불러오기에 실패했습니다.");
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(@RequestParam("boardNo") int bNo,@RequestParam("category") String category) {
		int result = bService.deleteBoard(bNo);
		
		if(result > 0) {
			return "redirect:list.bo?category="+category;
		} else {
			throw new BoardException("게시글 삭제에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="insertComments.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String insertReply(@ModelAttribute Comments c) {
		int result = bService.insertComments(c);
		ArrayList<Comments> list = bService.selectComments(c.getRefBoardNo());
		
		JSONArray array = new JSONArray();
		for(Comments com : list) {
			JSONObject json = new JSONObject(); // {key:value}
			json.put("comNo", com.getComNo());
			json.put("usersNo", com.getUsersNo());
			json.put("nickname", com.getNickname());
			json.put("refBoardNo", com.getRefBoardNo());
			json.put("comContent", com.getComContent());
			json.put("comDate", com.getComDate());
			
			array.put(json);
		}
		return array.toString();
	}
	
	@RequestMapping("deleteComments.bo")
	@ResponseBody
	public String deleteReply(@RequestParam("comNo") int comNo) {
		int result = bService.deleteComments(comNo);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("updateComments.bo")
	@ResponseBody
	public String updateReply(@ModelAttribute Comments c) {
		int result = bService.updateComments(c);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("countBLikes.bo")
	public int countBLikes(@RequestParam("boardNo") int bNo) {
		int result = bService.countBLikes(bNo);
		return result;
	}
	
	public int checkBLikes(int refBoardNo, int loginUsersNo) {
		HashMap<String, Integer> map = new HashMap();
		map.put("refBoardNo", refBoardNo);
		map.put("loginUsersNo", loginUsersNo);
		
		int result = bService.checkBLikes(map);
		return result;
	}
	
	@RequestMapping(value="insertBLikes.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String insertBLikes(@RequestParam("boardNo") int bNo, HttpSession session) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		int loginUsersNo = 0;
		if(loginUser != null) {
			loginUsersNo = loginUser.getUsersNo();
		}
		
		JSONObject json = new JSONObject();
		if(loginUsersNo == 0) {
			json.put("result", -1); // Specific result for unauthenticated user
			return json.toString();
		}
		
	    HashMap<String, Integer> map = new HashMap<>();
	    map.put("refBoardNo", bNo);
	    map.put("loginUsersNo", loginUsersNo);
	    
	    int result = bService.insertBLikes(map);
	    json.put("result", result);
	    return json.toString();
	}
	
	@RequestMapping(value="deleteBLikes.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteBLikes(@RequestParam("boardNo") int bNo, HttpSession session) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		int loginUsersNo = 0;
		if(loginUser != null) {
			loginUsersNo = loginUser.getUsersNo();
		}
		HashMap<String, Integer> map = new HashMap();
		map.put("refBoardNo", bNo);
		map.put("loginUsersNo", loginUsersNo);
		
		int result = bService.deleteBLikes(map);
			JSONObject json = new JSONObject();
			json.put("result", result);
		return json.toString();
	}
	
	@RequestMapping("queryList.bo")
	public String selectBoardQueryList(@RequestParam(value="page", defaultValue="1") int currentPage, HttpSession session, Model model) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		String category = "6";
		String checkMgr = null;
		int loginUsersNo = 0;
		if(loginUser != null) {
			checkMgr = loginUser.getIsManager();
			loginUsersNo = loginUser.getUsersNo();
		}
			
		int listCount = bService.getBoardQueryListCount(loginUsersNo);
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectBoardQueryList(pi, loginUsersNo);
		if(checkMgr != null && list != null) {
			model.addAttribute("checkMgr", checkMgr);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("category", category);
			return "queryList";
		}
		throw new BoardException("페이지 불러오기에 실패했습니다.");
	}
	
	// 구매/판매/매칭 게임 검색버튼을 눌렀을때 데이터출력
		@RequestMapping(value = "/selectGameList.bo", method = RequestMethod.POST)
		@ResponseBody public List<Game> selectGameList(@RequestParam("gameName")String gameName) {
			ArrayList<Game> glist = bService.selectGameList(gameName);
			
		    return glist;
		}
		@RequestMapping("buy.bo")
		public String buy() {
		    return "buy";
		}
		
		@RequestMapping("matching.bo")
		public String matching() {
		    return "matching";
		}
		
		@RequestMapping("review.bo")
		public String review(HttpSession session, Model model) {
			
			//로그인 유저 No 가져오기
			Users loginUser = (Users)session.getAttribute("loginUser");
			int loginUsersNo = loginUser.getUsersNo();
					
			ArrayList<Board> list = bService.selectMyMatBoard(loginUsersNo);
			
			model.addAttribute("list", list);
			
		    return "review";
		}
		
		@RequestMapping("query.bo")
		public String query() {
		    return "query";
		}
		
		@RequestMapping("notice.bo")
		public String notice() {
		    return "notice";
		}
		

		//문의사항 작성(,제거 필요)
		@RequestMapping("insertQuery.bo")
		public String insertQuery(@ModelAttribute BoardQuery boardQuery, @ModelAttribute Board b, Model model, HttpSession session) {
			
			b.setCategory("6");
			b.setBoardNo(b.getBoardNo());
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());
			int result1 = bService.insertBasicInfo(b);
			
			boardQuery.setRefBoardNo(b.getBoardNo());
			boardQuery.setQueryReason(boardQuery.getQueryReason() + " : " +boardQuery.getOtherReason());
			int result2 = bService.insertQuery(boardQuery);
			if(result1 + result2 > 1) {
				return "redirect:queryList.bo";
			} else {
				return "게시글 작성 실패";
			}
				
		}
		
		//공지사항 작성(완료)
		@RequestMapping("insertNotice.bo")
		public String insertNotice(@ModelAttribute Board b, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
			Image img = new Image();
			
			b.setCategory("1");
			b.setGameNo(0);
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());
			int result1 = bService.insertBasicInfo(b);
			
			int result3 = 0;
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));	
				result3 = bService.insertBoardImg(img);
			}
			
			
			int totalResult = result1 +  result3;
			
			if(totalResult > 0) {
				return "redirect:list.bo?category=1";
			}else {
				return "게시글 작성 실패";
			}
			
		}
		
		//후기작성(내글 목록 추가)
		@RequestMapping("insertReview.bo")
		public String insertReview(@RequestParam("myMatBoardNo") int boardN, @ModelAttribute Board b, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
			Image img = new Image();
			Board board = bService.selectBoardT(boardN);

			Game refGame = bService.selectGame(board.getBoardNo());

			b.setCategory("5");
			b.setGameNo(refGame.getGameNo());
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());
			int result1 = bService.insertBasicInfo(b);
			
			int result3 = 0;
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));
				result3 = bService.insertBoardImg(img);
			}

			int totalResult = result1 +  result3;
			
			if(totalResult > 0) {
				return "redirect:list.bo?category=4,5";
			} else {
				return "게시글 작성 실패";
			}
		}
		
		// 매칭
		@RequestMapping("insertMatching.bo")
		public String insertMatching(@ModelAttribute BoardMatching boardMatching, @ModelAttribute Board b,@RequestParam("file") MultipartFile file, HttpServletRequest request, Model model, HttpSession session) {
			Image img = new Image();
			
			b.setCategory("4");
			b.setGameNo(b.getGameNo());
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());
			int result1 = bService.insertBasicInfo(b);
			
			int result2 = 0;
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));	
				result2 = bService.insertBoardImg(img);
			}

			boardMatching.setRefBoardNo(b.getBoardNo());
			boardMatching.setPlace(boardMatching.getPlace()+ " " +boardMatching.getPAddress());
			
			int result3 = bService.insertMatchingInfo(boardMatching);
			int totalResult = result1 + result2 + result3;
			
			if(totalResult > 1) {
				return "redirect:list.bo?category=4,5";
			} else {
				return "게시글 작성 실패";
			}
		}
		
		// 구매/판매 게시글 작성(완료)
		@RequestMapping("insertBSBoard.bo")
		public String insertAttm(@ModelAttribute Board b, @ModelAttribute BoardMarket bm
									, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session){
			
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			
			Image img = new Image(); 
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());
			result1 = bService.insertBasicInfo(b);
			
			bm.setRefBoardNo(b.getBoardNo());
			result2 = bService.insertBSInfo(bm);
			
			//파일이 있을때 파일 첨부
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));		
				result3 = bService.insertBoardImg(img);
			}
			int totalResult = result1 + result2 + result3;
		    
			if (totalResult > 1) {
		    	return "redirect:list.bo?category=2,3"; //  게시글 등록시 게시판으로 이동
		    } else {
		    	return "게시글 작성 실패"; // 게시글 작성 실패
	    	}
			
		}
		
		
		// 구매판매글 수정
		@RequestMapping("updateBSBoard.bo")
		public String updateBSBoard(@ModelAttribute Board b, @ModelAttribute BoardMarket bm, @RequestParam("page") int page, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
			
			Image img = new Image();
			int result3 = 0;
			int bNo = b.getBoardNo();
			
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());

			int result1 = bService.updateBasicInfo(b);

			
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));		
				result3 = bService.updateBoardImg(img);
			} 
			
			bm.setRefBoardNo(bNo);
			int result2 = bService.updateBSBoard(bm);

			int totalResult = result1 + result2 + result3;
			if(totalResult > 1) {
				return "redirect:selectBoard.bo?bNo=" + bNo +"&page=" + page;
			}else {
				return "게시글 수정 실패";
			} // 수정후 작성(1)
		}
		
		// 공지사항글 수정화면에 기존 데이터 띄우기 공지 (뷰화면 띄우기)
		@RequestMapping("updateNotice.bo")
		public String updateNotice(@RequestParam("boardNo") int bNo, @RequestParam("page") int page, Model model) {
			Board board = bService.selectBoard(bNo, page);
			String gImg = bService.selectImg(bNo);
			
			model.addAttribute("b", board);
			model.addAttribute("page", page);
			model.addAttribute("gImg", gImg);
			
			return "updateNotice";
		}
		
		
		@RequestMapping("updateNoticeBoard.bo") 
		public String updateNoticeBoard(@ModelAttribute Board b, @RequestParam("page") int page, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
			Image img = new Image();
			int result3 = 0;
			int bNo = b.getBoardNo();

			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());
			b.setGameNo(0);
			int result1 = bService.updateBasicInfo(b);
			
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));		
				result3 = bService.updateBoardImg(img);
			} 

			int totalResult = result1 +  result3;
			if(totalResult > 0) {
				return "redirect:selectBoard.bo?bNo=" + bNo +"&page=" + page;
			}else {
				return "게시글 수정 실패";
			} 
		}
		
		// 문의 수정화면에 기존 데이터 띄위기 문의
		 @RequestMapping("updateQuery.bo")
		    public String updateQuery(@RequestParam("boardNo") int bNo, @RequestParam("page") int page, Model model) {
			   
		    	Board board = bService.selectBoard(bNo, page);
			    BoardQuery queryS = bService.selectQuery(bNo);
			    
			    
			    
			    model.addAttribute("queryS", queryS);
			    model.addAttribute("page", page);
			    model.addAttribute("b", board);

			   
			    return "updateQuery";
		   }
		
		 // 문의화면 수정
		 @RequestMapping("updateQueryBoard.bo") 
			public String updateQueryBoard(@ModelAttribute Board b,@ModelAttribute BoardQuery boardQuery, @RequestParam("page") int page, HttpServletRequest request, HttpSession session) {
				
				int bNo = b.getBoardNo();
			
				Users loginUser = (Users)session.getAttribute("loginUser");
				b.setUsersNo(loginUser.getUsersNo());
				b.setGameNo(0);
				int result1 = bService.updateBasicInfo(b);
				boardQuery.setQueryReason(boardQuery.getQueryReason() + " : " +boardQuery.getOtherReason());
				int result2 = bService.updateQuery(boardQuery);
				int totalResult = result1 + result2;

				
				if(totalResult > 1) {
					return "redirect:selectBoard.bo?bNo=" + bNo +"&page=" + page;
				}else {
					return "게시글 수정 실패";
				} 
			}
		 
		 
		
	    // 매칭 수정화면에 기존 데이터 띄우기 매칭 (뷰화면 띄우기)
	    @RequestMapping("updateMatching.bo")
	    public String updateMatching(@RequestParam("boardNo") int bNo, @RequestParam("page") int page, Model model) {
		   
	    	Board board = bService.selectBoard(bNo, page);
		    Game refGame = bService.selectGame(bNo);
		    String gImg = bService.selectImg(bNo);
		    BoardMatching boardMat = bService.selectBoardMatching(bNo);
		    //상세주소
		    String[] place = boardMat.getPlace().split(" ");
		    String address1 = place[0];

		    String address2 = "";
		    for (int i = 1; i < place.length; i++) {
		        address2 = address2.concat(place[i]);
		        if (i < place.length - 1) {
		            address2 = address2.concat(" ");
		        }
		    }
		    //모집인원 구현할거
		    //boardMat.getMaxMember()
		    
		    model.addAttribute("address1", address1);
		    model.addAttribute("address2", address2);
		    model.addAttribute("page", page);
		    model.addAttribute("b", board);
		    model.addAttribute("g", refGame);
		    model.addAttribute("gImg", gImg);
		    model.addAttribute("boardMat", boardMat);
		   
		    return "updateMatching";
	   }
		
		// 매칭글 수정
		@RequestMapping("updateMatchingBoard.bo")
		public String updateMatching(@ModelAttribute Board b, @ModelAttribute BoardMatching bMatching, @RequestParam("page") int page, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
			Image img = new Image();
			int result3 = 0;
			int bNo = b.getBoardNo();

			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setGameNo(b.getGameNo());
			b.setUsersNo(loginUser.getUsersNo());
			int result1 = bService.updateBasicInfo(b);
			
			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));		
				result3 = bService.updateBoardImg(img);
			} 
			

			
			bMatching.setPlace(bMatching.getPlace()+ " " +bMatching.getPAddress());
			int result2 = bService.updateMatchingInfo(bMatching);

			int totalResult = result1 + result2 + result3;
			if(totalResult > 1) {
				return "redirect:selectBoard.bo?bNo=" + bNo +"&page=" + page;
			}else {
				return "게시글 수정 실패";
			} 
		}
		
		// 후기글 수정
		@RequestMapping("updateReview.bo")
		public String updateReview(@RequestParam("boardNo") int bNo, @RequestParam("page") int page, Model model, HttpSession session) {
			Board board = bService.selectBoard(bNo, page);
			String gImg = bService.selectImg(bNo);

			// 유저의 매칭 목록 가져오기
			Users loginUser = (Users)session.getAttribute("loginUser");
			int loginUsersNo = loginUser.getUsersNo();		
			ArrayList<Board> list = bService.selectMyMatBoard(loginUsersNo);
			model.addAttribute("list", list);
			
			// gameNo 가져오기 
			
			Game refGame = bService.selectGame(board.getBoardNo());


			board.setGameNo(refGame.getGameNo());
			int refGameNo = board.getGameNo();

			model.addAttribute("refGameNo",refGameNo);
			model.addAttribute("b", board);
			model.addAttribute("page", page);
			model.addAttribute("gImg", gImg);
			
			return "updateReview";
		}
		
		
		@RequestMapping("updateReviewBoard.bo") 
		public String updateReviewBoard(@ModelAttribute Board b, @RequestParam("page") int page,@RequestParam("refGameNo") int refGameNo, @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
			Image img = new Image();
			int result3 = 0;
			int bNo = b.getBoardNo();
			
			Users loginUser = (Users)session.getAttribute("loginUser");
			b.setUsersNo(loginUser.getUsersNo());

			b.setGameNo(refGameNo);
			int result1 = bService.updateBasicInfo(b);

			if(file != null && !file.isEmpty()) {
				String fileR = file.getOriginalFilename();
				img.setImgName(fileR);
				img.setImgGroup('B');
				img.setImgRefNo(b.getBoardNo());
				img.setImgRename(saveFile(file,request));		
				result3 = bService.updateBoardImg(img);
			} 

			int totalResult = result1 +  result3;
			if(totalResult > 0) {
				return "redirect:selectBoard.bo?bNo=" + bNo +"&page=" + page;
			} else {
				return "게시글 수정 실패";
			} 
		}


		// 파일관련 
		public String saveFile(MultipartFile upload, HttpServletRequest request) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			int ranNum = (int)(Math.random()*100000);
			String originFileName = upload.getOriginalFilename();
			String renameFileName = sdf.format(new java.util.Date()) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
			String renamePath = request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles" ;
			File file = new File(renamePath + "\\" + renameFileName);
			
			if(!file.exists()) {
				file.mkdirs();
			} 
			try {
				upload.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return renameFileName;
		}
		
		public void deleteFile(String rename, HttpServletRequest request) {
			String uploadFiles = request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles";
			File file = new File(uploadFiles + "\\" + rename);
			file.delete();
				
		}

		   // 판매구매 수정화면에 기존 데이터 띄우기(가격, 상태, 글내용 남음) 
		   @RequestMapping("updateBuyView.bo")
		   public String updateBuyView(@RequestParam("boardNo") int bNo, @RequestParam("page") int page, Model model) {
				 
			   Board board = bService.selectBoard(bNo, page);
			   Game refGame = bService.selectGame(bNo);
			   String gImg = bService.selectImg(bNo);
			   BoardMarket bMarket= bService.selectBoardMarket(bNo);
			   
			   model.addAttribute("bMarket",bMarket);
			   model.addAttribute("page", page);
			   model.addAttribute("b", board);
			   model.addAttribute("g", refGame);
			   model.addAttribute("gImg", gImg);
			  
		      return "updateBuyView";
		   }
	
	   @RequestMapping("communityrule.co")
	   public String communityrule() {
	      return "communityrule";
	   }
	   
	   @RequestMapping("regulation.co")
	   public String regulation() {
	      return "regulation";
	   }
	   
	   @RequestMapping("personal_info.co")
	   public String personalInfo() {
	      return "personal_info";
	   }
}	
