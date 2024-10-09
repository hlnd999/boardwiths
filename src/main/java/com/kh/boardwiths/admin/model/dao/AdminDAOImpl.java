package com.kh.boardwiths.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.boardwiths.admin.common.PageInfo;
import com.kh.boardwiths.admin.model.vo.Daily;
import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.users.model.vo.Users;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Override
	public Users login(SqlSessionTemplate sqlSession, Users users) {
		return sqlSession.selectOne("adminMapper.login", users);
	}

	@Override
	public HashMap<String, ArrayList<Daily>> dailyInfoList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		
		ArrayList<Daily> normalList = (ArrayList)sqlSession.selectList("adminMapper.dailyNormalList", map, rowBounds);
		ArrayList<Daily> enrollList = (ArrayList)sqlSession.selectList("adminMapper.dailyEnrollList", map, rowBounds);
		ArrayList<Daily> categoryList = (ArrayList)sqlSession.selectList("adminMapper.dailyCategoryList", map, rowBounds);
		ArrayList<Daily> commentList = (ArrayList)sqlSession.selectList("adminMapper.dailyCommentList", map, rowBounds);
		ArrayList<Daily> reportList = (ArrayList)sqlSession.selectList("adminMapper.dailyReportList", map, rowBounds);
		
		
		HashMap<String, ArrayList<Daily>> result = new HashMap<String, ArrayList<Daily>>();
		result.put("normalList", normalList);
		result.put("enrollList", enrollList);
		result.put("categoryList", categoryList);
		result.put("commentList", commentList);
		result.put("reportList", reportList);
		
		return result;
	}

	@Override
	public int dailyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.dailyListCount");
	}

	@Override
	public int gameListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.gameListCount", map);
	}

	@Override
	public ArrayList<Game> gameList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.gameList", map, rowBounds);
	}

	@Override
	public int deleteGame(SqlSessionTemplate sqlSession, ArrayList<String> gameNoList) {
		return sqlSession.update("adminMapper.deleteGame", gameNoList);
	}
	
	@Override
	public int deleteImage(SqlSessionTemplate sqlSession, ArrayList<String> gameImgList) {
		return sqlSession.update("adminMapper.deleteImage", gameImgList);
	}

	@Override
	public int insertGameImage(SqlSessionTemplate sqlSession, ArrayList<Image> iList) {
		return sqlSession.insert("adminMapper.insertGameImage", iList);
	}

	@Override
	public ArrayList<Integer> imageIdList(SqlSessionTemplate sqlSession, ArrayList<Image> iList) {
		return (ArrayList)sqlSession.selectList("adminMapper.imageIdList", iList);
	}

	@Override
	public int insertGame(SqlSessionTemplate sqlSession, ArrayList<Game> gList) {
		return sqlSession.insert("adminMapper.insertGame", gList);
	}

	@Override
	public Game gameDetail(SqlSessionTemplate sqlSession, Integer gameNo) {
		return sqlSession.selectOne("adminMapper.gameDetail", gameNo);
	}

	@Override
	public int realDeleteImage(SqlSessionTemplate sqlSession, String delImgId) {
		return sqlSession.delete("adminMapper.realDeleteImage", delImgId);
	}

	@Override
	public int updateGameImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("adminMapper.updateGameImage", img);
	}

	@Override
	public int updateGame(SqlSessionTemplate sqlSession, Game game) {
		return sqlSession.update("adminMapper.updateGame", game);
	}

	@Override
	public int usersListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.usersListCount", map);
	}

	@Override
	public ArrayList<Users> usersSelectList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.usersSelectList", map ,rowBounds);
	}

	@Override
	public int updateStatus(SqlSessionTemplate sqlSession, Users user) {
		return sqlSession.update("adminMapper.updateStatus", user);
	}

	@Override
	public Users userInfo(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("adminMapper.userInfo", usersNo);
	}

	@Override
	public int userModify(SqlSessionTemplate sqlSession, Users user) {
		return sqlSession.update("adminMapper.userModify", user);
	}

	@Override
	public int updateGrade(SqlSessionTemplate sqlSession, Users user) {
		return sqlSession.update("adminMapper.updateGrade", user);
	}

	@Override
	public int reportListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("adminMapper.reportListCount", map);
	}

	@Override
	public ArrayList<Report> reportAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.reportAllList", null, rowBounds);
	}

	@Override
	public ArrayList<Integer> getUserNo(SqlSessionTemplate sqlSession, String targetId) {
		return (ArrayList)sqlSession.selectList("adminMapper.getUserNO", targetId);
	}

	@Override
	public ArrayList<Report> reportSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.reportAllList", map, rowBounds);
	}

	@Override
	public int noConfirmListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.noConfirmListCount");
	}

	@Override
	public ArrayList<Report> noConfirmReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.noConfirmReportList", null, rowBounds);
	}

	@Override
	public int updateReport(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.update("adminMapper.updateReport", report);
	}

	@Override
	public ArrayList<Integer> newGameNoList(SqlSessionTemplate sqlSession, int size) {
		return (ArrayList)sqlSession.selectList("adminMapper.newGameNoList", size);
	}

	@Override
	public HashMap<String, ArrayList<Daily>> dailyRecentList(SqlSessionTemplate sqlSession) {
		ArrayList<Daily> normalList = (ArrayList)sqlSession.selectList("adminMapper.dailyNormalRecentList");
		ArrayList<Daily> enrollList = (ArrayList)sqlSession.selectList("adminMapper.dailyEnrollRecentList");
		ArrayList<Daily> categoryList = (ArrayList)sqlSession.selectList("adminMapper.dailyCategoryRecentList");
		ArrayList<Daily> commentList = (ArrayList)sqlSession.selectList("adminMapper.dailyCommentRecentList");
		ArrayList<Daily> reportList = (ArrayList)sqlSession.selectList("adminMapper.dailyReportRecentList");
		
		
		HashMap<String, ArrayList<Daily>> result = new HashMap<String, ArrayList<Daily>>();
		result.put("normalList", normalList);
		result.put("enrollList", enrollList);
		result.put("categoryList", categoryList);
		result.put("commentList", commentList);
		result.put("reportList", reportList);
		
		return result;
	}

	@Override
	public ArrayList<Users> usersRecentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.usersRecentList");
	}

	@Override
	public ArrayList<Report> reportRecentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.reportRecentList");
	}

	@Override
	public ArrayList<Game> gameRecentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.gameRecentList");
	}

	@Override
	public int pwdResetUpdate(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("adminMapper.pwdResetUpdate", u);
	}

	@Override
	public int checkGameName(SqlSessionTemplate sqlSession, String gameName) {
		return sqlSession.selectOne("adminMapper.checkGameName", gameName);
	}

	@Override
	public ArrayList<Users> weekSearchUsers(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.weekSearchUsers", null, rowBounds);
	}

	@Override
	public int weekReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.weekReportListCount");
	}

	@Override
	public ArrayList<Report> weekReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.weekReportList", null, rowBounds);
	}

	@Override
	public int weekSearchUsersListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.weekSearchUsersListCount");
	}

	@Override
	public int weekQueryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.weekQueryListCount");
	}

	@Override
	public ArrayList<BoardQuery> weekQueryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.weekQueryList", null, rowBounds);
	}

	@Override
	public int AllQueryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.AllQueryListCount");
	}

	@Override
	public ArrayList<BoardQuery> AllQueryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.AllQueryList", null, rowBounds);
	}

	@Override
	public int noConfirmQueryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.noConfirmQueryListCount");
	}

	@Override
	public ArrayList<BoardQuery> noConfirmQuery(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.noConfirmQuery", null, rowBounds);
	}

	@Override
	public int updateQuery(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.updateQuery", map);
	}

	@Override
	public BoardQuery queryDetail(SqlSessionTemplate sqlSession, int queryNo) {
		return sqlSession.selectOne("adminMapper.queryDetail", queryNo);
	}

	@Override
	public Board queryBoardDetail(SqlSessionTemplate sqlSession, int queryNo) {
		return sqlSession.selectOne("adminMapper.queryBoardDetail", queryNo);
	}

	@Override
	public int deleteBoardQuery(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteBoardQuery", boardNo);
	}

	@Override
	public String getEmail(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("adminMapper.getEmail", usersNo);
	}

	@Override
	public int searchQueryListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.searchQueryListCount", map);
	}

	@Override
	public ArrayList<BoardQuery> searchQueryList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.searchQueryList", map, rowBounds);
	}

}
