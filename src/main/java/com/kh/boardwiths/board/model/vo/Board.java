package com.kh.boardwiths.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Board {
	private int boardNo;
	private int usersNo;
	private String nickname;
	private int gameNo;
	private String category;
	private String title;
	private String content;
	private Date createDate;
	private int boardCount;
	private String isNotice;
	private String isComplete;
	private String boardStatus;
	private int boardLike;
}
