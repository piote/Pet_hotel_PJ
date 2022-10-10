package com.myboot.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("userController")
public class UserControllerImpl implements UserController{
	
	@ResponseBody
	@RequestMapping("/user.do") 
	public String userMain(Model model){
		String a = "user";
		return a; 
	}


  
}
