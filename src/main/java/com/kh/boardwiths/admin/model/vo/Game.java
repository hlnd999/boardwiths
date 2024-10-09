package com.kh.boardwiths.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Game {
	//게임번호, 게임명, 제조사, 게임장르, 게임시간, 게임난이도, 게임인원, 거래건, 모임건
	//GAME_NO, GAME_NAME, GAME_COMPANY, GAME_GENRE, GAME_PLAYTIME, GAME_LEVEL, GAME_PEOPLE, ,marketCount, matchingCount
	private int gameNo;
	private String gameName;
	private String gameCompany;
	private String gameGenre;
	private int gamePlayTime;
	private Double gameLevel;
	private int gamePeople;
	private String gameStatus;
	private int marketCount;
	private int matchingCount;
	private int gameImg;
	private String gameImgRename; 
}
