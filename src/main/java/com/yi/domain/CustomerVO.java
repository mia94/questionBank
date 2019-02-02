package com.yi.domain;

public class CustomerVO {
	private String customerCode;
	private String customerName;
	private String id;
	private String password;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isEmployee() {
		return employee;
	}
	public void setEmployee(boolean employee) {
		this.employee = employee;
	}
	
	@Override
	public String toString() {
		return "CustomerVO [customerCode=" + customerCode + ", customerName=" + customerName + ", id=" + id
				+ ", password=" + password + ", email=" + email + ", employee=" + employee + "]";
	}
	
	
	
}
