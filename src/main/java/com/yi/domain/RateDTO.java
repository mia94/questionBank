package com.yi.domain;

public class RateDTO {
	private int correctCount;
	private int totalCount;
	private double rate;
	
	public int getCorrectCount() {
		return correctCount;
	}
	public void setCorrectCount(int correctCount) {
		this.correctCount = correctCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	@Override
	public String toString() {
		return "RateDTO [correctCount=" + correctCount + ", totalCount=" + totalCount + ", rate=" + rate + "]";
	}
	
}
