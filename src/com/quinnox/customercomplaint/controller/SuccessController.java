package com.quinnox.customercomplaint.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quinnox.customercomplaint.service.CustomerAddComplaintImpl;

@Controller 
public class SuccessController {
	ServletContext context;
	CustomerAddComplaintImpl complaintImp=new CustomerAddComplaintImpl();
@RequestMapping(value="/Check",method=RequestMethod.POST)
		public String checkStatus(@RequestParam ("comId") int cId,HttpServletRequest req,HttpServletResponse res,Model model)
		{
	context=req.getServletContext();
	int accId=(Integer)context.getAttribute("accountId");
	List complaintList1=complaintImp.getComplaint(cId,accId);
	System.out.println(complaintList1);
	
	System.out.println(complaintList1);
	context.setAttribute("list", complaintList1);
	
	/*model.addAttribute("description",complaintList1.getDescription() );
	model.addAttribute("complaintId",complaintList1.getComplaintId());
	model.addAttribute("status",complaintList1.getStatus());*/
	//System.out.println(model.toString());
	
			return "checkStatus";

		}
		
	}
