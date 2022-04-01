package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

	@Controller
	public class FundingController {
		
		//펀딩 리스트
		@GetMapping("fundinguc")
		public String fundinguc() {
			return "funding/fundinguc";
		}
		
		@GetMapping("fundingucdetail")
		public String fundingucdetail() {
			return "funding/fundingucdetail";
		}
		
		@GetMapping("fundingov")
		public String fundingov (){
			return "funding/fundingov";
		}
		
		@GetMapping("fundingovdetail")
		public String fundingovdetail() {
			return	"funding/fundingovdetail";
		}
		
		@GetMapping("fundingtm")
		public String fundingtm() {
			return "funding/fundingtm";
		}
		
		@GetMapping("fundingtmdetail")
		public String fundingtmdetail() {
			return "funding/fundingtmdetail";
		}
		
		
		//펀딩 결제
		@GetMapping("fundingpay")
		public String fundingpay() {
			return "funding/fundingpay";
		}
		
		@GetMapping("fundingpay2")
		public String fundingpay2 () {
			return "funding/fundingpay2";
		}
		
		
		//완료페이지
		@GetMapping("succesamount")
		public String succesamount() {
			return "funding/succesamount";
		}
		
		@GetMapping("succesapply")
		public String succesapply() {
			return "funding/succesapply";
		}
		/*
		 * ck에디터 사진 올리는 거
		 * @ResponseBody
	@PostMapping("/fb_upload")
	public Map<String, Object> fileupload(@RequestParam(value="upload") MultipartFile file) {
		String path = servletContext.getRealPath("/upload/");
		String filename = file.getOriginalFilename();
		File destFile = new File(path+filename);
		Map<String, Object> json = new HashMap<>();
		try {
			file.transferTo(destFile);
			json.put("uploaded", 1);
			json.put("fileName", filename);
			json.put("url", "/fileview/"+filename);
		} catch(IOException e) {
			e.printStackTrace();
		} 
		return json;
	}	
		@GetMapping(value="/routethumbfileview/{filename}")
	public void thumbfileview(@PathVariable String filename, 
			HttpServletRequest request, HttpServletResponse response)
	{			
		String path = servletContext.getRealPath("/thumb/route/");
		File file = new File(path+filename);
		String sfilename = null;
		FileInputStream fis = null;
		
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename = URLEncoder.encode(file.getName(), "utf-8");
			} else {
				sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out = response.getOutputStream();
			fis= new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {}
			}
		}		
	*
	*/

		
	}

