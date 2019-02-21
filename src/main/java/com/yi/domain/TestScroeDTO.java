package com.yi.domain;

public class TestScroeDTO {
	private String customer;  //Å×½ºÆ®ÇÑ È¸¿ø
	private int totalQuestion;//Ç¬ ÀüÃ¼¹®Á¦ °¹¼ö
	private int correctQuestion;//¸ÂÃá ¹®Á¦ °¹¼ö
	private int totalSpendTime;//°É¸° ÃÑ½Ã°£
	
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public int getTotalQuestion() {
		return totalQuestion;
	}
	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
	}
	public int getCorrectQuestion() {
		return correctQuestion;
	}
	public void setCorrectQuestion(int correctQuestion) {
		this.correctQuestion = correctQuestion;
	}
	public int getTotalSpendTime() {
		return totalSpendTime;
	}
	public void setTotalSpendTime(int totalSpendTime) {
		this.totalSpendTime = totalSpendTime;
	}
	
	@Override
	public String toString() {
		return "TestScroeDTO [customer=" + customer + ", totalQuestion=" + totalQuestion + ", correctQuestion="
				+ correctQuestion + ", totalSpendTime=" + totalSpendTime + "]";
	}
	
	
	
	
}
