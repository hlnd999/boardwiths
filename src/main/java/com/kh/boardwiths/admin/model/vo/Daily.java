package com.kh.boardwiths.admin.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Daily {//일자, 방문자, 가입자 수, 새로운 거래 글 수, 새로운 소셜 글 수,	새로운 댓글 수,	신고 횟수
	private Date daily;
	private int usersCount;
	private int enrollNo;
	private int newMarketNo;
	private int newMatchingNo;
	private int newCommentNo;
	private int newReportNo;
}
