package com.project.fd.member.board.model;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberBoardVO {
	private int rn; //rowNum
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Timestamp boardRegdate;
	private String boardThumbnail;
	private String boardHead;
	private int authorityNo;
	
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
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
	public Timestamp getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Timestamp boardRegdate) {
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
	@Override
	public String toString() {
		return "MemberBoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardRegdate=" + boardRegdate + ", boardThumbnail=" + boardThumbnail + ", boardHead=" + boardHead
				+ ", authorityNo=" + authorityNo + "]";
	}
	
	
}
