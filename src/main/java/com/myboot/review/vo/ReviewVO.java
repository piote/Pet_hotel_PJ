package com.myboot.review.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("reviewVO")
public class ReviewVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String tel_sub;
	private String message;
	private Date birth;
	private Date joinDate;
	private String grade;
	
	
	public ReviewVO() {
		System.out.println("userVO 호출");
	}
	
	
}

