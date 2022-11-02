package com.myboot.introduce.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("introduceVO")
public class IntroduceVO {
//	글 번호라 생각할 것	
	private int intro_num; 
	private String intro_title1;
	private String intro_contents1;
	private String intro_image1;
	private String intro_title2;
	private String intro_contents2;
	private String intro_image2;
	private String intro_title3;
	private String intro_contents3;
	private String intro_image3;
	private String intro_title4;
	private String intro_contents4;
	private String intro_image4;
	private String intro_title5;
	private String intro_contents5;
	private String intro_image5;
	private String intro_title6;
	private String intro_contents6;
	private String intro_image6;
	
	public IntroduceVO() {
		System.out.println("introduceVO 호출");
	}
	
}