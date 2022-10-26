package com.myboot.user.vo;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("userVO")
public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String tel_sub;
	private String message;
	private Date birth;
	private String joinDate;
	private String grade;
	

	public UserVO() {
		System.out.println("userVO 호출");
	}
	
	
}

