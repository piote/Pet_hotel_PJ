package com.myboot.membership.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myboot.membership.service.MemberShipService;
import com.myboot.user.vo.UserVO;

@Controller("memberShipController")
public class MemberShipControllerImpl implements MemberShipController {
	
	@Autowired
	private MemberShipService memberShipService;
	
	@ResponseBody 
	@RequestMapping(value="/memberShipMod.do" ,method = RequestMethod.GET)
	public Map memberShipMod(@ModelAttribute("id") String id, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
    		
		Map result = new HashMap<String, Integer>();
		int count = memberShipService.membershipCount(id);
		result.put("count", count);
		
		return result;
	}
}