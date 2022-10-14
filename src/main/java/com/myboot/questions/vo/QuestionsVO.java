package com.myboot.questions.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("questionsVO")
public class QuestionsVO {
	private int  level;
	private int q_num;
	private String id;
	private Date q_Date;
	private String q_title;
	private String q_content;
	private int q_parentNo;
	
	public QuestionsVO() {
		System.out.println("questionsVO 호출");
	}
	
}
