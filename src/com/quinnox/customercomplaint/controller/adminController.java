package com.quinnox.customercomplaint.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quinnox.customercomplaint.service.CustomerAddComplaintImpl;
@Controller
public class adminController {
	CustomerAddComplaintImpl c1=new CustomerAddComplaintImpl();
ServletContext context;
	@RequestMapping("/adminHome")
	public String validateUser()
	{
		return "adminHome";
	}
	
	@RequestMapping("/adminComplaint")
	public String validateUser1(HttpServletRequest req,HttpServletResponse res)
	{
		
	List list2=c1.allComplaint();
		context=req.getServletContext();
		context.setAttribute("list12", list2);
		return "adminComplaint";
	}
}
