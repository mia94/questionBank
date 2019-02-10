package com.yi.domain;

public class ResultTestVO {
	private int resultTestCode;
	private CustomerVO customer;
	private int answer;
	private int correct;
	private int spendTime;
	private int score;
	private boolean pass;
	private TestVO test;
	
	public int getResultTestCode() {
		return resultTestCode;
	}
	public void setResultTestCode(int resultTestCode) {
		this.resultTestCode = resultTestCode;
	}
	public CustomerVO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerVO customer) {
		this.customer = customer;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public int getCorrect() {
		return correct;
	}
	public void setCorrect(int correct) {
		this.correct = correct;
	}
	public int getSpendTime() {
		return spendTime;
	}
	public void setSpendTime(int spendTime) {
		this.spendTime = spendTime;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public boolean isPass() {
		return pass;
	}
	public void setPass(boolean pass) {
		this.pass = pass;
	}
	public TestVO getTest() {
		return test;
	}
	public void setTest(TestVO test) {
		this.test = test;
	}



	@Override
	public String toString() {
		return "ResultTestVO [resultTestCode=" + resultTestCode + ", customer=" + customer + ", answer=" + answer
				+ ", correct=" + correct + ", spendTime=" + spendTime + ", score=" + score + ", pass=" + pass
				+ ", test=" + test + "]";
	}

	

	
}
