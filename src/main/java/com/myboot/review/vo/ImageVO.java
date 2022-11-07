package com.myboot.review.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;


public class ImageVO {
	private int imageFileNO;
	private String imageFileName;
	private Date regDate;
	private int reviewNO;
	
	
	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!= null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
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
