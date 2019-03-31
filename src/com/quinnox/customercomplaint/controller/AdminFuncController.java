package com.quinnox.customercomplaint.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quinnox.customercomplaint.pojo.CustomerPojo;
import com.quinnox.customercomplaint.service.CustomerAddComplaintImpl;

@Controller
public class AdminFuncController {
	CustomerPojo customerPojo=new CustomerPojo();
	CustomerAddComplaintImpl c1=new CustomerAddComplaintImpl();
	ServletContext context;
	@RequestMapping("/adminTable")
	public String validateUser(@RequestParam("complainId") int cId,@RequestParam("changeStatus") String cStatus,HttpServletRequest req)
	{
		c1.changeStatus(cId, cStatus);
	/*req.getServletContext();
List list13=(List)context.getAttribute("list12");
Iterator it=list13.iterator();
while(it.hasNext())
{
	Object obj[]=(Object[])it.next();
	customerPojo.setStatus();
}*/
		
		List list2=c1.allComplaint();
			context=req.getServletContext();
			context.setAttribute("list12", list2);
		return "adminComplaint";
	}
	
}
