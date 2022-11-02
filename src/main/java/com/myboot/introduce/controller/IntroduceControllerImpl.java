package com.myboot.introduce.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		String viewName = "introduce";
		introduceVO = (IntroduceVO) introduceService.listintroduce();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("introduce", introduceVO);
		System.out.println(introduceVO);

		return mav;
	}

	@Override
	@RequestMapping(value="/modintroduce.do" , method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView modintroduce (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) 
	throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> introduceMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			introduceMap.put(name,value);
		}
		introduceService.modIntroduce(introduceMap);
		mav.setViewName("redirect:/introduce.do");
//		mod.*****jsp가 없어서 정보를 가지고 어디를 가야하는지 모르기 때문에 경로를 설정해줌	
		
		return mav;
	} 
/*		
 		String imageFileName= upload(multipartRequest); 
		HttpSession session = multipartRequest.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId(); 
		introduceMap.put("parentNO", 0);
		introduceMap.put("id", id); 
		introduceMap.put("imageFileName", imageFileName); 
		
		String message;
		ResponseEntity resEnt=null;
		
		String path = (String) session.getAttribute("realPath")+"resources\\questions\\questions_image";
		System.out.println("in "+path);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int introduceNO = introduceService.modIntroduce(introduceMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new File(path+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(path+"\\"+ introduceNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/introduce.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(path+"\\"+"temp"+"\\"+ imageFileName);
			srcFile.delete();
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/introduce.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		//다 쓴 경로 삭제
		session.removeAttribute("realPath");
		return resEnt;*/

/*
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		// 세션에 있는 경로를 받아온다
		HttpSession session = multipartRequest.getSession();
		String path = (String) session.getAttribute("realPath") + "resources\\questions\\questions_image";

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(path + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs(); // 경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(path + "\\" + "temp" + "\\" + imageFileName)); // 임시로 저장된 multipartFile을
																								// 실제 파일로 전송
				}
			}
		}
		return imageFileName;
	} */
}