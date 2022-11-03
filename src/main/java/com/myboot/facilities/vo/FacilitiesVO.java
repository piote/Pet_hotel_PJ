package com.myboot.facilities.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("facilitiesVO")
public class FacilitiesVO {
//	글 번호라 생각할 것	
	private int fac_num;
	private String fac_idx1;
	private String fac_idx2;
	private String fac_idx3;
	private String fac_idx4;
	private String fac_inimg1;
	private String fac_inimg2;
	private String fac_inimg3;
	private String fac_inimg4;
	private String fac_intitle;
	private String fac_incontents;	
	private String fac_outimg1;
	private String fac_outimg2;
	private String fac_outimg3;
	private String fac_outtitle;
	private String fac_outcontents;
	private String fac_rmimg1;												
	private String fac_rmtitle1;
	private String fac_rmcontents1;
	private String fac_rmimg2;
	private String fac_rmtitle2;
	private String fac_rmcontents2;
	private String fac_rmimg3;
	private String fac_rmtitle3;
	private String fac_rmcontents3;
	private String fac_rmcau;
	private String fac_cutimg1;
	private String fac_cutimg2;
	private String fac_cuttitle;
	private String fac_cutcontents;
	private String fac_spaimg1;
	private String fac_spaimg2;
	private String fac_spatitle;
	private String fac_spacontents;
	private String fac_spacau;
	
	public FacilitiesVO() {
		System.out.println("introduceVO 호출");
	}
	
}