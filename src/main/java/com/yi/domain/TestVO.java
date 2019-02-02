package com.yi.domain;

public class TestVO {
	private String testCode;
	private int year;
	private int round;
	private int testTime;
	
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
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
	public int getTestTime() {
		return testTime;
	}
	public void setTestTime(int testTime) {
		this.testTime = testTime;
	}
	@Override
	public String toString() {
		return "Test [testCode=" + testCode + ", year=" + year + ", round=" + round + ", testTime=" + testTime + "]";
	}
	
	
}
