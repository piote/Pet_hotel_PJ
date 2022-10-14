package com.myboot.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboot.user.vo.UserVO;

import lombok.Data;

@Data
@Component("ReviewVO")
public class ReviewVO {
	private int num;
	private String title;
	private String	con;
	private int star;
	private Date date;
	private String image;
	private int rec;
	
}