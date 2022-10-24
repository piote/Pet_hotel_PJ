package com.myboot.review.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("reviewVO")
public class ReviewVO {
	private int level;
	private int reviewNO;
	private int parentNO;
	private String title;
	private String con;
	private String rate ;
	private Date date;
	private String image;
	private int rec;
	private String id;
	
	
	public ReviewVO() {
		System.out.println("reviewVO 호출");
	}
	
	
	
}

