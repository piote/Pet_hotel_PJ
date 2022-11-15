package com.myboot.introduce.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.introduce.service.IntroduceService;
import com.myboot.introduce.vo.IntroduceVO;

@Controller("introduceController")
public class IntroduceControllerImpl implements IntroduceController {
	
	@Autowired
	IntroduceService introduceService;

	@Autowired
	IntroduceVO introduceVO;
	
	@Override
	@RequestMapping(value = "/introduce.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView introduceView (HttpServletRequest request, HttpServletResponse response) 
	throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "introduce";
		mav.setViewName(viewName);
		introduceVO = (IntroduceVO) introduceService.listintroduce();
		mav.addObject("introduce", introduceVO);
		System.out.println(introduceVO);

		return mav;
	}

	@Override
	@RequestMapping(value="/modintroduce.do" , method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity modintroduce (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) 
	throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> introduceMap = new HashMap<String, Object>();
	         
	    Enumeration enu = multipartRequest.getParameterNames();
	    while(enu.hasMoreElements()) {
	    	String name = (String)enu.nextElement();
	        String value = multipartRequest.getParameter(name);
	        introduceMap.put(name,value);
	    }
	            
	    Map<String, String> fileMap = upload(multipartRequest);
	         
	    for(String key : fileMap.keySet()) {
	    	if(fileMap.get(key)!=null && fileMap.get(key)!="") {
	    		introduceMap.put(key,fileMap.get(key));
	        } else {
	        	String original = (String) introduceMap.get("original"+key);
	            introduceMap.put(key,original);
	        }
	    }
	    String message;
	    ResponseEntity resEnt = null;
	    String imageFileName = null;
	    String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
	    String path = realPath+"resources\\introduce\\introduce_image";
	         
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	    	int i_Num = introduceService.modIntroduce(introduceMap);
	    	if(fileMap!=null && fileMap.size()!=0) {
	    		for(String key : fileMap.keySet()) {
	    			imageFileName = fileMap.get(key);
	    			File srcFile = null;
	    			if(imageFileName==null || imageFileName=="") {
	    				imageFileName = (String) introduceMap.get(key);
	    				srcFile = new File(path+"\\"+(i_Num-1)+"\\"+imageFileName);
	    				File destFile = new File(path+"\\"+i_Num+"\\"+imageFileName);
	    				FileUtils.copyFile(srcFile, destFile,true);
	    			} else {
	    				srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName);
	    				File src2File = new File(path+"\\"+i_Num+"\\"+imageFileName);
	    				File destDir = new File(path+"\\"+i_Num);
	    				if(!src2File.exists()) {
	    					FileUtils.moveFileToDirectory(srcFile, destDir,true);
	    				}
	    			}
	    		}
	    	}
	    	message = "<script>";
	    	message += " alert('수정 완료했습니다.');";
	    	message += " location.href='"+ multipartRequest.getContextPath()+"/introduce.do'; ";
	    	message +=" </script>";
	    	resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    	} catch(Exception e) {
	    		File srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName);
	            srcFile.delete();
	            message = " <script>";
	            message +=" alert('수정을 실패했습니다. 다시 확인해 주세요');');";
	            message +=" location.href='"+multipartRequest.getContextPath()+"/introduce.do'; ";
	            message +=" </script>";
	            resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	            e.printStackTrace();
	    	}
	    	return resEnt;
		}

		private Map<String,String> upload(MultipartHttpServletRequest multipartRequest) 
		throws Exception {
			Map<String,String>fileMap = new HashMap<String,String>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
			String path = realPath+"resources\\introduce\\introduce_image";

			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName = mFile.getOriginalFilename();
				fileMap.put(fileName, originalFileName);
				File file = new File(path +"\\"+"temp"+"\\" + originalFileName);
				if(mFile.getSize()!=0) {
					if(!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(path +"\\"+"temp"+ "\\"+originalFileName)); 
					}
				}
			}
			return fileMap;
		}   
}