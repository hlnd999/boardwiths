package com.kh.boardwiths.admin.common;

public class AdminPagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, int boardLimit) {
		int pageLimit = 5;
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int index = (int)Math.ceil((double)currentPage/pageLimit);
		int startPage = (index-1)*pageLimit + 1;
		int endPage = index*pageLimit;
		
		if(endPage > maxPage) endPage = maxPage;
		
		if(listCount == 0) {
			endPage = 1;
			maxPage = 1;
		}
		
		return new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
	}
}
