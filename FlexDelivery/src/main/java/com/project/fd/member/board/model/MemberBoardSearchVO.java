package com.project.fd.member.board.model;

public class MemberBoardSearchVO {
	private String searchKeyword="";
	private int currentPage=1;
	private int countPerPage;
	private int blockSize;
	private int firstIndex=1;
	private int lastIndex=1;
	
	public void setMemberBoardSearchVO(MemberBoardSearchVO vo) {
		this.searchKeyword = vo.getSearchKeyword();
		this.currentPage = vo.currentPage;
		this.blockSize = vo.blockSize;
		this.firstIndex = vo.firstIndex;
		this.lastIndex = vo.lastIndex;
		this.countPerPage=vo.countPerPage;
	}
	
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	@Override
	public String toString() {
		return "MemberBoardSearchVO [searchKeyword=" + searchKeyword + ", currentPage=" + currentPage + ", blockSize="
				+ blockSize + ", firstIndex=" + firstIndex + ", lastIndex=" + lastIndex + "]";
	}
	
	
}
	
