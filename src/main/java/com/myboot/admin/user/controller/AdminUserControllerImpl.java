package com.myboot.admin.user.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.user.service.AdminUserService;
import com.myboot.user.service.UserService;
import com.myboot.user.vo.UserVO;

@Controller("adminUserController")
public class AdminUserControllerImpl implements AdminUserController {
	
	@Autowired
	private UserVO userVO;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private UserService userService;
	
	@Override
	@RequestMapping("/admin/adminUserList.do")
	  public ModelAndView UserList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		userVO = (UserVO) session.getAttribute("user");
		
//		response.setCharacterEncoding("EUC-KR");
//		if(userVO!=null) {
//			System.out.println(userVO);
//			System.out.println(userVO.getId());
//			
//			if(userVO.getId().equals("admin")) {
//				System.out.println("관리자");
//				mav.setViewName("/admin/adminUserList");
//				return mav;
//			}
//		}
//		
//		PrintWriter writer = response.getWriter();
//	    writer.println("<script type='text/javascript'>");
//	    writer.println("alert('권한이 없습니다.');");
//	    writer.println("history.back();");
//	    writer.println("</script>");
//	    writer.flush();
//	    return null;
		
	    mav.setViewName("/admin/adminUserList");
		return mav;
	  }
	
//	@Override
//	@RequestMapping("/admin/adminResList.do")
//	public ModelAndView ResList(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		userVO = (UserVO) session.getAttribute("user");
//		
//		response.setCharacterEncoding("EUC-KR");
//		if(userVO!=null) {
//			System.out.println(userVO);
//			System.out.println(userVO.getId());
//			
//			if(userVO.getId().equals("admin")) {
//				System.out.println("관리자");
//				mav.setViewName("/admin/adminResList");
//				return mav;
//			}
//		}
//
//		
//		PrintWriter writer = response.getWriter();
//		writer.println("<script type='text/javascript'>");
//		writer.println("alert('권한이 없습니다.');");
//		writer.println("history.back();");
//		writer.println("</script>");
//		writer.flush();
//		return null;
//		
//	}
	
	@RequestMapping("/admin/adminResListT.do")
	public ModelAndView ResListT(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("관리자");
		mav.setViewName("/admin/adminResListT");
		return mav;
		
	}
	
	//모든 유저목록 출력 ( 첫 호출 )
	@ResponseBody 
	@RequestMapping(value= "/returnAllUser.do", method = RequestMethod.GET)
	public List<UserVO> returnAllUser() throws Exception{
		List<UserVO> allUser =  adminUserService.listUsers();
		return allUser;
	}
	
	//검색 후 유저목록 출력
	@ResponseBody 
	@RequestMapping(value= "/adminSearchUser.do", method = RequestMethod.POST)
	public List<UserVO> adminUserListById(@RequestBody Map<String,Object> searchMap,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println(searchMap);
		
		Map<String,String> grade_ck = (Map<String, String>) searchMap.get("grade_ck");
		
		Map<String, String> searchOption = new HashMap<String, String>();
		
		searchOption.put("search_op", (String) searchMap.get("search_op"));
		searchOption.put("keyword", (String) searchMap.get("keyword"));
		if(searchMap.get("res_ck")!=null) {
			searchOption.put("res_state", (String) searchMap.get("res_ck"));
		}
		
		if(grade_ck.size()<4 || grade_ck.size()>0) {
			int i=1;
			for(String key : grade_ck.keySet()) {
				searchOption.put("grade"+i,grade_ck.get(key));
				i++;
			}
		}
		
		System.out.println(searchOption);

		List<UserVO> searchUsers; 
		searchUsers= adminUserService.searchUsersOption(searchOption);
		
		return searchUsers;
	}
	
	
	//수정
//	@ResponseBody 
//	@RequestMapping(value="/adminModUser.do" ,method = RequestMethod.POST)
//	public List<UserVO> adminModMember(@ModelAttribute("user") UserVO user, 
//			HttpServletRequest request, HttpServletResponse response) throws Exception{
//    		
//		int result = 0;
//		String birth=request.getParameter("birth_string");
//		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date formatDate = dtFormat.parse(birth);
//		user.setBirth(formatDate);
//
//		if(user.getMessage()==null || user.getMessage()==""){
//			user.setMessage("N");
//			System.out.println("N");
//		}
//		
//		System.out.println(user);
//		
//		result = adminUserService.UpdateUser(user);
//		
//		System.out.println(result);
//		
//		List<UserVO> allUser =  adminUserService.listUsers();
//		return allUser;
//	}
	
	@ResponseBody 
	@RequestMapping(value="/adminModUser.do" ,method = RequestMethod.POST)
	public List<UserVO> adminModMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		Map<String,Object> user = new HashMap<String, Object>();
		
		   Enumeration enu=multipartRequest.getParameterNames();
		   
		   while(enu.hasMoreElements()){
		      String name=(String)enu.nextElement();
		      String value=multipartRequest.getParameter(name);
		      if(value.equals("undefined")) {
		    	  user.put(name,"");
		      }else {
		    	  user.put(name,value);
		      }
		   }
		
		int result = 0;
		String birth=multipartRequest.getParameter("birth_string");
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date formatDate = dtFormat.parse(birth);
		user.put("birth",formatDate);
		
		if(user.get("message")==null || user.get("message")==""){
			user.put("message","N");
			System.out.println("N");
		}
		
		String imageFileName= upload(multipartRequest, (String) user.get("id"));
		
		if(imageFileName!=null && imageFileName!="") {
			user.put("img_name",imageFileName);
		}else {
			user.put("img_name",user.get("old_img_name"));
		}
		
		System.out.println(user);
		//============================================realPath 받아오기
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\user\\user_image";
		
		try {
			result = adminUserService.UpdateUser(user);
			if(imageFileName!=null && imageFileName.length()!=0) {
				
				File srcFile = new File(path+ "\\" + "temp"+ "\\" + imageFileName);
				
				File oldFile = new File(path+ "\\" +imageFileName);
				
				if(oldFile.exists()) {
					oldFile.delete();
				}
				
				File destDir = new File(path);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
		}catch(Exception e) {
			File srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			e.printStackTrace();
		}
		
		List<UserVO> allUser = adminUserService.listUsers();
		return allUser;
	}
	
	
	//한개 이미지 업로드하기
		private String upload(MultipartHttpServletRequest multipartRequest, String id) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		String fileType = multipartRequest.getMultipartContentType("imageFileName");
		String picFileName =null;
		
		//============================================realPath 받아오기
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\user\\user_image";
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			System.out.println(imageFileName);
			
			if(imageFileName==null || imageFileName=="") {
				return "";
			}
			
			String picfileType = imageFileName.substring(imageFileName.lastIndexOf("."));
			System.out.println(picfileType);
			
			picFileName = id + picfileType;
			System.out.println(picFileName);
			
			File file = new File(path +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(path +"\\"+"temp"+ "\\"+picFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
				}
			}
		}
		return picFileName;
	}

	
	//유저활성화
	@ResponseBody 
	@RequestMapping(value="/adminActiveUser.do" ,method = RequestMethod.POST)
	public List<UserVO> adminActiveUser(@RequestParam("id") String id, 
			@RequestParam("active") String active,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
    		
		int result = 0;
			
		if(active.equals("Y")) {
			result = adminUserService.removeUserState(id);
		}else {
			result = adminUserService.activeUserState(id);
		}
		
		List<UserVO> allUser = adminUserService.listUsers();
		return allUser;
	}
	
}
