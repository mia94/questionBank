package com.yi.domain;

import java.util.Date;

public class ReplyVO {
	private int replyCode;
	private BoardVO board;
	private String replyText;
	private CustomerVO writer;
	private Date regdate;
	private Date moddate;
	
	public int getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}
	public BoardVO getBoardCode() {
		return board;
	}
	public void setBoardCode(BoardVO boardCode) {
		this.board = boardCode;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public CustomerVO getReplyer() {
		return writer;
	}
	public void setReplyer(CustomerVO replyer) {
		this.writer = replyer;
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
	
	@Override
	public String toString() {
		return "ReplyVO [replyCode=" + replyCode + ", boardCode=" + board + ", replyText=" + replyText
				+ ", replyer=" + writer + ", regdate=" + regdate + ", moddate=" + moddate + "]";
	}
	


	
	
}
