package com.yi.domain;

public class QuestionVO {
	private String questionCode;
	private String questionTitle;
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	private int correct;
	private String state;
	private int correctRate;
	private String picture;
	private SubjectVO subject;
	
	public String getQuestionCode() {
		return questionCode;
	}
	public void setQuestionCode(String questionCode) {
		this.questionCode = questionCode;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getChoice1() {
		return choice1;
	}
	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}
	public String getChoice2() {
		return choice2;
	}
	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}
	public String getChoice3() {
		return choice3;
	}
	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}
	public String getChoice4() {
		return choice4;
	}
	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}
	public int getCorrect() {
		return correct;
	}
	public void setCorrect(int correct) {
		this.correct = correct;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCorrectRate() {
		return correctRate;
	}
	public void setCorrectRate(int correctRate) {
		this.correctRate = correctRate;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public SubjectVO getSubject() {
		return subject;
	}
	public void setSubject(SubjectVO subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "QuestionVO [questionCode=" + questionCode + ", questionTitle=" + questionTitle + ", choice1=" + choice1
				+ ", choice2=" + choice2 + ", choice3=" + choice3 + ", choice4=" + choice4 + ", correct=" + correct
				+ ", state=" + state + ", correctRate=" + correctRate + ", picture=" + picture + ", subject=" + subject
				+ "]";
	}
	
	
	
	
}
