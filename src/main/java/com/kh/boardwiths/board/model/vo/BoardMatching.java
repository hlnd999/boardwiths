package com.kh.boardwiths.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardMatching {
	private int matchingNo;
	private int member;
	private int maxMember;
	private Date makeDate;
	private Date dueDate;
	private String place;
	private String pAddress; //상세주소
	private int refBoardNo;
	
}
