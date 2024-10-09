package com.kh.boardwiths.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.boardwiths.admin.common.PageInfo;
import com.kh.boardwiths.admin.model.vo.Daily;
import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.users.model.vo.Users;

public interface AdminDAO {

	Users login(SqlSessionTemplate sqlSession, Users users);

	HashMap<String, ArrayList<Daily>> dailyInfoList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi);

	int dailyListCount(SqlSessionTemplate sqlSession);

	int gameListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map);

	ArrayList<Game> gameList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map);

	int deleteGame(SqlSessionTemplate sqlSession, ArrayList<String> gameNoList);

	int insertGameImage(SqlSessionTemplate sqlSession, ArrayList<Image> iList);

	ArrayList<Integer> imageIdList(SqlSessionTemplate sqlSession, ArrayList<Image> iList);

	int insertGame(SqlSessionTemplate sqlSession, ArrayList<Game> gList);

	int deleteImage(SqlSessionTemplate sqlSession, ArrayList<String> gameImgList);

	Game gameDetail(SqlSessionTemplate sqlSession, Integer gameNo);

	int realDeleteImage(SqlSessionTemplate sqlSession, String delImgId);

	int updateGameImage(SqlSessionTemplate sqlSession, Image img);

	int updateGame(SqlSessionTemplate sqlSession, Game game);

	int usersListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map);

	ArrayList<Users> usersSelectList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi);

	int updateStatus(SqlSessionTemplate sqlSession, Users user);

	Users userInfo(SqlSessionTemplate sqlSession, int usersNo);

	int userModify(SqlSessionTemplate sqlSession, Users user);

	int updateGrade(SqlSessionTemplate sqlSession, Users user);

	int reportListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	ArrayList<Report> reportAllList(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<Integer> getUserNo(SqlSessionTemplate sqlSession, String targetId);

	ArrayList<Report> reportSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi);

	int noConfirmListCount(SqlSessionTemplate sqlSession);

	ArrayList<Report> noConfirmReportList(SqlSessionTemplate sqlSession, PageInfo pi);

	int updateReport(SqlSessionTemplate sqlSession, Report report);

	ArrayList<Integer> newGameNoList(SqlSessionTemplate sqlSession, int size);

	HashMap<String, ArrayList<Daily>> dailyRecentList(SqlSessionTemplate sqlSession);

	ArrayList<Users> usersRecentList(SqlSessionTemplate sqlSession);

	ArrayList<Report> reportRecentList(SqlSessionTemplate sqlSession);

	ArrayList<Game> gameRecentList(SqlSessionTemplate sqlSession);

	int pwdResetUpdate(SqlSessionTemplate sqlSession, Users u);

	int checkGameName(SqlSessionTemplate sqlSession, String gameName);

	ArrayList<Users> weekSearchUsers(SqlSessionTemplate sqlSession, PageInfo pi);

	int weekReportListCount(SqlSessionTemplate sqlSession);

	ArrayList<Report> weekReportList(SqlSessionTemplate sqlSession, PageInfo pi);

	int weekSearchUsersListCount(SqlSessionTemplate sqlSession);

	int weekQueryListCount(SqlSessionTemplate sqlSession);

	ArrayList<BoardQuery> weekQueryList(SqlSessionTemplate sqlSession, PageInfo pi);

	int AllQueryListCount(SqlSessionTemplate sqlSession);

	ArrayList<BoardQuery> AllQueryList(SqlSessionTemplate sqlSession, PageInfo pi);

	int noConfirmQueryListCount(SqlSessionTemplate sqlSession);

	ArrayList<BoardQuery> noConfirmQuery(SqlSessionTemplate sqlSession, PageInfo pi);

	int updateQuery(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	BoardQuery queryDetail(SqlSessionTemplate sqlSession, int queryNo);

	Board queryBoardDetail(SqlSessionTemplate sqlSession, int queryNo);

	int deleteBoardQuery(SqlSessionTemplate sqlSession, int boardNo);

	String getEmail(SqlSessionTemplate sqlSession, int usersNo);

	int searchQueryListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map);

	ArrayList<BoardQuery> searchQueryList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi);




	

}
