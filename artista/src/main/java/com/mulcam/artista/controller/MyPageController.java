package com.mulcam.artista.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("mypage")
@Controller
public class MyPageController {

	@GetMapping({"/", ""})
	public String mypageMain() {
		return "mypage/mypage";
	}
	
	/* 예선 : 작가등록 신청 */
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("apply")
	public String mypageApplyArtist() {
		return "mypage/apply";
	}
	
	//프로필 프리뷰
	@GetMapping(value="/artistprofile/{filename}")
	public void fileview(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
		/*현재 /fileview/board/${file.originalFilename } 경로로 요청이 들어왔는데,
		${file.originalFilename }은 URL에 변수를 담은 템플릿변수에 해당한다. 이를 filename이라는 변수로 받은 것이고
		요청을 처리하는 메서드에서 이를 파라미터로 받아서 처리해야하기 때문에 PathVaribale이라는 어노테이션을 사용한다. */
		String path= servletContext.getRealPath("imgupload/artistProfile/");
		File file=new File(path+filename); 
		String sfilename=null;
		FileInputStream fis=null;
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename=URLEncoder.encode(file.getName(), "UTF-8");
			} else {
				sfilename=new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/octet-stream; charest=UTF-8");
//			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out=response.getOutputStream();
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out); 
			out.flush(); 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try{
					fis.close(); 
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	@GetMapping(value="/artistWorld/{filename}")
	public void artistWorldfileview(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
		/*현재 /fileview/board/${file.originalFilename } 경로로 요청이 들어왔는데,
		${file.originalFilename }은 URL에 변수를 담은 템플릿변수에 해당한다. 이를 filename이라는 변수로 받은 것이고
		요청을 처리하는 메서드에서 이를 파라미터로 받아서 처리해야하기 때문에 PathVaribale이라는 어노테이션을 사용한다. */
		String path= servletContext.getRealPath("/imgupload/artistWorld/");
		File file=new File(path+filename); 
		String sfilename=null;
		FileInputStream fis=null;
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename=URLEncoder.encode(file.getName(), "UTF-8");
			} else {
				sfilename=new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/octet-stream; charest=UTF-8");
			OutputStream out=response.getOutputStream();
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out); 
			out.flush(); 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try{
					fis.close(); 
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@GetMapping("mypagemodify")
	public String mypagemodify() {
		return "mypage/mypagemodify";
	}
	@GetMapping("paymentinfo")
	public String paymentinfo() {
		return "mypage/paymentinfo";
	}
}
