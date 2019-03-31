package com.quinnox.customercomplaint.dao;

import java.util.List;

import com.quinnox.customercomplaint.pojo.CustomerPojo;

public interface CustomerDao {
public int insertComplaintDao(CustomerPojo customer);
public List getComplaint1(int id,int accId);
public List AllComplaint2();
public void changeStatus(int id,String status);
}
