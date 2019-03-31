package com.quinnox.customercomplaint.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.quinnox.customercomplaint.pojo.CustomerPojo;
import com.quinnox.customercomplaint.service.CustomerAddComplaintImpl;

@Controller
public class RaiseComplaintController {
	ServletContext context;
	//@Autowired
 //private CustomerAddComplaint callInteface;
	 CustomerAddComplaintImpl complaintImp=new CustomerAddComplaintImpl();
	@RequestMapping(value="/raiseComplaint")
	public String validateUser(HttpServletRequest req,HttpServletResponse res,@RequestParam("branchCode") String branchCode,
			@RequestParam("description") String description,@RequestParam("email") String email,@RequestParam("category") String category,ModelAndView model) {
		System.out.println("raise complaint");
		   context=req.getServletContext();
			int id=(Integer)context.getAttribute("accountId");
			System.out.println(id);
			String priority="";
			CustomerPojo customer=new CustomerPojo();
			if(category.equalsIgnoreCase("internet banking"))
			{
				customer.setPriority("HIGH");
			}
			else if(category.equalsIgnoreCase("general banking"))
			{
				customer.setPriority("Medium");
			}
			else{
				customer.setPriority("low");
			}
			
			customer.setAccountId(id);
			customer.setBranchCode(branchCode);
			customer.setCategory(category);
			customer.setEmail(email);
			customer.setDescription(description);
			customer.setStatus("open");
			System.out.println("inside raise controller");
			int flag=complaintImp.insertComplaint(customer);
			
			int cId=customer.getComplaintId();
			System.out.println(cId);
			if(flag==1){
				
		    context.setAttribute("complaintId", cId);
			return "success";
			}
			else 
				return "raiseComplaint";

	}
}