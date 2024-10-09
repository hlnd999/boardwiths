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
public class Note {
	private int noteNo;
	private String noteSender;
	private String noteReceiver;
	private Date noteDate;
	private String noteContent;
	// 
	private int usersNo;
	private String nickname;
}
