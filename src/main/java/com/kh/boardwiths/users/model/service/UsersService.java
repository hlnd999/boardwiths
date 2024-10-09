package com.kh.boardwiths.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.Note;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.users.model.vo.Users;

public interface UsersService {

	Users login(Users users);

	int insertUsers(Users users);

	int checkId(String id);

	int checkNickname(String nickname);
	
	ArrayList<HashMap<Game, Image>> topList();

	Users selectEmail(String id);
	
	int updatePwd(Users users);
	
	int reportUsers(Report rep);
	
	ArrayList<Object> usersMyPage(String id);
	
	Users getUsersById(String id);

	int usersChange(Users usersInfo);

	int updatePassword(HashMap<String, String> map);
	
	int deleteUser(Users u);

	int updateUser(Users user);

	int updatePassword(String id, String encodedNewPwd);
	
	int dailyInterceptor();

	int dailyUpdate();

	int dailyInsert();
	
	int myBoardListCount(int usersNo);
	
	ArrayList<Board> selectMyList(int usersNo, PageInfo pi);

	int myReplyListCount(int usersNo);
	
	ArrayList<Board> selectMyReplyList(int usersNo, PageInfo pi);

	int myReBoardListCount(int usersNo);
	
	ArrayList<Board> selectMyReBoardList(int usersNo, PageInfo pi);

	int myBoardLikeListCount(int usersNo);
	
	ArrayList<Board> selectMyBoardLikeList(int usersNo, PageInfo pi);

	int receiveMessageCount(int usersNo);
	
	ArrayList<Board> selectReceiveMessage(int usersNo, PageInfo pi);
	
	int sendMessageCount(int usersNo);
	
	ArrayList<Board> selectSendMessage(int usersNo, PageInfo pi);
	
	int writingMessage(Note n);
	
	Users selectReceiver(Note n);
	
	Note selectMessageDetail(int noteNo);

	Note selectSendMessageDetail(int noteNo);

	int deleteMessage(int noteNo);

	int deleteCheckMsg(ArrayList<String> noteNoList);

	int deleteMyBoard(ArrayList<String> boardNoList);

	int deleteMyReply(ArrayList<String> comNoList);

}
