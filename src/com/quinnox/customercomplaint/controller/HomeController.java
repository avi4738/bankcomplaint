package com.quinnox.customercomplaint.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	ServletContext context;
	@RequestMapping("/raise1")
	public String validateUser()
	{
		return "raiseComplaint";
	}
	
	@RequestMapping("/checkStatus1")
	public String validateUser1()
	{
		return "checkStatus";
	}
	
	@RequestMapping("/Home1")
	public String validateUser2()
	{
		return "Home";
	}
	
	@RequestMapping("/logout")
	public String validateUser3(HttpServletRequest req)
	{
    context=req.getServletContext();
    context.removeAttribute("accountId");
     return "login";
	}
	@RequestMapping("/Insidelogin")
	public String validateUser4(HttpServletRequest req)
	{
     return "login";
	}
	
}
