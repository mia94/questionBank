package com.yi.domain;

public class ResultTestVO {
	private String resultTestCode;
	private CustomerVO customer;
	private int score;
	private boolean pass;
	private TestVO test;

	
	public String getResultTestCode() {
		return resultTestCode;
	}
	public void setResultTestCode(String resultTestCode) {
		this.resultTestCode = resultTestCode;
	}
	public CustomerVO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerVO customer) {
		this.customer = customer;
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
		return "ResultTestVO [resultTestCode=" + resultTestCode + ", customer=" + customer + ", score=" + score
				+ ", pass=" + pass + ", test=" + test + "]";
	}
	
	
	
	
}
