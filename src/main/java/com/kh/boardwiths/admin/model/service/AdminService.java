package com.kh.boardwiths.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.boardwiths.admin.common.PageInfo;
import com.kh.boardwiths.admin.model.vo.Daily;
import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.users.model.vo.Users;

public interface AdminService {

	Users login(Users users);

	HashMap<String, ArrayList<Daily>> dailyInfoList(HashMap<String, String> map, PageInfo pi);

	int dailyListCount();

	int gameListCount(HashMap<String, String> map);

	ArrayList<Game> gameList(HashMap<String, String> map, PageInfo pi);

	int deleteGame(ArrayList<String> gameNoList);

	int insertGameImage(ArrayList<Image> list);

	ArrayList<Integer> imageIdList(ArrayList<Image> iList);

	int insertGame(ArrayList<Game> gList);

	int deleteImage(ArrayList<String> gameImgList);

	Game gameDetail(Integer gameNo);

	int realDeleteImage(String delImgId);

	int updateGameImage(Image img);

	int updateGame(Game game);

	int usersListCount(HashMap<String, String> map);

	ArrayList<Users> usersSelectList(HashMap<String, String> map, PageInfo pi);

	int updateStatus(Users user);

	Users userInfo(int usersNo);

	int userModify(Users user);

	int updateGrade(Users user);

	int reportListCount(HashMap<String, Object> map);

	ArrayList<Report> reportAllList(PageInfo pi);

	ArrayList<Integer> getUserNo(String targetId);

	ArrayList<Report> reportSearchList(HashMap<String, Object> map, PageInfo pi);

	int noConfirmListCount();

	ArrayList<Report> noConfirmReportList(PageInfo pi);

	int updateReport(Report report);

	ArrayList<Integer> newGameNoList(int size);

	HashMap<String, ArrayList<Daily>> dailyRecentList();

	ArrayList<Users> usersRecentList();

	ArrayList<Report> reportRecentList();

	ArrayList<Game> gameRecentList();

	String sendEmail(String toEmail, String sendTitle, String sendText);

	String pwdReset(String toEmail, String sendTitle, String newPwd);

	int pwdResetUpdate(Users u);

	int checkGameName(String gameName);

	ArrayList<Users> weekSearchUsers(PageInfo pi);

	int weekReportListCount();

	ArrayList<Report> weekReportList(PageInfo pi);

	int weekSearchUsersListCount();

	int weekQueryListCount();

	ArrayList<BoardQuery> weekQueryList(PageInfo pi);

	int AllQueryListCount();

	ArrayList<BoardQuery> AllQueryList(PageInfo pi);

	int noConfirmQueryListCount();

	ArrayList<BoardQuery> noConfirmQuery(PageInfo pi);

	int updateQuery(HashMap<String, Object> map);

	BoardQuery queryDetail(int queryNo);

	Board queryBoardDetail(int queryNo);

	int deleteBoardQuery(int boardNo);

	String getEmail(int usersNo);

	int searchQueryListCount(HashMap<String, String> map);

	ArrayList<BoardQuery> searchQueryList(HashMap<String, String> map, PageInfo pi);



	

}
