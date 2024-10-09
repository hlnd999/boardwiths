package com.kh.boardwiths.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Comments {
	private int comNo;
	private int usersNo;
	private String nickname;
	private Date comDate;
	private int refBoardNo;
	private String comContent;
	private String category;
	private int boardNo;
	private String title;
	private Date createDate;
	private int boardCount;
}