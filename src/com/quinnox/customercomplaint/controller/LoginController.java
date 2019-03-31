package com.quinnox.customercomplaint.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.quinnox.customercomplaint.dao.Functionality;
import com.quinnox.customercomplaint.pojo.LoginPojo;

@Controller
@Component
public class LoginController {
	
	
	ServletContext context;

	@RequestMapping("/new")
	public ModelAndView validateUser(@RequestParam("accountId") int accountId, @RequestParam("pass") String password,
			HttpServletRequest req,HttpServletResponse res) {
		System.out.println("sasdsad");
		Functionality functionality = new Functionality();
		/*LoginPojo loginPojo=new LoginPojo();
		loginPojo.setAccountId(accountId);
		loginPojo.setPassword(password);*/
		ModelAndView modelAndView=new ModelAndView();
		int flag = functionality.vUser(accountId,password);
		if (flag == 0) {
			System.out.println("first  if");
			String error="UserName or Password incorrect";
			modelAndView.addObject("error",error);
			modelAndView.setViewName("login");
			return modelAndView;
		} else {
			
			System.out.println("loginController");
			String name=functionality.getUserName(accountId);
			if(accountId==1234567){
				context=req.getServletContext();
				context.setAttribute("name", name);
				context.setAttribute("accountId", accountId);
				modelAndView.addObject("name", name);
				modelAndView.addObject("accountId", accountId);
				modelAndView.setViewName("adminHome");
				return modelAndView;
			}else{
			context=req.getServletContext();
			context.setAttribute("name", name);
			context.setAttribute("accountId", accountId);
			modelAndView.addObject("name", name);
			modelAndView.addObject("accountId", accountId);
			modelAndView.setViewName("Home");
			return modelAndView;
		}}
	}
}
