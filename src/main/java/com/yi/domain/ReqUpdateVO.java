package com.yi.domain;

import java.util.Date;

public class ReqUpdateVO {
	private int reqCode;
	private QuestionVO question;
	private String content;
	private int oriCorrect;
	private int reqCorrect;
	private String state;
	private CustomerVO writer;
	private Date regdate;
	private Date moddate;
	
	public int getReqCode() {
		return reqCode;
	}
	public void setReqCode(int reqCode) {
		this.reqCode = reqCode;
	}
	public QuestionVO getQuestion() {
		return question;
	}
	public void setQuestion(QuestionVO question) {
		this.question = question;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getOriCorrect() {
		return oriCorrect;
	}
	public void setOriCorrect(int oriCorrect) {
		this.oriCorrect = oriCorrect;
	}
	public int getReqCorrect() {
		return reqCorrect;
	}
	public void setReqCorrect(int reqCorrect) {
		this.reqCorrect = reqCorrect;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public CustomerVO getWriter() {
		return writer;
	}
	public void setWriter(CustomerVO writer) {
		this.writer = writer;
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
		return "ReqUpdateVO [reqCode=" + reqCode + ", question=" + question + ", content=" + content + ", oriCorrect="
				+ oriCorrect + ", reqCorrect=" + reqCorrect + ", state=" + state + ", writer=" + writer + "]";
	}

	

	
}
