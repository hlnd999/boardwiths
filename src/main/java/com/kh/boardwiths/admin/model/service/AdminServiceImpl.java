package com.kh.boardwiths.admin.model.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.boardwiths.admin.common.MailHandler;
import com.kh.boardwiths.admin.common.PageInfo;
import com.kh.boardwiths.admin.model.dao.AdminDAO;
import com.kh.boardwiths.admin.model.vo.Daily;
import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.users.model.vo.Users;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Users login(Users users) {
		return aDAO.login(sqlSession, users);
	}

	@Override
	public HashMap<String, ArrayList<Daily>> dailyInfoList(HashMap<String, String> map, PageInfo pi) {
		return aDAO.dailyInfoList(sqlSession, map, pi);
	}

	@Override
	public int dailyListCount() {
		return aDAO.dailyListCount(sqlSession);
	}

	@Override
	public int gameListCount(HashMap<String, String> map) {
		return aDAO.gameListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Game> gameList(HashMap<String, String> map, PageInfo pi) {
		return aDAO.gameList(sqlSession, pi, map);
	}

	@Override
	public int deleteGame(ArrayList<String> gameNoList) {
		return aDAO.deleteGame(sqlSession, gameNoList);
	}
	
	@Override
	public int deleteImage(ArrayList<String> gameImgList) {
		return aDAO.deleteImage(sqlSession, gameImgList);
	}

	@Override
	public int insertGameImage(ArrayList<Image> iList) {
		return aDAO.insertGameImage(sqlSession, iList);
	}

	@Override
	public ArrayList<Integer> imageIdList(ArrayList<Image> iList) {
		return aDAO.imageIdList(sqlSession, iList);
	}
	
	@Override
	public int insertGame(ArrayList<Game> gList) {
		return aDAO.insertGame(sqlSession, gList);
	}

	@Override
	public Game gameDetail(Integer gameNo) {
		return aDAO.gameDetail(sqlSession, gameNo);
	}

	@Override
	public int realDeleteImage(String delImgId) {
		return aDAO.realDeleteImage(sqlSession, delImgId);
	}

	@Override
	public int updateGameImage(Image img) {
		return aDAO.updateGameImage(sqlSession, img);
	}

	@Override
	public int updateGame(Game game) {
		return aDAO.updateGame(sqlSession, game);
	}

	@Override
	public int usersListCount(HashMap<String, String> map) {
		return aDAO.usersListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Users> usersSelectList(HashMap<String, String> map, PageInfo pi) {
		return aDAO.usersSelectList(sqlSession, map, pi);
	}

	@Override
	public int updateStatus(Users user) {
		return aDAO.updateStatus(sqlSession, user);
	}

	@Override
	public Users userInfo(int usersNo) {
		return aDAO.userInfo(sqlSession, usersNo);
	}

	@Override
	public int userModify(Users user) {
		return aDAO.userModify(sqlSession, user);
	}

	@Override
	public int updateGrade(Users user) {
		return aDAO.updateGrade(sqlSession, user);
	}

	@Override
	public int reportListCount(HashMap<String, Object> map) {
		return aDAO.reportListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Report> reportAllList(PageInfo pi) {
		return aDAO.reportAllList(sqlSession, pi);
	}

	@Override
	public ArrayList<Integer> getUserNo(String targetId) {
		return aDAO.getUserNo(sqlSession, targetId);
	}

	@Override
	public ArrayList<Report> reportSearchList(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.reportSearchList(sqlSession, map, pi);
	}

	@Override
	public int noConfirmListCount() {
		return aDAO.noConfirmListCount(sqlSession);
	}

	@Override
	public ArrayList<Report> noConfirmReportList(PageInfo pi) {
		return aDAO.noConfirmReportList(sqlSession, pi);
	}

	@Override
	public int updateReport(Report report) {
		return aDAO.updateReport(sqlSession, report);
	}

	@Override
	public ArrayList<Integer> newGameNoList(int size) {
		return aDAO.newGameNoList(sqlSession, size);
	}

	@Override
	public HashMap<String, ArrayList<Daily>> dailyRecentList() {
		return aDAO.dailyRecentList(sqlSession);
	}

	@Override
	public ArrayList<Users> usersRecentList() {
		return aDAO.usersRecentList(sqlSession);
	}

	@Override
	public ArrayList<Report> reportRecentList() {
		return aDAO.reportRecentList(sqlSession);
	}

	@Override
	public ArrayList<Game> gameRecentList() {
		return aDAO.gameRecentList(sqlSession);
	}

	@Override
	public String sendEmail(String toEmail, String sendTitle, String sendText) {
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject(sendTitle);
			sendMail.setText(sendText);
			sendMail.setFrom("idmyungja@gmail.com", "BOARDWITHS");
			sendMail.setTo(toEmail);
			sendMail.send();
			return "success";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "fail";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@Override
	public String pwdReset(String toEmail, String sendTitle, String newPwd) {
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject(sendTitle);
			sendMail.setText(newPwd);
			sendMail.setFrom("idmyungja2@gmail.com", "BOARDWITHS");
			sendMail.setTo(toEmail);
			sendMail.send();
			return "success";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "fail";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@Override
	public int pwdResetUpdate(Users u) {
		return aDAO.pwdResetUpdate(sqlSession, u);
	}

	@Override
	public int checkGameName(String gameName) {
		return aDAO.checkGameName(sqlSession, gameName);
	}

	@Override
	public ArrayList<Users> weekSearchUsers(PageInfo pi) {
		return aDAO.weekSearchUsers(sqlSession, pi);
	}

	@Override
	public int weekReportListCount() {
		return aDAO.weekReportListCount(sqlSession);
	}

	@Override
	public ArrayList<Report> weekReportList(PageInfo pi) {
		return aDAO.weekReportList(sqlSession, pi);
	}

	@Override
	public int weekSearchUsersListCount() {
		return aDAO.weekSearchUsersListCount(sqlSession);
	}

	@Override
	public int weekQueryListCount() {
		return aDAO.weekQueryListCount(sqlSession);
	}

	@Override
	public ArrayList<BoardQuery> weekQueryList(PageInfo pi) {
		return aDAO.weekQueryList(sqlSession, pi);
	}

	@Override
	public int AllQueryListCount() {
		return aDAO.AllQueryListCount(sqlSession);
	}

	@Override
	public ArrayList<BoardQuery> AllQueryList(PageInfo pi) {
		return aDAO.AllQueryList(sqlSession, pi);
	}

	@Override
	public int noConfirmQueryListCount() {
		return aDAO.noConfirmQueryListCount(sqlSession);
	}

	@Override
	public ArrayList<BoardQuery> noConfirmQuery(PageInfo pi) {
		return aDAO.noConfirmQuery(sqlSession, pi);
	}

	@Override
	public int updateQuery(HashMap<String, Object> map) {
		return aDAO.updateQuery(sqlSession, map);
	}

	@Override
	public BoardQuery queryDetail(int queryNo) {
		return aDAO.queryDetail(sqlSession, queryNo);
	}

	@Override
	public Board queryBoardDetail(int queryNo) {
		return aDAO.queryBoardDetail(sqlSession, queryNo);
	}

	@Override
	public int deleteBoardQuery(int boardNo) {
		return aDAO.deleteBoardQuery(sqlSession, boardNo);
	}

	@Override
	public String getEmail(int usersNo) {
		return aDAO.getEmail(sqlSession, usersNo);
	}

	@Override
	public int searchQueryListCount(HashMap<String, String> map) {
		return aDAO.searchQueryListCount(sqlSession, map);
	}

	@Override
	public ArrayList<BoardQuery> searchQueryList(HashMap<String, String> map, PageInfo pi) {
		return aDAO.searchQueryList(sqlSession, map, pi);
	}

}
