package com.yi.domain;

public class UnitTestVO { 
	private int unitTestCode;
	private int answer;
	private boolean correct;
	private CustomerVO customer;
	private QuestionVO question;
	private TestVO test;
	
	public int getUnitTestCode() {
		return unitTestCode;
	}
	public void setUnitTestCode(int unitTestCode) {
		this.unitTestCode = unitTestCode;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public boolean isCorrect() {
		return correct;
	}
	public void setCorrect(boolean correct) {
		this.correct = correct;
	}
	public CustomerVO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerVO customer) {
		this.customer = customer;
	}
	public QuestionVO getQuestion() {
		return question;
	}
	public void setQuestion(QuestionVO question) {
		this.question = question;
	}
	public TestVO getTest() {
		return test;
	}
	public void setTest(TestVO test) {
		this.test = test;
	}
	
	@Override
	public String toString() {
		return "UnitTestVO [unitTestCode=" + unitTestCode + ", answer=" + answer + ", correct=" + correct
				+ ", customer=" + customer + ", question=" + question + ", test=" + test + "]";
	}
	

	
	
}
