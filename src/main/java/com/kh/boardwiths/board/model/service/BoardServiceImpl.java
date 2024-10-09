package com.kh.boardwiths.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.dao.BoardDAO;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public int getListCount(HashMap<String, String> map) {
		return bDAO.getListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.selectBoardList(sqlSession, pi, map);
	}

	@Override
	public Board selectBoard(int bNo, int loginUsersNo) {
		Board b = bDAO.selectBoard(sqlSession, bNo);
		if(b != null) {
			if(loginUsersNo != 0 && b.getUsersNo() != loginUsersNo) {
				int result = bDAO.updateCount(sqlSession, bNo);
				if(result > 0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}
	
	@Override
	public BoardMarket selectBoardMarket(int bNo) {
		return bDAO.selectBoardMarket(sqlSession, bNo);
	}

	@Override
	public BoardMatching selectBoardMatching(int bNo) {
		return bDAO.selectBoardMatching(sqlSession, bNo);
	}
	
	@Override
	public BoardQuery selectBoardQuery(int bNo) {
		return bDAO.selectBoardQuery(sqlSession, bNo);
	}
	
	@Override
	public int deleteBoard(int bNo) {
		return bDAO.deleteBoard(sqlSession, bNo);
	}

	@Override
	public ArrayList<Board> selectSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.selectSearchList(sqlSession, pi, map);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return bDAO.getSearchListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Board> selectBoardQueryList(PageInfo pi, int loginUsersNo) {
		return bDAO.selectBoardQueryList(sqlSession, pi, loginUsersNo);
	}
	
	@Override
	public ArrayList<Comments> selectComments(int refBoardNo) {
		return bDAO.selectComments(sqlSession, refBoardNo);
	}

	@Override
	public int insertComments(Comments c) {
		return bDAO.insertComments(sqlSession, c);
	}

	@Override
	public int updateComments(Comments c) {
		return bDAO.updateComments(sqlSession, c);
	}

	@Override
	public int deleteComments(int comNo) {
		return bDAO.deleteComments(sqlSession, comNo);
	}

	@Override
	public int countBLikes(int bNo) {
		return bDAO.countBLikes(sqlSession, bNo);
	}
	
	@Override
	public int checkBLikes(HashMap<String, Integer> map) {
		return bDAO.checkBLikes(sqlSession, map);
	}

	@Override
	public int insertBLikes(HashMap<String, Integer> map) {
		return bDAO.insertBLikes(sqlSession, map);
	}

	@Override
	public int deleteBLikes(HashMap<String, Integer> map) {
		return bDAO.deleteBLikes(sqlSession, map);
	}
	
	@Override
	public Game selectGame(int bNo) { 
		return bDAO.selectGame(sqlSession, bNo);
	}
	
	@Override
	public Game selectGame(String gameName) { 
		return bDAO.selectGame(sqlSession, gameName);
	}

	@Override
	public int insertBasicInfo(Board board) {
		return bDAO.insertBasicInfo(sqlSession,board);
	}

	@Override
	public int insertBSInfo(BoardMarket boardM) {
		return bDAO.insertBSinfo(sqlSession, boardM);
	}

	@Override 
	public int insertBoardImg(Image img) {
		return bDAO.insertBoardImg(sqlSession, img);
	}

	@Override
	public int insertQuery(BoardQuery boardQuery) {
		return bDAO.insertQuery(sqlSession, boardQuery);
	}

	@Override
	public int insertMatchingInfo(BoardMatching boardMatching) {
		return bDAO.insertMatchingInfo(sqlSession, boardMatching);
	}

	@Override
	public String selectImageRename(HashMap<String, Object> map) {
		return bDAO.selectImageRename(sqlSession, map);
	}

	@Override
	public int getBoardQueryListCount(int loginUsersNo) {
		return bDAO.getBoardQueryListCount(sqlSession, loginUsersNo);
	}

	@Override
	public ArrayList<Game> selectGameList(String gameName) { 
		return bDAO.selectGameList(sqlSession, gameName);
	}

	// 수정 부분 Service
	@Override
	public int updateBasicInfo(Board b) {
		return bDAO.updateBasicInfo(sqlSession, b);
	}

	@Override
	public int updateBSBoard(BoardMarket bm) {
		return bDAO.updateBSBoard(sqlSession, bm);
	}

	@Override
	public int updateMatchingInfo(BoardMatching boardMatching) {
		return bDAO.updateMatchingInfo(sqlSession, boardMatching);
	}

	@Override
	public int updateQuery(BoardQuery boardQuery) {
		return bDAO.updateQuery(sqlSession, boardQuery);
	}

	@Override
	public int updateBoardImg(Image img) {
		return bDAO.updateBoardImg(sqlSession, img);
	}

	@Override
	public String selectImg(int bNo) {
		return bDAO.selectImg(sqlSession, bNo);
	}

	@Override
	public BoardQuery selectQuery(int bNo) {
		return bDAO.selectQuery(sqlSession, bNo);
	}


	@Override
	public ArrayList<Board> selectMyMatBoard(int loginUsersNo) {
		return bDAO.selectMyMatBoard(sqlSession, loginUsersNo);
	}

	@Override
	public Board selectBoardT(int boardN) {
		return bDAO.selectBoardT(sqlSession, boardN);
	}

}