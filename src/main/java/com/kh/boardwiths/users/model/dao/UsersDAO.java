package com.kh.boardwiths.users.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.Note;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.users.model.vo.Users;

@Repository("uDAO")
public class UsersDAO {

	public Users login(SqlSessionTemplate sqlSession, Users users) {
		return sqlSession.selectOne("usersMapper.login", users);
	}

	public int insertUsers(SqlSessionTemplate sqlSession, Users users) {
		return sqlSession.insert("usersMapper.insertUsers", users);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("usersMapper.checkId", id);
	}

	public int checkNickname(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("usersMapper.checkNickname", nickname);
	}
	
	public ArrayList<HashMap<Game, Image>> topList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("usersMapper.topList");
	}

	public Users selectEmail(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("usersMapper.selectEmail", id);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Users users) {
		return sqlSession.update("usersMapper.updatePwd", users);
	}
	
	
	
	
	public int reportUsers(SqlSessionTemplate sqlSession, Report rep) {
		return sqlSession.insert("usersMapper.reportUsers", rep);
	}

	public Users getUsersById(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("usersMapper.getUsersById", id);
	}

	public int usersChange(SqlSessionTemplate sqlSession, Users usersInfo) {
		return sqlSession.update("usersMapper.usersChange", usersInfo);
	}
	
	public int updatePassword(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("usersMapper.updatePassword", map);
	}

	public int deleteUser(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.deleteUser", u);
	}

	public int updateUser(SqlSessionTemplate sqlSession, Users user) {
		return sqlSession.update("usersMapper.updateMember", user);
	}

	public int updateUser(SqlSessionTemplate sqlSession, String id, String encodedNewPwd) {
		return sqlSession.update("usersMapper.updateUser", encodedNewPwd);
	}

	public int updatePassword(SqlSessionTemplate sqlSession, String id, String encodedNewPwd) {
		return sqlSession.update("usersMapper.updateMember", encodedNewPwd);
	}
	
	public int dailyInterceptor(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("usersMapper.dailyInterceptor");
	}

	public int dailyUpdate(SqlSessionTemplate sqlSession) {
		return sqlSession.update("usersMapper.dailyUpdate");
	}

	public int dailyInsert(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("usersMapper.dailyInsert");
	}
	
	//정현
	
	// 내가 쓴 글
	public int myBoardListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myBoardListCount", usersNo);
	}
	public ArrayList<Board> selectMyList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyList", usersNo, rowBounds);
	}
	

	// 내가 쓴 댓글
	public int myReplyListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myReplyListCount", usersNo);
	}
	public ArrayList<Board> selectMyReplyList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyReplyList", usersNo, rowBounds);
	}
	

	// 댓글단 글
	public int myReBoardListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myReBoardListCount", usersNo);
	}
	public ArrayList<Board> selectMyReBoardList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyReBoardList", usersNo, rowBounds);
	}

	
	// 좋아요 누른 글
	public int myBoardLikeListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myBoardLikeListCount", usersNo);

	}
	public ArrayList<Board> selectMyBoardLikeList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyBoardLikeList", usersNo, rowBounds);
	}
	
	// 받은 메세지
	public int receiveMessageCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.receiveMessageCount", usersNo);
	}
	
	public ArrayList<Board> selectReceiveMessage(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectReceiveMessage", usersNo, rowBounds);
	}
	
	
	// 보낸 메세지 
	public int sendMessageCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.sendMessageCount", usersNo);
	}
	public ArrayList<Board> selectSendMessage(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectSendMessage", usersNo, rowBounds);
	}
	
	
	public ArrayList<Object> usersMyPage(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("usersMapper.usersMyPage", id);
	}

	public int writingMessage(SqlSessionTemplate sqlSession, Note n) {
		return sqlSession.insert("usersMapper.writingMessage", n);
	}
	
	public Users selectReceiver(SqlSessionTemplate sqlSession, Note n) {
		return sqlSession.selectOne("usersMapper.selectReceiver", n);
	}

	public Note selectMessageDetail(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.selectOne("usersMapper.selectMessageDetail", noteNo);
	}

	public Note selectSendMessageDetail(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.selectOne("usersMapper.selectSendMessageDetail", noteNo);
	}

	public int deleteMessage(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.delete("usersMapper.deleteMessage", noteNo);
	}

	public int deleteCheckMsg(SqlSessionTemplate sqlSession, ArrayList<String> noteNoList) {
		return sqlSession.delete("usersMapper.deleteCheckMsg", noteNoList);
	}

	public int deleteMyBoard(SqlSessionTemplate sqlSession, ArrayList<String> boardNoList) {
		return  sqlSession.update("usersMapper.deleteMyBoard", boardNoList);
	}

	public int deleteMyReply(SqlSessionTemplate sqlSession, ArrayList<String> comNoList) {
		return  sqlSession.delete("usersMapper.deleteMyReply", comNoList);
	}

}

