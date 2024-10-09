package com.kh.boardwiths.users.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.boardwiths.admin.model.exception.AdminException;
import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.exception.BoardException;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.Note;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.common.BoardPagination;
import com.kh.boardwiths.users.model.exception.UsersException;
import com.kh.boardwiths.users.model.service.UsersService;
import com.kh.boardwiths.users.model.vo.Users;

@SessionAttributes("loginUser")
@Controller
public class UsersController {
	
	@Autowired
	public BCryptPasswordEncoder bcrypt;

	@Autowired
	private UsersService uService;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = { "/", "home.do" })
	public String topList(HttpServletResponse response, Model model) {
		ArrayList<HashMap<Game, Image>> list = uService.topList();
		model.addAttribute("list", list);
		return "home";
	}
	
	@RequestMapping("loginView.us")
	public String moveToLoginView() {
		System.out.println(bcrypt.encode("hwjang"));
		return "loginView";
	}

	@RequestMapping("login.us")
	public ModelAndView login(Users users, ModelAndView mv, @RequestParam("beforeURL") String beforeURL) {
		Users loginUser = uService.login(users);
		
		if(loginUser != null) {
			if (bcrypt.matches(users.getPwd(), loginUser.getPwd())) {
				mv.addObject("loginUser", loginUser);

				if (beforeURL.equals("")) {
					mv.setViewName("redirect:home.do");
				} else {
					mv.setViewName("redirect:" + beforeURL);
				}
			} else {
				throw new UsersException("로그인 실패했습니다");
			}
		} else {
			throw new UsersException("일치하는 아이디가 없습니다");
		}
		return mv;
	}

	private int num;
	private String id;
	
	@RequestMapping("emailAuth.us")
	@ResponseBody
	public int emailAuth(@RequestParam("email") String email) {
		
		Random r = new Random();
		num = r.nextInt(999999);
		
		StringBuilder sb = new StringBuilder();
		String frommail = "helenado@naver.com";
		String tomail = email;
		String title = "인증번호 발송을 위한 이메일입니다";
		sb.append(String.format("인증번호는 %d를 입력해주세요", num));
		String content = sb.toString();

		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper msgHelper;
		
		try {
			msgHelper = new MimeMessageHelper(msg, true, "utf-8");
			msgHelper.setFrom(frommail);
			msgHelper.setTo(tomail);
			msgHelper.setSubject(title);
			msgHelper.setText(content);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 메일 전송
		mailSender.send(msg);
		return num;
	}

	@RequestMapping("findPwView.us")
	public String findPW() {
		return "findPwView";
	}
	
	@RequestMapping("findPw.us")
	public String findPW(@RequestParam("id") String id, @RequestParam("email") String email) throws Exception {
		Users isUser = uService.selectEmail(id);
		if (isUser.getEmail().equals(email)) {
			this.id = id;
			emailAuth(email);
			return "findPw";
		} else {
			throw new UsersException("일치하는 이메일 정보가 없습니다");
		}
	}
	
	@RequestMapping("verifyNumber.us")
	@ResponseBody
	public String verifyNumber(@RequestParam("verification") int verNum) {
		if(num == verNum) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("resetPwd.us")
	public String resetPwd() {
		// 비밀번호 수정 화면으로 이동하는 용도
		return "resetPwd";
	}
	
	// 비밀번호 수정 메소드 생성
	// 수업 때 했으니까 그거 대로 하면 되겠다 => 암호화
	// 비밀번호 수정 쿼리 : 수정할거야 어떤 테이블에서, 어떤 컬럼을 이렇게 수정할래, 그 중에서도 누구것만 할거냐면 where id
	@RequestMapping("updatePwd.us")
	public String updatePwd(@RequestParam("pwd") String pwd, Users users) {
		
		users.setId(id);
		String encodedNewPwd = bcrypt.encode(users.getPwd());
		users.setPwd(encodedNewPwd);
			
		int result = uService.updatePwd(users);
		
		if(result > 0) {
			return "confirmPwd";
		} else {
			throw new UsersException("비밀번호 수정에 실패했습니다");
		}
	}

	@RequestMapping("checkId.us")
	public void checkId(@RequestParam("id") String id, PrintWriter out) {
		int count = uService.checkId(id);
		String result = count == 0 ? "yes" : "no";
		out.print(result);
	}

	@RequestMapping("checkNickname.us")
	@ResponseBody
	public String checkNickname(@RequestParam("nickname") String nickname) {
		// @ResponseBody : ViewResolver로 보내는 경로로 보내는것(return)이 아니라 data 로 보내기 위한, 위와 같은
		// 결과
		int count = uService.checkNickname(nickname);
		return count == 0 ? "yes" : "no";
	}

	@RequestMapping("enroll.us")
	public String enroll(Users users, ModelAndView mv) {
		return "enroll";
	}

	@RequestMapping("insertUsers.us")
	public String insertUsers(@ModelAttribute Users users, 
							  @RequestParam("email") String email) {
		if(email != null) {
			users.setEmail(email);
			users.setPwd(bcrypt.encode(users.getPwd()));
		}
		
		int result = uService.insertUsers(users);
		if (result > 0) {
			return "redirect:home.do";
		} else {
			throw new UsersException("회원가입을 실패했습니다");
		}
	}
	
	@RequestMapping("logout.us")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
	
	@RequestMapping("reportUsers.us")
	public String reportUsers(HttpSession session, Model model, @ModelAttribute Report rep, @RequestParam("originalUrl") String originalUrl) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		int sender = 0;
		if(loginUser != null) {
			sender = loginUser.getUsersNo();
		}
		
		rep.getReportBoard();
		rep.getReportReceiver();
		rep.getReportMsg();
		rep.setReportSender(sender);
		
		int result = uService.reportUsers(rep);
		if(result > 0) {
			return "redirect:" + originalUrl;
		} else {
			throw new BoardException("유저 신고에 실패했습니다.");
		} 
	}
//정현
    // 작성글 페이지 
	@RequestMapping("myBoardList.us") 
	public String myBoardList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) { // 로그인한 사람의 글, 댓글 뽑기
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.myBoardListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
			
		ArrayList<Board> list = uService.selectMyList(usersNo, pi);

		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myBoardList";
	}
	
	// 작성댓글 페이지 
	@RequestMapping("myReplyList.us")
	public String myReplyList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) { // 로그인한 사람의 글, 댓글 뽑기
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.myReplyListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMyReplyList(usersNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myReplyList";
	}
	
		// 댓글단 글 페이지 
		@RequestMapping("myReBoardList.us")
		public String myReBoardList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) { 
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.myReBoardListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMyReBoardList(usersNo, pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myReBoardList";
	}
	
		// 좋아요한 글
		@RequestMapping("myBoardLikeList.us")
		public String myBoardLikeList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) {
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		// 페이징 처리
		int listCount = uService.myBoardLikeListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMyBoardLikeList(usersNo, pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myBoardLikeList";
		
	}
	
		// 받은 쪽지 리스트
		@RequestMapping("receiveMessage.us") // receiveMessage.us
		public String receiveMessage(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) {
			int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
			
			// 페이징 처리
			int listCount = uService.receiveMessageCount(usersNo);
			
			PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
			
			ArrayList<Board> list = uService.selectReceiveMessage(usersNo, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "receiveMessage";//receiveMessage
			
		}
	
	// 보낸 쪽지 리스트
	@RequestMapping("sendMessage.us")
	public String sendMessage(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) {
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.sendMessageCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectSendMessage(usersNo, pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "sendMessage";
		
	}
	
	// 메세지 작성
	@RequestMapping("writeMessage.us")
	public String WriteMessage(@ModelAttribute Note n, Model model) {
//		int result = uService.WritingMessage(n);
//		if(result > 0) {
//			model.addAttribute("message", "쪽지를 성공적으로 보냈습니다.");
//			return  "WriteMessage";
//			
//		}else {
//			model.addAttribute("message", "쪽지 보내기를 실패했습니다.");
//			return  "WriteMessage";
//		}
		return "writeMessage";
	}
	
	// 쪽지 보내기
	@RequestMapping("insertMessage.us")
	public String insertMessage(@ModelAttribute Note n, Model model, HttpSession session) {
		
		Users u = (Users)session.getAttribute("loginUser");
		int s = u.getUsersNo();
		
		Users uResult = uService.selectReceiver(n);
		
		if(uResult != null) {
			n.setNoteSender(s+"");
			n.setNoteReceiver(uResult.getUsersNo()+"");
		} else {
			model.addAttribute("message", "쪽지 보내기를 실패했습니다, 다시 입력해주세요.");
			model.addAttribute("receiver", n.getNoteReceiver());
			model.addAttribute("content", n.getNoteContent());
			return  "writeMessage";
		}
		
		
		int result = uService.writingMessage(n);
		if(result > 0) {
			model.addAttribute("message", "쪽지를 성공적으로 보냈습니다.");
			return  "writeMessage";
			
		}else {
			model.addAttribute("message", "쪽지 보내기를 실패했습니다.");
			return  "writeMessage";
		}
		
	}
	
	// 받은 쪽지 상세조회
	@RequestMapping("messageDetail.us")
	public String messageDetail(@RequestParam("noteNo") int noteNo, Model model) {
		
		Note n = uService.selectMessageDetail(noteNo);
		
		if(n == null) {
			throw new UsersException("없는 쪽지 번호입니다.");
		}
		model.addAttribute("noteNo", n.getNoteNo());
		model.addAttribute("nickname", n.getNickname());
		model.addAttribute("noteContent", n.getNoteContent());
		model.addAttribute("noteDate", n.getNoteDate());
		model.addAttribute("option", "1");
		
		return "messageDetail";
	}
	
	// 보낸 쪽지 상세조회
	@RequestMapping("sendMessageDetail.us")
	public String sendMessageDetail(@RequestParam("noteNo") int noteNo, Model model) {
		
		Note n = uService.selectSendMessageDetail(noteNo);
		
		if(n == null) {
			throw new UsersException("없는 쪽지 번호입니다.");
		}
		model.addAttribute("noteNo", n.getNoteNo());
		model.addAttribute("nickname", n.getNickname());
		model.addAttribute("noteContent", n.getNoteContent());
		model.addAttribute("noteDate", n.getNoteDate());
		model.addAttribute("option", "2");
		
		return "messageDetail";
	}
	
	// 쪽지 삭제
	@RequestMapping("deleteMessage.us")
	public String deleteMessage(@RequestParam("noteNo") int noteNo) {
		int result = uService.deleteMessage(noteNo);
		if(result > 0 ) {
			return "redirect:receiveMessage.us";
		} else {
			throw new BoardException("게시글 삭제를 실패했습니다");
		}
	}
	
	@RequestMapping("deleteCheckMsg.us")
	@ResponseBody
	public void deleteCheckMsg(@RequestParam("noteNoArr[]") ArrayList<String> noteNoList, PrintWriter out) {
		// View에서 전달한 JS Array는 배열명[]=[96, 95] 와 같이 넘어오기 때문에 파라미터명을 "배열명[]"으로 받아와야함 
		
		int nResult = uService.deleteCheckMsg(noteNoList);
		
		if(nResult == noteNoList.size()) {
			out.print("success");
		} else {
			throw new AdminException("서비스 요청이 실패하였습니다.");
		}
	}
	
	@RequestMapping("deleteMyBoard.us")
	@ResponseBody
	public void deleteMyBoard(@RequestParam("boardNoArr[]") ArrayList<String> boardNoList, PrintWriter out) {
		// View에서 전달한 JS Array는 배열명[]=[96, 95] 와 같이 넘어오기 때문에 파라미터명을 "배열명[]"으로 받아와야함 
		
		int bResult = uService.deleteMyBoard(boardNoList);
		
		if(bResult == boardNoList.size()) {
			out.print("success");
		} else {
			throw new AdminException("서비스 요청이 실패하였습니다.");
		}
	}
	
	@RequestMapping("deleteMyReply.us")
	@ResponseBody
	public void deleteMyReply(@RequestParam("comNoArr[]") ArrayList<String> comNoList, PrintWriter out) {
		// View에서 전달한 JS Array는 배열명[]=[96, 95] 와 같이 넘어오기 때문에 파라미터명을 "배열명[]"으로 받아와야함 
		
		int bResult = uService.deleteMyReply(comNoList);
		
		if(bResult == comNoList.size()) {
			out.print("success");
		} else {
			throw new AdminException("서비스 요청이 실패하였습니다.");
		}
	}
	
	@RequestMapping("usersMyPage.us")
	public String usermypage(Model model, HttpSession session) {
	    Users loginUser = (Users) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        throw new UsersException("로그인이 필요합니다.");
	    }
	    String id = loginUser.getId();
	    ArrayList<Object> Info = uService.usersMyPage(id);
	    model.addAttribute("Info", Info);
	    return "usersMyPage";
	    }
	   
	@RequestMapping("usersChange.us")
	public String usersChange(HttpSession session, Model model) {
		Users loginUser = (Users) session.getAttribute("loginUser");
		model.addAttribute("l",loginUser);
		return "changeMyPage";
	}
	      
	
	   @RequestMapping("usersChangeFinal.us")
	   public String usersChangeFinal(@ModelAttribute Users UsersInfo, Model model, HttpSession session) {
		   Users loginUser = (Users)session.getAttribute("loginUser");
		   UsersInfo.setUsersNo(loginUser.getUsersNo());
		   
		   int result = uService.usersChange(UsersInfo);
		   
	       if(result > 0) {
	    	   session.setAttribute("loginUser", UsersInfo);
	    	   return "usersMyPage"; 
	      } else {
           throw new UsersException("회원수정을 실패하였습니다");
       }
	 }
	   
	
	   @RequestMapping("siteOut.us")
	   public String siteOut(Model model, HttpSession session) {
	       Users loginUser = (Users) session.getAttribute("loginUser");
	       model.addAttribute("l", loginUser);
	       return "siteOut";
	   }

	   @RequestMapping("siteOutFinal.us")
	   public String siteOutFinal(@RequestParam("leaveReason") String leaveReason,
	   							@RequestParam("leaveMsg") String leaveMsg, 
	   							HttpSession session, HttpServletRequest request, SessionStatus sessionStatus) {
		   Users loginUser = (Users)session.getAttribute("loginUser");
		   if (loginUser == null) {
			   throw new UsersException("로그인 되어 있지 않습니다. 로그인 후 다시 시도해주세요.");
		   }
		   int usersNo = loginUser.getUsersNo();
		   Users u = new Users(); 
		   u.setUsersNo(usersNo);
		   u.setLeaveMsg(leaveMsg);
	      
		   int result = uService.deleteUser(u);
	   	
		   if (result > 0) {
	    	  return "redirect:logout.us";
	   		} else {
	   			throw new UsersException("회원 탈퇴 중 오류가 발생하였습니다.");
	   		}
	   }
}

//	@RequestMapping("updatePassword.us")
//	public String updatePassword(@RequestParam(value = "currentPwd", required = false) String currentPwd,
//	                             @RequestParam(value = "newPwd", required = false) String newPwd,
//	                             Model model) {
//		Users m = (Users) model.getAttribute("loginUser");
//	    if (m == null) {
//	    	throw new UsersException("로그인된 사용자가 없습니다");
//	    }
//
//	    if(bcrypt.matches(currentPwd, m.getPwd())) {
//	    	String encodedNewPwd = bcrypt.encode(newPwd);
//	        int result = uService.updatePassword(m.getId(), encodedNewPwd);
//
//	        if (result > 0) {
//	        	model.addAttribute("loginUser", uService.login(m));
//	            return "userchange.us";
//	        } else {
//	        	throw new UsersException("비밀번호 수정을 실패하였습니다");
//	        }
//	        } else {
//	            throw new UsersException("비밀번호 수정을 실패하였습니다");
//	        }
//	    }
//	   
