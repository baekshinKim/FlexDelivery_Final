package com.project.fd.admin.board.model;

public class AdminBoardAllVO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardRegdate;
	private String boardThumbnail;
	private String boardHead;
	private int authorityNo;
	private String authorityName;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public String getBoardHead() {
		return boardHead;
	}
	public void setBoardHead(String boardHead) {
		this.boardHead = boardHead;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	public String getBoardThumbnail() {
		return boardThumbnail;
	}
	public void setBoardThumbnail(String boardThumbnail) {
		this.boardThumbnail = boardThumbnail;
	}
	
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	
	@Override
	public String toString() {
		return "AdminBoardAllVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardRegdate=" + boardRegdate + ", boardThumbnail=" + boardThumbnail + ", boardHead=" + boardHead
				+ ", authorityNo=" + authorityNo + ", authorityName=" + authorityName + "]";
	}


	
}
