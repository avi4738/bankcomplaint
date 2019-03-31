package com.quinnox.customercomplaint.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import com.quinnox.customercomplaint.pojo.CustomerPojo;


public class CustomerDaoSession {
	
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}

	public void saveCustomer(CustomerPojo customer)  {
		Session session=this.sessionFactory.openSession();
		Transaction tx=(Transaction) session.beginTransaction();
		session.persist(customer);
	tx.commit();

}
}
