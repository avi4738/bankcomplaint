package com.quinnox.customercomplaint.dao;




import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import com.quinnox.customercomplaint.pojo.CustomerPojo;
@Repository
public class CustomerDaoImpl implements CustomerDao {
	ServletContext context;
	@Override
	public void changeStatus(int id, String status) {
		// TODO Auto-generated method stub
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction tx =session.beginTransaction();
		if(status.equalsIgnoreCase("Wip")){
     Query query=session.createQuery("update CustomerPojo set status='Wip' where complaintId="+id+" and status not in('Closed')");
     query.executeUpdate();
     System.out.println("inside update");
     tx.commit();
		}
		else if(status.equalsIgnoreCase("Closed")){
		     Query query=session.createQuery("update CustomerPojo set status='Closed' where complaintId="+id+" and status='Wip'");
		     query.executeUpdate();
		     tx.commit();
				}
		else{
			System.out.println("cant'update");
		}
	}

	@Override
	public List AllComplaint2() {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction tx =session.beginTransaction();
		//Query query=session.createQuery("select complaintId,priority,description,status from CustomerPojo ");
		Query query=session.createQuery("select complaintId,priority,description,status from CustomerPojo order by priority");
		List list= query.list();
		System.out.println(list);
		return list;
	}

	@Override
	public List getComplaint1(int id,int accId){
		// TODO Auto-generated method stub
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction tx =session.beginTransaction();
	  System.out.println("Beforecustomerpojo");
		Query query=session.createQuery("select complaintId,description,status from CustomerPojo where accountId="+accId+" and complaintId="+id);
		List list= query.list();
	/*CustomerPojo customerPojo=(CustomerPojo)session.get(CustomerPojo.class,id);*/
	System.out.println(list.size());
 return list;
	}

	//@Autowired(required=true
	@Override
	public int insertComplaintDao(CustomerPojo customer) {
		// TODO Auto-generated method stub
		System.out.println("inside customer dao");
		/*Session session=this.factory.getCurrentSession();*/

		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		CustomerDaoSession customerDaoSession=context.getBean(CustomerDaoSession.class);
		customerDaoSession.saveCustomer(customer);
		return 1;
	}
	
	/*public int insertComplaintDao(CustomerPojo customer){
		System.out.println("inside customer dao");
		Session session=this.factory.getCurrentSession();
		session.persist(customer);
	return 1;	
	}*/
}
