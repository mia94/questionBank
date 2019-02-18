package com.yi.domain;

public class LoginDTO {
	private String customerName;
	private String id;
	private boolean employee;
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isEmployee() {
		return employee;
	}
	public void setEmployee(boolean employee) {
		this.employee = employee;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [customerName=" + customerName + ", id=" + id + ", employee=" + employee + "]";
	}
	

}
