package com.myboot.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboot.user.vo.UserVO;

import lombok.Data;

@Data
@Component("reviewVO")
public class reviewVO {
	private int level;
	private int num;
	private String title;
	private String	con;
	private int star;
	private Date date;
	private int parentNO;
	private String image;
	private int rec;
	private String id;
	
	public	reviewVO() {
		System.out.println("reviewVO 호출");
	}
	
	
	
	
	
}