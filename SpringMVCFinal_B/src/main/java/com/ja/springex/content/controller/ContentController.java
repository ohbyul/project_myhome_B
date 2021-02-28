package com.ja.springex.content.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.springex.content.service.ContentServiceImpl;
import com.ja.springex.vo.ContentImageVo;
import com.ja.springex.vo.ContentVo;
import com.ja.springex.vo.MemberVo;

@Controller
@RequestMapping("/content/*")
public class ContentController {
	
	@Autowired
	private ContentServiceImpl contentService;
		
	
	@RequestMapping("main_page.do")
	public String mainPage(Model model,String search_word,String search_type,@RequestParam(value="page_num",defaultValue = "1") int page_num) {
		System.out.println("[mainPage] 실행됨");
		
		//메인페이지에 보드리스트 뽑아야하니께
	 	ArrayList<HashMap<String, Object>> resultList = contentService.getContentList(search_word,search_type,page_num);
	 	
	 	int pageCount = contentService.getPageCount();
	 	//페이지 갯수 받자
	 	int currentPage = page_num ;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
	 	//페이지 계산하기 정수나누기임 1/5 = 0 이됨.. 나머지값 버림 인트니까
	 	
	 	if(endPage > pageCount) {
	 		endPage = pageCount;
	 	}
	 	//몬소리야..
	 	
	 	
	 	model.addAttribute("resultList",resultList);
	 	//매개 변수 모델..Model리 리퀘스트 객체라고 생각하면된다.
	 	model.addAttribute("currentPage", currentPage);
	 	model.addAttribute("beginPage", beginPage);
	 	model.addAttribute("endPage", endPage);
	 	model.addAttribute("pageCount", pageCount);
	 	
	 	
		return "content/main_page";
	}
	
	@RequestMapping("write_content_page.do")
	public String writeContentPage() {
		System.out.println("[writeContentPage] 실행됨");
		return "content/write_content_page";
	}
	
	@RequestMapping("write_content_process.do")
	public String writeContentProcess(ContentVo param,HttpSession session ,MultipartFile [] files) {
		System.out.println("[writeContentProcess] 실행됨");
	
		//변수 생성 해야함.. 이미지때문에
		ArrayList<ContentImageVo> imageVoList = new ArrayList<ContentImageVo>();
		
		//업로드..
		for(MultipartFile file : files) {
			
			if(file.getSize() <=0) {
				continue;
				//예외처리.. 파일이 0보다 작다 = 파일업로드를 안했다. 그럼 밑에꺼를 수행하지않겠다.
			}
			
			//날짜 별 폴더 만들기 (자동으로)
			//.../년도/월/일/랜덤네임_시간.확장자명..
			String uploadRootFolderName = "c:/upload_files/";
			//역슬래시 두개도 가능 ..우리는 슬레시 하나로
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			//최종 폴더의 문자열 ...여기에 파일 이름은 더한다.
			
			System.out.println("[test uploadFolderName : ]" +uploadFolderName);
			
			File uploadFolder = new File(uploadFolderName);
			//파일이라는 이름의 클래스
			//역할 : 파일 혹은 폴더 에 속성을 컨트롤.. 
			
			//이러한 폴더가 존재하지 않으면.. 
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
				//dir...dirs는 복수 폴더를 싹다 만든다.
			}
			
			
			String originalFileName = file.getOriginalFilename();
			//저장시.. 파일명 변경 
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤 (문제.. 아주 극소수 충돌 문제) +시간 (충돌문제 없애기위해)
			
			String randomName = UUID.randomUUID().toString();

			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			//확장자 추가 ..(오리지널 파일 네임에서 뽑아옴)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
				//내서버에 저장 하겠다. //c:upload_files/2020/12/23 "/" randomname.jpg
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//imageVo 객체 생성..
			ContentImageVo imageVo = new ContentImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName; 
			
			imageVo.setImage_link(link);
			
			imageVoList.add(imageVo);
			//writeContent할때  imageVoList 넘겨줌
			
		}	//포문 닫기
				
		//데이터 처리
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
			//세션 받고 겟터로 외래키 빼오기..
		
		param.setMember_no(member_no);
			//param에 외래키 셋팅
		
		contentService.writeContent(param,imageVoList);
		
		return "redirect:./main_page.do";
	}
	
	@RequestMapping("read_content_page.do")
	public String readContentPage(int content_no,Model model) {
		System.out.println("[readContentPage] 실행됨");
		
		HashMap<String, Object> map = contentService.getContent(content_no);
		
		model.addAttribute("result",map);
		//jsp로 넘겨야되니까 리퀘스트 객체에.. 스프링에선 모델을 사용		
		
		return "content/read_content_page";
	}
	
	@RequestMapping("delete_content_process.do")
	public String deleteContentProcess(int content_no) {
		System.out.println("[deleteContentProcess] 실행됨");

		contentService.deleteContent(content_no);
		
		return "redirect:./main_page.do";
	}
	
	@RequestMapping("update_content_page.do")
	public String updateContentPage(int content_no,Model model) {
		System.out.println("[updateContentPage] 실행됨");

		HashMap<String, Object> map = contentService.getContent(content_no);
		model.addAttribute("result",map);
		//session.setAttribute("result",map);
		return "content/update_content_page";
	}
	
	@RequestMapping("update_content_process.do")
	public String updateContentProcess(ContentVo param) {
		System.out.println("[updateContentProcess] 실행됨");

		contentService.updateContent(param);
		
		return "redirect:./main_page.do";
	}
	
	@RequestMapping("practice.do")
	public String practice() {
		System.out.println("[practice] 실행됨");

		return "content/practice";
	}
	
}
