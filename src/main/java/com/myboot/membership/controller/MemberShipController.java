package com.myboot.membership.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;

public interface MemberShipController {
	public Map memberShipMod(@ModelAttribute("id") String id, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
