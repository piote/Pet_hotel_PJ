package com.myboot.user.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("userVO")
public class UserVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String tel_sub;
	private String message;
	private Date birth;
	private Date joinDate;
	
	public UserVO() {
		System.out.println("userVO 호출");
	}
	
	
}

