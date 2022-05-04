package com.project.fd.owner.board.model;

public class OwnerBoardVO {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardRegdate;
	private String boardThumbnail;
	private String boardHead;
	private int authorityNo;
	
	private int RNUM;
	private int newImgTerm;
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
	public String getBoardThumbnail() {
		return boardThumbnail;
	}
	public void setBoardThumbnail(String boardThumbnail) {
		this.boardThumbnail = boardThumbnail;
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
	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
	public int getNewImgTerm() {
		return newImgTerm;
	}
	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}
	@Override
	public String toString() {
		return "OwnerBoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardRegdate=" + boardRegdate + ", boardThumbnail=" + boardThumbnail + ", boardHead=" + boardHead
				+ ", authorityNo=" + authorityNo + ", RNUM=" + RNUM + ", newImgTerm=" + newImgTerm + "]";
	}
	
	
	
	
	
}
