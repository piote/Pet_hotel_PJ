package com.myboot.admin.reservation.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("adminuserVO")
public class AdminUserVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String tel_sub;
	private String message;
	private Date birth;
	private Date joinDate;
	private String grade;

}
