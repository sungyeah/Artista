package com.mulcam.artista.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.ArtistApplyService;
import com.mulcam.artista.service.ArtistWorldService;
import com.mulcam.artista.service.MyPageServiceImpl;
import com.mulcam.artista.service.MypageService;
import com.mulcam.artista.service.SubPageServiceImpl;
import com.mulcam.artista.service.WorkService;

@RequestMapping("mypage")
@Controller
public class MyPageController {
	
	@Autowired
	SubPageServiceImpl subPageService;
	
	@Autowired
	MypageService myPageService;
	
	@Autowired
	ArtistApplyService artistapplyService;
	
	@Autowired
	ArtistWorldService artistworldService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	WorkService workService;

	@GetMapping({"/", ""})
	public String mypageMain(Model model) {
		String id = (String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
//			model.addAttribute("check", check);
			model.addAttribute("name",mem.getName());
			List<Order> ord = myPageService.orderList(id);
//			List<Work> ord2 = new ArrayList<Work>();
			for(int i=0;i<ord.size();i++) {
				Order order = ord.get(i);
				String[] arr = order.getWorkNo().split(",");
				List<Work> work = new ArrayList<Work>();
					for(int j=0;j<arr.length;j++) {
						int workno = Integer.parseInt(arr[j]);
						System.out.println("workno"+workno);
						Work work2 = workService.workinfo(workno);
						work.add(work2);
						model.addAttribute("works",work);
					}
				System.out.println("List<Work> work: "+work);
//				ord2.add(work);
			}
			model.addAttribute("orders",ord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mypage/mypage";
	}
	
	/* 예선 : 작가등록 신청 */
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("apply")
	public String mypageApplyArtist(Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		return "mypage/apply";
	}
	
	@PostMapping("artistapply")
	public String ApplyArtist(
			@ModelAttribute ArtistApply apply,
			@RequestParam(value="artistImgFile") MultipartFile artistImgFile,
			MultipartHttpServletRequest mrequest) {
		
		/* 아티스트 대표이미지 저장 */
		String path = servletContext.getRealPath("/imgupload/artistProfile/");
		String[] mtypes = artistImgFile.getContentType().split("/");
		File destFile = new File(path + apply.getArtistName() +"."+ mtypes[1]);
		try {			
			artistImgFile.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		apply.setArtistImg(apply.getArtistName() + "." + mtypes[1]);
		
		// 아티스트 작품세계 업로드
		Iterator<String> fnames = mrequest.getFileNames();
		while(fnames.hasNext()) {
			String fileName = fnames.next();
			//name이 artistImg인 파일은 생략!
			if(!fileName.equals("artistImg")) {
				MultipartFile mfile = mrequest.getFile(fileName);
				if(mfile.getSize()>0) {
					ArtistWorld worldImg = new ArtistWorld();
					try {
						//아티스트 작품세계 업로드 폴더 경로
						String path_artistWorld = servletContext.getRealPath("/imgupload/artistWorlds/");
						String[] imgtypes = mfile.getContentType().split("/");
						System.out.println(artistworldService.getArtistWorldId());
						File dest_artistWorld = new File(path_artistWorld+artistworldService.getArtistWorldId()+ "."+imgtypes[1]);
						try {			
							mfile.transferTo(dest_artistWorld);
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						// 아티스트 작품세계 이미지 DB 넣기
						worldImg.setImgNo(artistworldService.getArtistWorldId());
						worldImg.setId(apply.getId());
						worldImg.setImgType("."+imgtypes[1]);
						artistworldService.insertArtistWorldFile(worldImg);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			}
		}
		
		try {
			apply.setArtistNo(artistapplyService.getApplyArtistNo());
			artistapplyService.insertArtistApply(apply);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}	
		return "mypage/succesapply";
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
	public String mypagemodify(Model model) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("mem",mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mypage/mypagemodify";
	}
	
	@PostMapping("mypagemodify")
	public ModelAndView mypagemodify2(Member mem) {
		ModelAndView mv = new ModelAndView("redirect:/mypage");
		try {
			subPageService.updateMember(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("pwcheck")
	public boolean pwcheck(@RequestParam(value="password")String password,
			@RequestParam(value="password2")String password2) {
		String id = (String) session.getAttribute("id");
		boolean check = false;
		try {
			Member mem = subPageService.queryId(id);
			if(password.equals(mem.getPassword())) {
				subPageService.changePw(id, password2);
				
				check=true;
			}else {
				check=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
}
