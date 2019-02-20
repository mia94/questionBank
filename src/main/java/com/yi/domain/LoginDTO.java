package com.yi.domain;

public class LoginDTO {
	private String customerCode;
	private String customerName;
	private String id;
	private String email;
	private boolean employee;
	
	
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [customerCode=" + customerCode + ", customerName=" + customerName + ", id=" + id
				+ ", employee=" + employee + "]";
	}
	
	
	

}
