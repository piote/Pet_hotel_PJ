package com.myboot.reservation.vo;

import org.springframework.stereotype.Component;

import com.myboot.mypage.vo.MyPageVO;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Component("resfullVO")
public class ResFullVO {
	private int res_num;
	private String res_st;
	private String res_end;
	private String id;
	private String res_comment;
	private String totalCost;
	private String payTime;
	private String res_state;
	
	//pet
		private int pet_num;
		private String pet_name;
		private String pet_sex;
		private String room_grade;
		private String service_beauty;
		private String service_spa;
		
		
}
