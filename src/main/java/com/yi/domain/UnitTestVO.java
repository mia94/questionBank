package com.yi.domain;

public class SolutionVO {
	private QuestionVO question;
	private int answer;
	private boolean correct;
	private CustomerVO customer;
	
	public QuestionVO getQuestion() {
		return question;
	}
	public void setQuestion(QuestionVO question) {
		this.question = question;
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
	
	@Override
	public String toString() {
		return "Solution [question=" + question + ", answer=" + answer + ", correct=" + correct + ", customer="
				+ customer + "]";
	}
	
	
}
