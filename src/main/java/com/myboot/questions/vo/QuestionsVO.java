package com.myboot.questions.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("questionsVO")
public class QuestionsVO {
	private int  level;
	private int q_num;
	private String user_id;
	private Date q_Date;
	private String q_title;
	private String q_content;
	private int q_parentNo;
	private String imageFileName;
	
	public QuestionsVO() {
		System.out.println("questionsVO 호출");
	}
	
}
