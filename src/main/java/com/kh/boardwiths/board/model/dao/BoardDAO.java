package com.kh.boardwiths.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getListCount", map);
	}
	
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
			return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", map, rowBounds);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard", bId);
	}

	public BoardMarket selectBoardMarket(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoardMarket", bNo);
	}

	public BoardMatching selectBoardMatching(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoardMatching", bNo);
	}
	
	public BoardQuery selectBoardQuery(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoardQuery", bNo);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.deleteBoard", bId);
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.updateCount", bNo);
	}
	
	public ArrayList<Comments> selectComments(SqlSessionTemplate sqlSession, int refBoardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectComments", refBoardNo);
	}

	public int insertComments(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.insert("boardMapper.insertComments", c);
	}

	public int updateComments(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.update("boardMapper.updateComments", c);
	}

	public int deleteComments(SqlSessionTemplate sqlSession, int comNo) {
		return sqlSession.delete("boardMapper.deleteComments", comNo);
	}

	public int countBLikes(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.countBLikes", bNo);
	}

	public ArrayList<Game> selectGameList(SqlSessionTemplate sqlSession, String gameName) { 
		return (ArrayList)sqlSession.selectList("boardMapper.selectGameList", gameName); 
	}
	
	public Game selectGame(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectGameNo", bNo);
	}
	
	public Game selectGame(SqlSessionTemplate sqlSession, String gameName) {
		return sqlSession.selectOne("boardMapper.selectGameName", gameName);
	}

	public int insertBasicInfo(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertBasicInfo", board);
	}

	public int insertBSinfo(SqlSessionTemplate sqlSession, BoardMarket boardM) {
		return sqlSession.insert("boardMapper.insertBSInfo", boardM);
	}

	public int insertBoardImg(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("boardMapper.insertBoardImg", img);
	}

	public int insertQuery(SqlSessionTemplate sqlSession, BoardQuery boardQuery) {
		return sqlSession.insert("boardMapper.insertQuery", boardQuery);
	}

	public int insertMatchingInfo(SqlSessionTemplate sqlSession, BoardMatching boardMatching) {
		return sqlSession.insert("boardMapper.insertMatchingInfo", boardMatching);
	}

	public int insertBLikes(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("boardMapper.insertBLikes", map);
	}
	
	public int deleteBLikes(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.delete("boardMapper.deleteBLikes", map);
	}

	public String selectImageRename(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectImageRename", map);
	}

	public int checkBLikes(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.checkBLikes", map);
	}

	public ArrayList<Board> selectBoardQueryList(SqlSessionTemplate sqlSession, PageInfo pi, int loginUsersNo) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardQueryList", loginUsersNo, rowBounds);
	}

	public int getBoardQueryListCount(SqlSessionTemplate sqlSession, int loginUsersNo) {
		return sqlSession.selectOne("boardMapper.getBoardQueryListCount", loginUsersNo);
	}

	//수정 DAO
	public int updateBasicInfo(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBasicInfo", b);
	}

	public int updateBSBoard(SqlSessionTemplate sqlSession, BoardMarket bm) {
		return sqlSession.update("boardMapper.updateBSBoard", bm);
	}

	public int updateMatchingInfo(SqlSessionTemplate sqlSession, BoardMatching boardMatching) {
		return sqlSession.update("boardMapper.updateMatchingInfo", boardMatching);
	}

	public int updateQuery(SqlSessionTemplate sqlSession, BoardQuery boardQuery) {
		return sqlSession.update("boardMapper.updateQuery", boardQuery);
	}

	public int updateBoardImg(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.update("boardMapper.updateBoardImg", img);
	}

	public String selectImg(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectImg", bNo);
	}

	public BoardQuery selectQuery(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectQuery", bNo);
	}

	public ArrayList<Board> selectMyMatBoard(SqlSessionTemplate sqlSession, int loginUsersNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyMatBoard", loginUsersNo);
	}

	public Board selectBoardT(SqlSessionTemplate sqlSession, int boardN) {
		return sqlSession.selectOne("boardMapper.selectBoardT", boardN);
	}

}
