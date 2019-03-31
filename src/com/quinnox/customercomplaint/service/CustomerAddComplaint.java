package com.quinnox.customercomplaint.service;

import java.util.List;

import com.quinnox.customercomplaint.pojo.CustomerPojo;

public interface CustomerAddComplaint {
		public int insertComplaint(CustomerPojo customer);
		public List getComplaint(int id,int accId);
		public List allComplaint(); 
		public void changeStatus(int complainId,String status);
		
}
