package com.project.fd.member.board.model;

public class MemberBoardPaging {
	private int currentPage; //현재 페이지
	private int countPerPage;  //pageSize 페이지당 보여질 레코드수
	private int blockSize; //블럭당 보여질 페이지 수
	private int totalRecord; //총 레코드 수
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	private int totalPage;  //총 페이지수
	private int firstPage;  //블럭당 시작 페이지, 1, 11, 21, 31, ...
	private int lastPage; //블럭당 마지막 페이지 10, 20, 30, 40, ...
	private int firstIndex; //페이지당 시작 인덱스 0, 5, 10, 15 ...
	private int lastIndex;  //페이지당 마지막 인덱스	5,10,15,20....
	public int getTotalPage() {
		totalPage=(int)Math.ceil((float)totalRecord/countPerPage);
		//totalPage = ((getTotalRecord()-1)/getRecordCountPerPage()) + 1;
		
		return totalPage;
	}
		
	
	public int getFirstPage() {
		firstPage= currentPage-((currentPage-1)%blockSize);
		//firstPage = ((getCurrentPage()-1)/getBlockSize())*getBlockSize() + 1;
		return firstPage;
	}
	
	public int getLastPage() {		
		lastPage = firstPage+(blockSize-1);
		//lastPage = getFirstPage() + getBlockSize() - 1;		
		if(lastPage > getTotalPage()){
			lastPage = getTotalPage();
		}
		return lastPage;
	}

	public int getFirstIndex() {
		//curPos=(currentPage-1)*pageSize;
		firstIndex = (getCurrentPage() - 1) * getCountPerPage();
		return firstIndex;
	}

	public int getLastIndex() {
		lastIndex = getCurrentPage() * getCountPerPage();
		return lastIndex;
	}
}
