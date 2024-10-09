package com.kh.boardwiths.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardMarket {
	private int marketNo;
	private int price;
	private String status;
	private int refBoardNo;
}
