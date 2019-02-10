package com.yi.domain;

public class SubjectVO {
	private String subjectCode;
	private String subjectName;
	private TestVO test; //복합키
	private QuestionVO question;//복합키
	
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public TestVO getTest() {
		return test;
	}
	public void setTest(TestVO test) {
		this.test = test;
	}
	public QuestionVO getQuestion() {
		return question;
	}
	public void setQuestion(QuestionVO question) {
		this.question = question;
	}
	
	@Override
	public String toString() {
		return "SubjectVO [subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", test=" + test
				+ ", question=" + question + "]";
	}
	
	
	
	
}
