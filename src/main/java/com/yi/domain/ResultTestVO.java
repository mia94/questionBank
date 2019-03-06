package com.yi.domain;

public class ResultTestVO {
	private int resultTestCode;
	private CustomerVO customer;
	private int answer;
	private int correct;
	private int spendTime;
	private boolean pass;
	private QuestionVO question;
	
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
	public boolean isPass() {
		return pass;
	}
	public void setPass(boolean pass) {
		this.pass = pass;
	}
	public QuestionVO getQuestion() {
		return question;
	}
	public void setQuestion(QuestionVO question) {
		this.question = question;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((question == null) ? 0 : question.hashCode());
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
		ResultTestVO other = (ResultTestVO) obj;
		if (question == null) {
			if (other.question != null)
				return false;
		} else if (!question.equals(other.question))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ResultTestVO [resultTestCode=" + resultTestCode + ", customer=" + customer + ", answer=" + answer
				+ ", correct=" + correct + ", spendTime=" + spendTime + ", pass=" + pass + ", question=" + question
				+ "]";
	}
	

}
