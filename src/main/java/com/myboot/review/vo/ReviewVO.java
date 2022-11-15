package com.myboot.review.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("reviewVO")
public class ReviewVO {
	//리뷰
	private int level;
	private int reviewNO;
	private int parentNO;
	private int rec;
	private int rating;
	private int like_cnt;
	
	private Date date;
	
	private String title;
	private String con;
	private String rate ;
	private String image;
	private String id;
	private String ROOM_GRADE;
	private String imageFileName;
	private String user_review_flg;
	
	
    //예약
	private int res_num;
	
	private Date res_st;
	private Date res_end;
	private Date startDate;
	private Date endDate;
	
	private String res_comment;
	private String totalCost;
	private String payTime;
	private String res_state;
    private String user_id;
    private String searchWord;
    private String colName;
    private String pet_name;
	
	
}

