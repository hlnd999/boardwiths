package com.kh.boardwiths.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Image {
//	IMG_ID, IMG_NAME, IMG_RENAME, IMG_GROUP, IMG_STATUS
	private int imgId;
	private String imgName;
	private String imgRename;
	private char imgGroup;
	private String imgStatus; 
	private int imgRefNo;// IMG_REF_NO
}
