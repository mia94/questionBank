package com.yi.domain;

import java.util.Date;

public class ReplyVO {
	private String replyCode;
	private BoardVO vo;
	private String replyText;
	private Date regdate;
	private Date moddate;
	private CustomerVO writer;
	
	public String getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}
	public BoardVO getVo() {
		return vo;
	}
	public void setVo(BoardVO vo) {
		this.vo = vo;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
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
	public CustomerVO getWriter() {
		return writer;
	}
	public void setWriter(CustomerVO writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyCode=" + replyCode + ", vo=" + vo + ", replyText=" + replyText + ", regdate=" + regdate
				+ ", moddate=" + moddate + ", writer=" + writer + "]";
	}
	
	
}
