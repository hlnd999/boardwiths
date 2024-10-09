package com.kh.boardwiths.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(HashMap<String, String> map);
	
	int getSearchListCount(HashMap<String, String> map);
	
	ArrayList<Board> selectSearchList(PageInfo pi, HashMap<String, String> map);
	
	ArrayList<Board> selectBoardList(PageInfo pi, HashMap<String, String> map);

	Board selectBoard(int bNo, int loginUsersNo);

	BoardMarket selectBoardMarket(int bNo);

	BoardMatching selectBoardMatching(int bNo);
	
	BoardQuery selectBoardQuery(int bNo);

	int deleteBoard(int bNo);

	ArrayList<Comments> selectComments(int refBoardNo);

	int insertComments(Comments c);

	int updateComments(Comments c);

	int deleteComments(int comNo);

	int countBLikes(int bNo);
	
	int checkBLikes(HashMap<String, Integer> map);
	
	int insertBLikes(HashMap<String, Integer> map);

	int deleteBLikes(HashMap<String, Integer> map);
	
	Game selectGame(int bNo);

	int insertBasicInfo(Board board);

	int insertBSInfo(BoardMarket boardM);

	int insertBoardImg(Image img);

	int insertQuery(BoardQuery boardQuery);
	
	int insertMatchingInfo(BoardMatching boardMatching);

	Game selectGame(String gameName);

	ArrayList<Board> selectBoardQueryList(PageInfo pi, int loginUsersNo);

	int getBoardQueryListCount(int loginUsersNo);

	String selectImageRename(HashMap<String, Object> map);
	
	ArrayList<Game> selectGameList(String gameName);

	int updateBasicInfo(Board b);

	int updateBSBoard(BoardMarket bm);

	int updateMatchingInfo(BoardMatching boardMatching);

	int updateQuery(BoardQuery boardQuery);

	int updateBoardImg(Image img);

	String selectImg(int bNo);

	BoardQuery selectQuery(int bNo);

	ArrayList<Board> selectMyMatBoard(int loginUsersNo);

	Board selectBoardT(int boardN);
	
}
