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
	private String ROOM_GRADE;

    //예약
	private int res_num;
	private Date res_st;
	private Date res_end;
	private String res_comment;
	private String totalCost;
	private String payTime;
	private String res_state;
	
    private String user_id;
    private Date startDate;
    private Date endDate;
    private String searchWord;
    private String colName;
	
    private String pet_name;
	
	
	public ReviewVO() {
		System.out.println("reviewVO 호출");
	}
	
	
	
}

