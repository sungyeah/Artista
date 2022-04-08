package com.mulcam.artista.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mulcam.artista.dto.ExhibitionApply;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.dto.WorkApply;
import com.mulcam.artista.dto.WorkReport;
import com.mulcam.artista.service.ArtistPageService;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.ExhibitService;
import com.mulcam.artista.service.FundingService;
import com.mulcam.artista.service.SubPageService;
import com.mulcam.artista.service.WorkApplyService;
import com.mulcam.artista.service.WorkService;

@RequestMapping("artistpage")
@Controller
public class ArtistPageController {
	
	@Autowired
	FundingService fundingService;
	
	@Autowired
	SubPageService subPageService;
	
	@Autowired
	ArtistPageService artistPageService;
	
	@Autowired
	WorkService workService;
	
	@Autowired
	WorkApplyService workapplyService;
	
	@Autowired
	ArtistService artistService;
	
	@Autowired
	ExhibitService exhibitService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;

	/* 아티스트 첫페이지 및 일반작품 전체 보기*/
	@GetMapping("mywork")
	public String artistpageMain(Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			model.addAttribute("artistName", artistName);
			List<Work> worklist = workService.getWorkByNoList(artistNo);
			model.addAttribute("worklist", worklist);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		return "artistpage/mywork";
	}
	
