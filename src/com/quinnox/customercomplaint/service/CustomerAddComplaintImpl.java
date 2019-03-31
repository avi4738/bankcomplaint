package com.quinnox.customercomplaint.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.quinnox.customercomplaint.dao.CustomerDaoImpl;
import com.quinnox.customercomplaint.pojo.CustomerPojo;
//@Service("CustomerAddComplaint")
@Service
public class CustomerAddComplaintImpl implements CustomerAddComplaint {
	CustomerDaoImpl c=new CustomerDaoImpl();
	 @Override
	public void changeStatus(int complainId,String status) {
		// TODO Auto-generated method stub
		 c.changeStatus(complainId, status);
		
	}

	
	@Override
	public List allComplaint() {
List list1=c.AllComplaint2();
		return list1;
	}

	//@Autowired
	//private CustomerDao customerDao;
	
/*public int insertComplaint(CustomerPojo customer)
{
	System.out.println("inside service int");
int flag=customerDao.insertComplaintDao(customer);
if(flag==1)
return 1;
else
return 0;
}*/

	@Override
	public int insertComplaint(CustomerPojo customer) {
		// TODO Auto-generated method stub
		System.out.println("inside service int");
	//	int flag=this.customerDao.insertComplaintDao(customer);
		int flag=c.insertComplaintDao(customer);
		if(flag==1)
		return 1;
		else
		return 0;
	}

	@Override
	public List getComplaint(int id,int accId) {
		// TODO Auto-generated method stub
		List complaintList=c.getComplaint1(id,accId);
		System.out.println(complaintList);
		return complaintList;
	}

	/*public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}*/
}
