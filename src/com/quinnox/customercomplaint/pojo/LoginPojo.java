package com.quinnox.customercomplaint.pojo;

import javax.persistence.Entity;

public class LoginPojo {

	private int accountId;
	private String password;
	private String name;
	public String getName() {
	return name;
	}
	public void setName(String name) {
	this.name = name;
	}
	public int getAccountId() {
	return accountId;
	}
	public void setAccountId(int accountId) {
	this.accountId = accountId;
	}
	@Override
	public String toString() {
	return "LoginPojo [accountId=" + accountId + ", password=" + password + ", name=" + name + "]";
	}
	public String getPassword() {
	return password;
	}
	public void setPassword(String password) {
	this.password = password;
	}

}
