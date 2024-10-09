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
public class Report {
//	REPORT_NO, REPORT_SENDER, REPORT_RECEIVER, REPORT_BOARD, REPORT_DATE, REPORT_MSG, REPORT_CONFIRM
	private int reportNo;
	private int reportSender;
	private String senderId;
	private int reportReceiver;
	private String receiverId;
	private int reportBoard;
	private Date reportDate;
	private String reportMsg;
	private String reportConfirm;
}
