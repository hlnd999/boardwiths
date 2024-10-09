package com.kh.boardwiths.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.Note;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.users.model.dao.UsersDAO;
import com.kh.boardwiths.users.model.vo.Users;

@Service("uService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UsersDAO uDAO;
	
	@Override
	public Users login(Users users) {
		Users loginUser = uDAO.login(sqlSession, users);
		return loginUser;
	}

	@Override
	public int insertUsers(Users users) {
		return uDAO.insertUsers(sqlSession, users);
	}
	
	@Override
	public ArrayList<HashMap<Game, Image>> topList() {
		return uDAO.topList(sqlSession);
	}

	@Override
	public Users selectEmail(String id) {
		return uDAO.selectEmail(sqlSession, id);
	}

	@Override
	public int updatePwd(Users users) {
		return uDAO.updatePwd(sqlSession, users);
	}
	
	@Override
	public int checkId(String id) {
		return uDAO.checkId(sqlSession, id);
	}

	@Override
	public int checkNickname(String nickname) {
		return uDAO.checkNickname(sqlSession, nickname);
	}
	
	
	//-------------------------------------------
	
	@Override
	public int reportUsers(Report rep) {
		return uDAO.reportUsers(sqlSession, rep);
	}
	
	@Override
	public ArrayList<Object> usersMyPage(String id) {
		return uDAO.usersMyPage(sqlSession, id);
	}

	@Override
	public Users getUsersById(String id) {
		return uDAO.getUsersById(sqlSession, id);
	}
	
	@Override
	public int usersChange(Users usersInfo) {
		return uDAO.usersChange(sqlSession, usersInfo);
	}
	
	@Override
	public int updatePassword(HashMap<String, String> map) {
		return uDAO.updatePassword(sqlSession, map);
	}

	@Override
	public int deleteUser(Users u) {
		return uDAO.deleteUser(sqlSession, u);
	}

	@Override
	public int updateUser(Users user) {
		return uDAO.updateUser(sqlSession, user);
	}

	@Override
	public int updatePassword(String id, String encodedNewPwd) {
		return uDAO.updatePassword(sqlSession, id, encodedNewPwd);
	}
	
	@Override
	public int dailyInterceptor() {
		return uDAO.dailyInterceptor(sqlSession);
	}

	@Override
	public int dailyUpdate() {
		return uDAO.dailyUpdate(sqlSession);
	}

	@Override
	public int dailyInsert() {
		return uDAO.dailyInsert(sqlSession);
	}
	
	//정현
	@Override // 내가 쓴 글의 수
	public int myBoardListCount(int usersNo) {
		return uDAO.myBoardListCount(sqlSession, usersNo);
	}
	@Override // 내가 쓴 글 리스트 가져오기
	public ArrayList<Board> selectMyList(int usersNo, PageInfo pi) {
		return uDAO.selectMyList(sqlSession, usersNo, pi);
	}
	
	@Override // 내가 쓴 댓글의 수
	public int myReplyListCount(int usersNo) {
		return uDAO.myReplyListCount(sqlSession, usersNo);
	}
	@Override // 내가 쓴 댓글 리스트 가져오기
	public ArrayList<Board> selectMyReplyList(int usersNo, PageInfo pi) {
		return uDAO.selectMyReplyList(sqlSession, usersNo, pi);
	}
	
	@Override // 내가 쓴 댓글의 글의 수
	public int myReBoardListCount(int usersNo) {
		return uDAO.myReBoardListCount(sqlSession, usersNo);
	}
	@Override // 내가 쓴 댓글의 글 리스트 가져오기
	public ArrayList<Board> selectMyReBoardList(int usersNo, PageInfo pi) {
		return uDAO.selectMyReBoardList(sqlSession, usersNo, pi);
	}
	
	@Override // 내가 좋아요한 글의 수
	public int myBoardLikeListCount(int usersNo) {
		return uDAO.myBoardLikeListCount(sqlSession, usersNo);
	}
	@Override // 내가 좋아요한 글 리스트 가져오기
	public ArrayList<Board> selectMyBoardLikeList(int usersNo, PageInfo pi) {
		return uDAO.selectMyBoardLikeList(sqlSession, usersNo, pi);
	}

	@Override // 받은 메세지 수
	public int receiveMessageCount(int usersNo) {
		return uDAO.receiveMessageCount(sqlSession, usersNo);
	}
	@Override // 받은 메세지 리스트
	public ArrayList<Board> selectReceiveMessage(int usersNo, PageInfo pi) {
		return uDAO.selectReceiveMessage(sqlSession, usersNo, pi);
	}
	
	@Override // 보낸 메세지 수
	public int sendMessageCount(int usersNo) {
		return uDAO.sendMessageCount(sqlSession, usersNo);
	}
	@Override // 보낸 메세지 리스트 
	public ArrayList<Board> selectSendMessage(int usersNo, PageInfo pi) {
		return uDAO.selectSendMessage(sqlSession, usersNo, pi);
	}
	
	@Override
	public int writingMessage(Note n) {
		return uDAO.writingMessage(sqlSession, n);
	}
	
	@Override
	public Users selectReceiver(Note n) {
		return uDAO.selectReceiver(sqlSession, n);
	}

	@Override
	public Note selectMessageDetail(int noteNo) {
		return uDAO.selectMessageDetail(sqlSession, noteNo);
	}

	@Override
	public Note selectSendMessageDetail(int noteNo) {
		return uDAO.selectSendMessageDetail(sqlSession, noteNo);
	}

	@Override // 쪽지 디테일에서 삭제
	public int deleteMessage(int noteNo) {
		return uDAO.deleteMessage(sqlSession, noteNo);
	}

	@Override // 선택된 쪽지 삭제
	public int deleteCheckMsg(ArrayList<String> noteNoList) {
		return uDAO.deleteCheckMsg(sqlSession, noteNoList);
	}

	@Override // 선택된 내글 삭제
	public int deleteMyBoard(ArrayList<String> boardNoList) {
		return uDAO.deleteMyBoard(sqlSession, boardNoList);
	}

	@Override
	public int deleteMyReply(ArrayList<String> comNoList) {
		return uDAO.deleteMyReply(sqlSession, comNoList);
	}

	
}
