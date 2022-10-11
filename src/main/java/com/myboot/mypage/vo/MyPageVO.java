package com.myboot.mypage.vo;

import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component("mypageVO")
public class MyPageVO {
    private String user_id;
    private String beginDate;
    private String endDate;
}
