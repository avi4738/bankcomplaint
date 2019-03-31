package com.quinnox.customercomplaint.dao;




import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import com.quinnox.customercomplaint.pojo.LoginPojo;

public class Functionality {


		public int vUser(int accountId,String password){
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction tx =session.beginTransaction();
		System.out.println("inside functionality");
		String hql = "select l.password from LoginPojo l where l.accountId= :a";
		Query query = session.createQuery(hql);
		//Query query = session.createQuery(hql);
		query.setParameter("a",accountId);
		List results = query.list();
		Iterator iterator=results.iterator();
		while(iterator.hasNext()){
		if(iterator.next().equals(password))
		return 1;
		else 
		return 0;
		/*Query query=session.createQuery("select count(*) from LoginPojo  where login.emailid=:email and login.password=:password");
		List<LoginPojo> list=(List<LoginPojo>)query.list();
		int flag=list.size();
		System.out.println(flag);
		return flag;*/
		}
		return 0;
		}
		
		
		public String getUserName(int accountId){
			String name1="";
			Configuration cfg=new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory factory=cfg.buildSessionFactory();
			Session session=factory.openSession();
			Transaction tx =session.beginTransaction();
			Query query=session.createQuery("select name from LoginPojo where accountId="+accountId+"");
			List<LoginPojo> list=(List<LoginPojo>)query.list();
			Iterator it=list.iterator();
			while(it.hasNext())
			{
			 name1=(String)it.next();
			}
			return name1;
		}
}
