package com.kh.boardwiths.users.model.vo;

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
public class Users {
	private int usersNo;
	private String id;
	private String pwd;
	private String nickname;
	private String usersName;
	private String phone;
	private String email;
	private String grade;
	private String usersStatus;
	private int reportCount;
	private Date enrollDate;
	private Date leaveDate;
	private String leaveMsg;
	private Date updateDate;
	private String isManager;
}
