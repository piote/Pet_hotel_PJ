package com.myboot.reservation.vo;

import org.springframework.stereotype.Component;

import com.myboot.mypage.vo.MyPageVO;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Component("petserviceVO")
public class PetserviceVO {
	private int pet_num;
	private String pet_name;
	private String pet_sex;
	private String room_grade;
	private String service_beauty;
	private String service_spa;

	
}
