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
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.dto.WorkApply;
import com.mulcam.artista.dto.WorkReport;
import com.mulcam.artista.service.ArtistApplyService;
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
	ArtistApplyService artistapplyService;
	
	@Autowired
	ExhibitService exhibitService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;
	
	@Value("${upload.filepath.ncloud}")
	private boolean bcloud;
	
	@Value("${upload.filepath}")
	private String filepath;
	
	@Value("${funupload.filepath}")
	private String funpath;


	@GetMapping("artistModify")
	public String artistModify(Model model) {
		String id=(String) session.getAttribute("id");	
		try {
			Artist artist = artistService.artistInfo(id);
			ArtistWorld artistworld = artistService.selectArtistWorldById(artist.getId());
			model.addAttribute("id", artist.getId());
			model.addAttribute("artist", artist);
			model.addAttribute("artistworld", artistworld.getImgName());
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse( artist.getArtistRecord() );
			model.addAttribute("record", obj);
			model.addAttribute("res", artist.getArtistRecord());
			
			JSONArray jsonObj = new JSONArray(artist.getArtistRecord());
			model.addAttribute("size", jsonObj.length());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/modify";
	}
	
	
	@PostMapping("artistmodifyComplete")
	public String artistmodifyComplete(@ModelAttribute ArtistApply artistapply, 
			@RequestParam(value="artistImgFile") MultipartFile artistImgFile, 
			@RequestParam(value="artistWorld1") MultipartFile artistWorldFile, 
			@RequestParam(value="fileChange") String file,
			@RequestParam(value="fileChange2") String file2) 
	{
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		String workImg = null;
		int exhibitapplyNo;
		
		try {
			artistNo = artistService.getArtistNo(id);
			artistapply.setArtistNo(artistNo);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		//아티스트 이미지 수정
		if(file.equals("0")) {
			String path = "";
			if(bcloud) {
				path = filepath+"artistProfile/";
			} else {
				path = servletContext.getRealPath(filepath+"artistProfile/");
			}
			String[] mtypes = artistImgFile.getContentType().split("/");
			String imgName = UUID.randomUUID().toString();
			File destFile = new File(path + imgName +"."+ mtypes[1]);
			try {
				artistImgFile.transferTo(destFile);
				String artistImg = imgName +"."+ mtypes[1];
				artistapply.setArtistImg(artistImg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 기존 아티스트 이미지 사용
		else if(file.equals("1")) { 
			Artist artist = null;
			try {
				System.out.println();
				artist = artistService.Artistinfo(artistapply.getOriginArtistNo());
				artistapply.setArtistImg(artist.getArtistImg());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//아티스트 작업세계 수정
		if(file2.equals("0")) {
			String path = "";
			if(bcloud) {
				path = filepath+"artistWorlds/";
			} else {
				path = servletContext.getRealPath(filepath+"artistWorlds/");
			}
			String[] mtypes = artistWorldFile.getContentType().split("/");
			String imgName = UUID.randomUUID().toString();
			File destFile = new File(path + imgName +"."+ mtypes[1]);
			try {
				artistWorldFile.transferTo(destFile);
				String artistImg = imgName +"."+ mtypes[1];
				artistapply.setArtistWorld(artistImg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//아티스트 작업세계 기존거 사용 : 변화 없음
		
		try {
			artistapply.setArtistNo(artistapplyService.getApplyArtistNo());
			artistapplyService.insertArtistModify(artistapply);
		} catch (Exception e1) {
			e1.printStackTrace();
		}	
		
		return "artistpage/succesapply";
	}
	
	/* 아티스트 첫페이지 및 일반작품 전체 보기*/
	@GetMapping({"","/","/mywork"})
	public String artistpageMain(Model model) {
		String id=(String) session.getAttribute("id");
		System.out.println(id);
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			model.addAttribute("artistName", artistName);
			model.addAttribute("artistNo", artistNo);
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
		
		BufferedImage inputImage;
		try {
			inputImage = ImageIO.read(artistImgFile.getInputStream());
	        int originHeight = inputImage.getHeight();	// 이미지 세로 가로 측정
	        work.setWorkHeight(originHeight);
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		
		// 작품 대표이미지 저장
		
		String path = "";
		if(bcloud) {
			path = filepath+"artistWorks/";
		} else {
			path = servletContext.getRealPath(filepath+"artistWorks/");
		}
		String[] mtypes = artistImgFile.getContentType().split("/");
		
		String imgName = UUID.randomUUID().toString();								//랜덤으로 이름 정하기
		File destFile = new File(path + artistNo +"-"+ imgName +"."+ mtypes[1]);	//이미지 타입
		try {			
			artistImgFile.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String workImg = artistNo + "-" + imgName +"."+ mtypes[1];
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

//		BufferedImage inputImage;
//		try {
//			inputImage = ImageIO.read(workImgFile.getInputStream());
//	        int originHeight = inputImage.getHeight();	// 이미지 세로 가로 측정
//	        workapply.setWorkHeight(originHeight);
//		} catch (IOException e2) {
//			e2.printStackTrace();
//		}
	
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
		String path = "";
		if(bcloud) {
			path = filepath+"artistWorks/";
		} else {
			path = servletContext.getRealPath(filepath+"artistWorks/");
		}
		String[] mtypes = workImgFile.getContentType().split("/");
		
		String imgName = UUID.randomUUID().toString();								//랜덤으로 이름 정하기
		File destFile = new File(path + artistNo +"-"+ imgName +"."+ mtypes[1]);
		try {			
			workImgFile.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String workImg = artistNo + "-" + imgName +"."+ mtypes[1];
		
		//작품 신청 insert
		try {
			workapply.setWorkapplyNo(workapplyService.getWorkApplyMaxId());
			workapply.setArtistNo(artistNo);
			workapply.setArtistName(artistName);
			workapply.setWorkImg(workImg);
			workapply.setApplyState(0); //작품 등록 요청
			workapplyService.insertWorkApply(workapply);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	/* 아티스트 판매작품 수정 페이지 */
	@PostMapping("workModify")
	public String workModify(@RequestParam(value="workNo") int workNo, Model model) {
		try {
			Work work = workService.workinfo(workNo);
			model.addAttribute("work", work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/modifyproduct";
	}
	/* 아티스트 판매작품 수정완료 */
	@PostMapping("workModifyComplete")
	public String workModifyComplete( @RequestParam(value="workNo") int workNo, 
			@ModelAttribute WorkApply workapply, @RequestParam(value="workImgFile") MultipartFile workImgFile,
			@RequestParam(value="fileChange") String file) {

		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		String artistName = null;
		String workImg = null;
		
		try {
			artistNo = artistService.getArtistNo(id);
			artistName = artistService.getArtistName(id);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		//이미지 변경
		if(file.equals("0")) {
			BufferedImage inputImage;
			try {
				inputImage = ImageIO.read(workImgFile.getInputStream());
				// 이미지 세로 가로 측정
		        int originHeight = inputImage.getHeight();
		        workapply.setWorkHeight(originHeight);
			} catch (IOException e2) {
				e2.printStackTrace();
			}
			
			// 작품 대표이미지 저장
			String path = "";
			if(bcloud) {
				path = filepath+"artistWorks/";
			} else {
				path = servletContext.getRealPath(filepath+"artistWorks/");
			}
			String[] mtypes = workImgFile.getContentType().split("/");
			
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");
			Date time = new Date();
			String workEnrollTime = simpleDate.format(time);
			File destFile = new File(path + artistNo +"-"+ workEnrollTime +"."+ mtypes[1]);
			try {			
				workImgFile.transferTo(destFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			workImg = artistNo + "-" + workEnrollTime +"."+ mtypes[1];
			workapply.setWorkImg(workImg);
		} else {
			Work work;
			try {
				work = workService.workinfo(workNo);
				workapply.setWorkHeight(work.getWorkHeight());
				workapply.setWorkImg(work.getWorkImg());
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		
		//작품 신청 insert
		try {
			workapply.setWorkapplyNo(workapplyService.getWorkApplyMaxId());
			workapply.setArtistNo(artistNo);
			workapply.setArtistName(artistName);
			workapply.setApplyState(2); //수정요청
			workapply.setWorkNo(workNo);
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
	public ResponseEntity<Work> productDetail(@RequestParam(value="workNo",required = false) int workNo) {
		ResponseEntity<Work> result = null;
		try {
			Work work = workService.workinfo(workNo);
			result = new ResponseEntity<Work>(work, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Work>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 아티스트 판매작품 신청내역보기 */
	@GetMapping("myproductapply")
	public String artistproductApply(Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			List<WorkApply> workapplylist = workapplyService.getWorkApplyListbyArtist(artistNo);
			model.addAttribute("artistName", artistName);
			model.addAttribute("worklist", workapplylist);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		return "artistpage/myproductapply";
	}
	@ResponseBody
	@PostMapping("productapplydetail")
	public ResponseEntity<WorkApply> productapplyDetail(@RequestParam(value="workNo",required = false) int workNo) {
		ResponseEntity<WorkApply> result = null;
		try {
			WorkApply workapply = workapplyService.selectWorktApplyByNo(workNo);
			result = new ResponseEntity<WorkApply>(workapply, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<WorkApply>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 아티스트 판매작품 신청 거절 사유 보기 */
	@ResponseBody
	@PostMapping("refuseReason")
	public ResponseEntity<String> refuseReason(@RequestParam(value="workNo",required = false) int workapplyNo) {
		ResponseEntity<String> result = null;
		try {
			String refusedContents = workapplyService.selectWorktApplyByNo(workapplyNo).getRefusedContents();
			result = new ResponseEntity<String>(refusedContents, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 작품 가져오기 경로 */
	@GetMapping(value="/workImg/{filename}")
	public void workImgView(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		if(bcloud) {
			path = filepath+"artistWorks/";
		} else {
			path = servletContext.getRealPath(filepath+"artistWorks/");
		}
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
	
	// 아티스트의 펀딩 리스트
	@GetMapping("myfunding")
	public String myfunding(@ModelAttribute Funding funding, Model model) throws Exception {
		String id=(String) session.getAttribute("id");
		List<Funding> list = fundingService.queryMyFunding(id);
		Member mem = subPageService.queryId(id);
		model.addAttribute("mem", mem);
		model.addAttribute("list", list);
		return "artistpage/myfunding";
	}
	/* 펀딩 신청 상세보기 */
	@ResponseBody
	@PostMapping(value="fundingApplydetail")
	public Map<String, Object> fundingApplydetail(@RequestParam(value="fundingNo", required = false) int fundingNo, Model model) {
		Map<String, Object> json = new HashMap<>();
		try {
			Funding funding = fundingService.querytfundingApp(fundingNo);
			Artist artist = artistService.Artistinfo(funding.getArtistNo());
			String email = subPageService.queryId(artist.getId()).getEmail();
			json.put("funding", funding);
			json.put("id", artist.getId());
			json.put("artistName", artist.getArtistName());
			json.put("email", email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	/* 펀딩 상세보기 */
	@ResponseBody
	@PostMapping(value="fundingdetail")
	public Map<String, Object> fundingDetail(@RequestParam(value="fundingNo", required = false) int fundingNo, Model model) {
		Map<String, Object> json = new HashMap<>();
		try {
			Funding funding = fundingService.queryFundingBybNo(fundingNo);
			Artist artist = artistService.Artistinfo(funding.getArtistNo());
			String email = subPageService.queryId(artist.getId()).getEmail();
			json.put("funding", funding);
			json.put("id", artist.getId());
			json.put("artistName", artist.getArtistName());
			json.put("email", email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	// 아티스트의 펀딩 신청 내역
	@GetMapping("appmyfunding")
	public String appmyfunding(@ModelAttribute Funding funding, Model model) throws Exception {
		String id=(String) session.getAttribute("id");
		List<Funding> list = fundingService.queryappfunding(id);
		Member mem = subPageService.queryId(id);
		model.addAttribute("mem", mem);
		model.addAttribute("list", list);
		return "artistpage/appmyfunding";
	}

	
	//펀딩 신청
	@GetMapping("applyfunding")
	public String applyfunding(Model model) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			Artist artist = artistService.artistInfo(id);
			model.addAttribute("email", mem.getEmail());
			model.addAttribute("id", mem.getId());
			model.addAttribute("artistName", artist.getArtistName());
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "artistpage/applyfunding";
	}
	
	

	@PostMapping("applyfunding")
	public String applyfunding1(@ModelAttribute Funding funding, Model model) {
		String id=(String) session.getAttribute("id");
		// 펀딩 기간
		String[] fundingDate = funding.getFundingDate().split(" ~ ");
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[0]));
		funding.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[1]));
		funding.setEndDate(Timestamp.valueOf(localDateTime).toString());
		
		try {
			// 펀딩 대표 이미지 설졍
			MultipartFile file = funding.getThumbFile();
			//File destFile = new File(path+file.getOriginalFilename());
			if(file!=null && !file.isEmpty()) {
				String path = "";
				if(bcloud) {
					path = funpath;
				} else {
					path = servletContext.getRealPath(funpath);
				}
				String filename = file.getOriginalFilename();
				File destFile = new File(path+filename);
				file.transferTo(destFile);
				funding.setThumbImg(filename);
			}
			//fundingAppNo 구하기 
			int fundingAppNo = fundingService.getfundingAppNo();
			artistPageService.insertApply(funding);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
	//end - start 
	
	@ResponseBody
	@PostMapping("fundingApp")
	public Map<String, Object> fileupload(@RequestParam(value="fundingApp") MultipartFile file) {
		System.out.println(file.getOriginalFilename()+"---------------------");
		String path = "";
		if(bcloud) {
			path = funpath;
		} else {
			path = servletContext.getRealPath(funpath);
		}
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
	public String modifyfunding(@RequestParam(value="fundingNo") int fundingNo, Model model) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("mem", mem);
			Funding funding = fundingService.queryFundingNo(fundingNo);
			model.addAttribute("funding", funding);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "artistpage/modifyfunding";
	}
	
	@RequestMapping(value="modifyfunding", method= {RequestMethod.POST})
	public String modifyfunding2(@ModelAttribute Funding funding,
			@RequestParam(value="thumbFile") MultipartFile thumbFile,
			@RequestParam(value="fileChange") String fileChange) {
		
		String id=(String) session.getAttribute("id");
		funding.setId(id);
		funding.setApplyStatus(2);
		
		Funding originFunding = fundingService.queryFundingNo(funding.getFundingNo());
		
		String[] fundingDate = funding.getFundingDate().split(" ~ ");
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[0]));
		funding.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(fundingDate[1]));
		funding.setEndDate(Timestamp.valueOf(localDateTime).toString());
		
		if(fileChange.equals("0")) {
			try {
				MultipartFile file = funding.getThumbFile();
				if(file!=null && !file.isEmpty()) {
					String path = "";
					if(bcloud) {
						path = funpath;
					} else {
						path = servletContext.getRealPath(funpath);
					}
					String filename = file.getOriginalFilename();
					File destFile = new File(path+filename);
					file.transferTo(destFile);
					funding.setThumbImg(filename);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			funding.setThumbImg(originFunding.getThumbImg());
		}
		
		try {
			funding.setFundingNo(fundingService.getfundingAppNo());
			funding.setFundingOriginNo(originFunding.getFundingNo());
			artistPageService.modifyApply(funding);				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
	/* 펀딩 신청 거절 이유보기 */
	@ResponseBody
	@PostMapping(value="fundingApplyrefuseReason")
	public String fundingApplyrefuseReason(@RequestParam(value="fundingNo", required = false) int fundingNo) {
		Funding funding = null;
		try {
			funding = fundingService.querytfundingApp(fundingNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return funding.getRefusedContents();
	}
	
	@Autowired
	ExhibitService exhibiService;
	
	
	// 아티스트의 전시
	@GetMapping("myexhibition")
	public String artistpageExhibition(Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			model.addAttribute("artistName", artistName);
			List<Exhibition> exhibitlist = exhibiService.ExhibitListByArtist(artistNo);
			model.addAttribute("exhibitlist", exhibitlist);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		return "artistpage/myexhibition";
	}
	@ResponseBody
	@PostMapping("exhibitdetail")
	public ResponseEntity<Exhibition> exhibitDetail(@RequestParam(value="exhibitNo",required = false) int exhibitNo) {
		ResponseEntity<Exhibition> result = null;
		try {
			Exhibition exhibit = exhibiService.selectExhibit(exhibitNo);
			result = new ResponseEntity<Exhibition>(exhibit, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Exhibition>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	@GetMapping("applyexhibition")
	public String artistpageEnrollExhibition() {
		return "artistpage/applyexhibition";
	}
	
	@PostMapping("exhibitionApplyComplete")
	public String exhibitionApplyComplete(@ModelAttribute ExhibitionApply exhibitapply, @RequestParam(value="posterImgFile") MultipartFile posterImgFile, Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			exhibitapply.setArtistNo(artistNo);
			model.addAttribute("artistName", artistName);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		//포스터 이미지 등록
		String path = "";
		if(bcloud) {
			path = filepath+"exhibition/";
		} else {
			path = servletContext.getRealPath(filepath+"exhibition/");
		}
		String[] mtypes = posterImgFile.getContentType().split("/");
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");		//등록 시간으로 이름 정하기
		Date time = new Date();
		String exhibitEnrollTime = simpleDate.format(time);
		System.out.println("try 이전");
		int exhibitapplyNo;
		try {
			exhibitapplyNo = exhibitService.maxExhibitApplyNo();
			File destFile = new File(path + exhibitEnrollTime +"."+ mtypes[1]);	//이미지 타입
			posterImgFile.transferTo(destFile);
			
			String exhibitposterImg = exhibitEnrollTime +"."+ mtypes[1];
			exhibitapply.setExhibitapplyNo(exhibitapplyNo);
			exhibitapply.setExhibitPoster(exhibitposterImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String[] exhibitDate = exhibitapply.getExhibitDate().split(" ~ ");
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(exhibitDate[0]));
		exhibitapply.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(exhibitDate[1]));
		exhibitapply.setEndDate(Timestamp.valueOf(localDateTime).toString());
		exhibitapply.setApplyStatus(0);
		
		try {
			exhibitService.insertExhibitApply(exhibitapply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
	/* 아티스트 전시 수정 페이지 */
	@PostMapping("exhibitModify")
	public String exhibitModify(@RequestParam(value="exhibitNo") int exhibitNo, Model model) {
		try {
			Exhibition exhibit = exhibitService.selectExhibit(exhibitNo);
			model.addAttribute("exhibit", exhibit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/modifyexhibit";
	}
	
	@PostMapping("exhibitModifyComplete")
	public String exhibitModifyComplete(@RequestParam(value="exhibitNo") int exhibitNo,
			@ModelAttribute ExhibitionApply exhibitapply, @RequestParam(value="posterImgFile") MultipartFile posterImgFile, 
			@RequestParam(value="fileChange") String file) 
	{
		System.out.println(exhibitapply.getExhibitNo());
		System.out.println(exhibitapply.getExhibitNo());
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		String workImg = null;
		int exhibitapplyNo;
		
		try {
			artistNo = artistService.getArtistNo(id);
			exhibitapply.setArtistNo(artistNo);
			exhibitapplyNo = exhibitService.maxExhibitApplyNo();
			exhibitapply.setExhibitapplyNo(exhibitapplyNo);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		//포스터 이미지 등록
		if(file.equals("0")) {
			String path = "";
			if(bcloud) {
				path = filepath+"exhibition/";
			} else {
				path = servletContext.getRealPath(filepath+"exhibition/");
			}
			String[] mtypes = posterImgFile.getContentType().split("/");
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");		//등록 시간으로 이름 정하기
			Date time = new Date();
			String exhibitEnrollTime = simpleDate.format(time);
			
			try {
				File destFile = new File(path + exhibitEnrollTime +"."+ mtypes[1]);	//이미지 타입
				posterImgFile.transferTo(destFile);
				
				String exhibitposterImg = exhibitEnrollTime +"."+ mtypes[1];
				exhibitapply.setExhibitPoster(exhibitposterImg);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			Exhibition exhibit;
			try {
				exhibit = exhibitService.selectExhibit(exhibitNo);
				exhibitapply.setExhibitPoster(exhibit.getExhibitPoster());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String[] exhibitDate = exhibitapply.getExhibitDate().split(" ~ ");
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(exhibitDate[0]));
		exhibitapply.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(exhibitDate[1]));
		exhibitapply.setEndDate(Timestamp.valueOf(localDateTime).toString());
		exhibitapply.setApplyStatus(2); //수정요청
		
		try {
			exhibitService.insertExhibitApply(exhibitapply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "artistpage/succesapply";
	}
	
	// 아티스트의 전시
	@GetMapping("myexhibitionapply")
	public String artistpageExhibitionApply(Model model) {
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		try {
			String artistName = artistService.getArtistName(id);
			artistNo = artistService.getArtistNo(id);
			model.addAttribute("artistName", artistName);
			List<ExhibitionApply> exhibitlist = exhibiService.ExhibitApplyListByArtist(artistNo);
			model.addAttribute("exhibitlist", exhibitlist);
		} catch (Exception e1) {
		e1.printStackTrace();
		};
		return "artistpage/myexhibitionapply";
	}
	
	/* 전시 신청 거절 사유 보기 */
	@ResponseBody
	@PostMapping("exhibitrefuseReason")
	public ResponseEntity<String> exhibitRefuseReason(@RequestParam(value="exhibitapplyNo",required = false) int exhibitapplyNo) {
		ResponseEntity<String> result = null;
		try {
			String refusedContents = exhibitService.selectExhibitApply(exhibitapplyNo).getRefusedContents();
			result = new ResponseEntity<String>(refusedContents, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 포스터 가져오기 경로 */
	@GetMapping(value="/posterImg/{filename}")
	public void posterImgView(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		if(bcloud) {
			path = filepath+"exhibition/";
		} else {
			path = servletContext.getRealPath(filepath+"exhibition/");
		}
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
	
//	@GetMapping("mypagemodify")
//	public String mypagemodify() {
//		return "artistpage/mypagemodify";
//	}
//	@GetMapping("paymentinfo")
//	public String paymentinfo() {
//		return "artistpage/paymentinfo";
//	}
	
	
}
