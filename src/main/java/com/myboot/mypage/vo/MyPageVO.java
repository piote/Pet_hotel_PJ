package com.myboot.mypage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("mypageVO")
public class MyPageVO {
    private String user_id;
    private Date startDate;
    private Date endDate;
    private String searchWord;
    private String colName;
}
