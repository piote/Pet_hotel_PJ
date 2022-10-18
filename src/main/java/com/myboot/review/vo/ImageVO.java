package com.myboot.review.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

public class ImageVO {
	private int imageFileNO;
	private String imageFileName;
	private Date regDate;
	private int reviewNO;
	public void setImageFileName(String fileName) {
		this.imageFileNO = imageFileNO;
		
	}
	public String getImageFileName() {
		return imageFileName;
		
	}
	public void setImageFileNO(int imageFileNO) {
		this.imageFileNO = imageFileNO;
		
	}
	public void setReviewNO(int reviewNO) {
		this.reviewNO = reviewNO;
		
	}
	

}
