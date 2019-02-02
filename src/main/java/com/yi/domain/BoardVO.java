package com.yi.domain;

import java.util.Date;

public class BoardVO {
	private int boardCode;
	private String boardTitle;
	private String content;
	private Date regdate;
	private Date moddate;
	private int viewcnt;
	private CustomerVO writer;
	
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public CustomerVO getWriter() {
		return writer;
	}
	public void setWriter(CustomerVO writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", content=" + content + ", regdate="
				+ regdate + ", moddate=" + moddate + ", viewcnt=" + viewcnt + ", writer=" + writer + "]";
	}
	
	
}
