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
	private String subject;
	private int year;
	private int round;
	private int num;
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((questionCode == null) ? 0 : questionCode.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		QuestionVO other = (QuestionVO) obj;
		if (questionCode == null) {
			if (other.questionCode != null)
				return false;
		} else if (!questionCode.equals(other.questionCode))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "QuestionVO [questionCode=" + questionCode + ", questionTitle=" + questionTitle + ", choice1=" + choice1
				+ ", choice2=" + choice2 + ", choice3=" + choice3 + ", choice4=" + choice4 + ", correct=" + correct
				+ ", state=" + state + ", correctRate=" + correctRate + ", picture=" + picture + ", subject=" + subject
				+ ", year=" + year + ", round=" + round + "]";
	}


	
}
