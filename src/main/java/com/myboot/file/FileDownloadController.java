package com.myboot.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FileDownloadController {
	
	String r = this.getClass().getResource("/").getPath().replaceAll("/WEB-INF/classes/","/");
	String r1 = this.getClass().getResource("/").getPath();
	
	private static final String ARTICLE_IMAGE_REPO = "";
	//private static final String QUESTIONS_IMAGE_REPO = "C:\\questions\\questions_image";
	private final String QUESTIONS_IMAGE_REPO = r1+ "webapp/resources/questions/questions_image";
	
	@RequestMapping("/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("articleNO") String articleNO,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" +articleNO+"\\"+ imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	@RequestMapping("/qDownload.do")
	protected void qDownload(@RequestParam("imageFileName") String imageFileName,
			@RequestParam("articleNO") String articleNO,
			HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = QUESTIONS_IMAGE_REPO + "/" +articleNO+"/"+ imageFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