	/* 아티스트 일반작품 등록 페이지 */
	@GetMapping("enrollwork")
	public String artistpageEnrollWork() {
		return "artistpage/enrollwork";
	}
	/* 아티스트 일반작품 등록완료 */
	@PostMapping("enrollworkComplete")
	public String enrollworkComplete(@ModelAttribute Work work, @RequestParam(value="workImgFile") MultipartFile artistImgFile) {
		// 회원 id로 아티스트 번호 조회 후, 작품번호 가져오기
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		String artistName = null;
		try {
			work.setWorkNo(workService.getWorkMaxNo());
			artistNo = artistService.getArtistNo(id);
			artistName = artistService.getArtistName(id);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		// 작품 대표이미지 저장
		String path = servletContext.getRealPath("/imgupload/artistWorks/");	//실제 저장 위치
		String[] mtypes = artistImgFile.getContentType().split("/");
		
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");		//등록 시간으로 이름 정하기
		Date time = new Date();
		String workEnrollTime = simpleDate.format(time);
		File destFile = new File(path + artistNo +"-"+ workEnrollTime +"."+ mtypes[1]);	//이미지 타입
		try {			
			artistImgFile.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String workImg = artistNo + "-" + workEnrollTime +"."+ mtypes[1];
		work.setArtistNo(artistNo);
		work.setArtistName(artistName);
		work.setWorkImg(workImg);
		work.setWorkForSale(0); //판매용 아님
		// 일반 작품 insert
		try {
			workService.insertWork(work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "artistpage/succesapply";
	}
	/* 아티스트 일반작품 등록 페이지 */
	@GetMapping(value="workdetail/{workNo}")
	public String workdetail(@PathVariable int workNo, Model model) {
		Work work;
		try {
			work = workService.workinfo(workNo);
			model.addAttribute("work", work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/workdetail";
	}
	
	
	
	/* 아티스트 판매작품 전체보기 */
	@GetMapping("myproduct")
	public String artistpageProduct(Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			model.addAttribute("artistName", artistName);
			List<Work> worklist = workService.getProductByNoList(artistNo);
			model.addAttribute("worklist", worklist);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		return "artistpage/myproduct";
	}
	/* 아티스트 판매작품 등록 페이지 */
	@GetMapping("applyproduct")
	public String artistpageEnrollProduct() {
		return "artistpage/applyproduct";
	}
	/* 아티스트 판매작품 등록완료 */
	@PostMapping("workApplyComplete")
	public String workApplyComplete(@ModelAttribute WorkApply workapply, @RequestParam(value="workImgFile") MultipartFile workImgFile) {

		BufferedImage inputImage;
		try {
			inputImage = ImageIO.read(workImgFile.getInputStream());
			// 이미지 세로 가로 측정
	        int originHeight = inputImage.getHeight();
	        workapply.setWorkHeight(originHeight);
	        System.out.println(originHeight);
		} catch (IOException e2) {
			e2.printStackTrace();
		}
	
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		String artistName = null;
		try {
			artistNo = artistService.getArtistNo(id);
			artistName = artistService.getArtistName(id);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		// 작품 대표이미지 저장
		String path = servletContext.getRealPath("/imgupload/artistWorks/");
		String[] mtypes = workImgFile.getContentType().split("/");
		
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");
		Date time = new Date();
		String workEnrollTime = simpleDate.format(time);
		System.out.println(artistNo);
		File destFile = new File(path + artistNo +"-"+ workEnrollTime +"."+ mtypes[1]);
		try {			
			workImgFile.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String workImg = artistNo + "-" + workEnrollTime +"."+ mtypes[1];
		
		//작품 신청 insert
		try {
			workapply.setWorkapplyNo(workapplyService.getWorkApplyMaxId());
			workapply.setArtistNo(artistNo);
			workapply.setArtistName(artistName);
			workapply.setWorkImg(workImg);
			workapply.setApplyState(0);
			workapplyService.insertWorkApply(workapply);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	@GetMapping("myproductsold")
	public String artistpageProductSold(Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			model.addAttribute("artistName", artistName);
			List<Work> soldlist = workService.getSoldProductByNoList(artistNo);
			List<WorkReport> workReportList = new ArrayList<WorkReport>();
			for(int i=0; i<soldlist.size(); i++) {
				WorkReport workreport = new WorkReport();
				Work work = soldlist.get(i);
				Order order = subPageService.selectOrderByNo(work.getOrderNo());
				workreport.setWork(work);
				workreport.setOrder(order);
				workReportList.add(workreport);
			}
			
			model.addAttribute("soldlist", workReportList);
		} catch (Exception e1) {
			model.addAttribute("soldlist", null);
			e1.printStackTrace();
		};
		return "artistpage/myproductsold";
	}
	@ResponseBody
	@PostMapping("productdetail")
	public ResponseEntity<Work> productDetail(@RequestParam(value="workNo",required = false) int workNo, Model model) {
		ResponseEntity<Work> result = null;
		try {
			Work work = workService.workinfo(workNo);
			result = new ResponseEntity<Work>(work, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Work>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 작품 가져오기 경로 */
	@GetMapping(value="/workImg/{filename}")
	public void workImgView(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
		String path= servletContext.getRealPath("/imgupload/artistWorks/");
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
	
	// 아티스트의 펀딩
	@GetMapping("myfunding")
	public String artistpageFunding(@ModelAttribute Funding funding, Model model) throws Exception {
		String id=(String) session.getAttribute("id");
		List<Funding> list = fundingService.queryMyFunding(id);
		Member mem = subPageService.queryId(id);
		model.addAttribute("mem", mem);
		model.addAttribute("list", list);
		return "artistpage/myfunding";
	}
	
	//펀딩 신청
	@GetMapping("applyfunding")
	public String applyfunding(Model model) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("mem", mem);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "artistpage/applyfunding";
	}
	
	

	@PostMapping("applyfunding")
	public String applyfunding1(@ModelAttribute Funding funding, Model model) {
		
		String id=(String) session.getAttribute("id");
//			 File destFile = new File(path+file.getOriginalFilename());
		String[] fundingDate = funding.getFundingDate().split(" ~ ");
		System.out.println(fundingDate[0]);
		System.out.println(fundingDate[1]);
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[0]));
		System.out.println(Timestamp.valueOf(localDateTime));
		funding.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[1]));
		System.out.println(Timestamp.valueOf(localDateTime));
		funding.setEndDate(Timestamp.valueOf(localDateTime).toString());
		try {
			MultipartFile file = funding.getThumbFile();
			if(file!=null && !file.isEmpty()) {
				String path = servletContext.getRealPath("/fundingApp/");
				String filename = file.getOriginalFilename();
				File destFile = new File(path+filename);
				file.transferTo(destFile);
				funding.setThumbImg(filename);
			}
			artistPageService.insertApply(funding);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
	//end - start 
	
	@ResponseBody
	@PostMapping("fundingApp")
	public Map<String, Object> fileupload(@RequestParam(value="fundingApp") MultipartFile file) {
		System.out.println(file.getOriginalFilename()+"---------------------");
		String path = servletContext.getRealPath("/fundingApp/");
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
	
	
	@GetMapping("modifyfunding")
	public String modifyfunding(Model model) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("mem", mem);
			Funding funding = fundingService.queryFunding(id);
			model.addAttribute("funding", funding);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "artistpage/modifyfunding";
	}
	
	
	@RequestMapping(value="modifyfunding", method= {RequestMethod.POST})
	public String modifyfunding2(@ModelAttribute Funding funding) {
		String path = servletContext.getRealPath("/fundingApp/");
		String id=(String) session.getAttribute("id");
		funding.setId(id);
		String[] fundingDate = funding.getFundingDate().split(" ~ ");
		System.out.println(fundingDate[0]);
		System.out.println(fundingDate[1]);
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[0]));
		System.out.println(Timestamp.valueOf(localDateTime));
		funding.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[1]));
		System.out.println(Timestamp.valueOf(localDateTime));
		funding.setEndDate(Timestamp.valueOf(localDateTime).toString());
		System.out.println(id);
		try {			
			System.out.println(funding.getId());
			artistPageService.insertupdate(funding);				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
	

	
	// 아티스트의 전시
	@GetMapping("myexhibition")
	public String artistpageExhibition() {
		return "artistpage/myexhibition";
	}
	@GetMapping("applyexhibition")
	public String artistpageEnrollExhibition() {
		return "artistpage/applyexhibition";
	}
	
	@PostMapping("exhibitionApplyComplete")
	public String exhibitionApplyComplete(@ModelAttribute ExhibitionApply exhibitapply, @RequestParam(value="posterImgFile") MultipartFile posterImgFile) {
		
		//포스터 이미지 등록
		String path = servletContext.getRealPath("/imgupload/exhibition/");
		String[] mtypes = posterImgFile.getContentType().split("/");
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");		//등록 시간으로 이름 정하기
		Date time = new Date();
		String exhibitEnrollTime = simpleDate.format(time);
		System.out.println("try 이전");
		int exhibitapplyNo;
		try {
			exhibitapplyNo = exhibitService.maxExhibitApplyId();
			File destFile = new File(path + exhibitEnrollTime +"."+ mtypes[1]);	//이미지 타입
			posterImgFile.transferTo(destFile);
			
			String exhibitposterImg = exhibitEnrollTime +"."+ mtypes[1];
			exhibitapply.setExhibitapplyNo(exhibitapplyNo);
			exhibitapply.setExhibitPoster(exhibitposterImg);
			System.out.println("poseter : " + exhibitposterImg);
			System.out.println(exhibitapply.getExhibitPoster());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String[] exhibitDate = exhibitapply.getExhibitDate().split(" ~ ");
		System.out.println(exhibitDate[0]);
		System.out.println(exhibitDate[1]);
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(exhibitDate[0]));
		System.out.println(Timestamp.valueOf(localDateTime));
		exhibitapply.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(exhibitDate[1]));
		System.out.println(Timestamp.valueOf(localDateTime));
		exhibitapply.setEndDate(Timestamp.valueOf(localDateTime).toString());
		exhibitapply.setApplyStatus(0);
		
		try {
			exhibitService.insertExhibitApply(exhibitapply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
//	@GetMapping("mypagemodify")
//	public String mypagemodify() {
//		return "artistpage/mypagemodify";
//	}
//	@GetMapping("paymentinfo")
//	public String paymentinfo() {
//		return "artistpage/paymentinfo";
//	}
	
	
}
