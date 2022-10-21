package com.myboot.mypage.vo;

import org.springframework.stereotype.Component;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Component("mypageVO")
public class MyPageVO {
    private String user_id;
    private String startDate;
    private String endDate;

}
