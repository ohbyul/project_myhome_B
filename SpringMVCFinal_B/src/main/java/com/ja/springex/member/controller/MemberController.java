package com.ja.springex.member.controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.springex.member.mapper.MemberSQLMapper;
import com.ja.springex.member.service.MemberServiceImpl;
import com.ja.springex.vo.MemberVo;

@Controller		
@RequestMapping("/member/*")
public class MemberController {

	//주입.. 
	//주입 조건 : 컨테이너에 인스턴스가 생성 되야함
	@Autowired
	private MemberServiceImpl memberService;
		
	@RequestMapping("/login_page.do")
	public String loginPage( HttpServletRequest request , Model model) {
		//매개변수 HttpServletRequest request , Model model
		String referer = request.getHeader("Referer");
			//1230 오전 수업내용 자느라 ..
		System.out.println("[test]" + referer);
		
		model.addAttribute("referer", referer);
		
		System.out.println("[loginPage] 실행됨");
	
		return "member/login_page";
	}
	
	@RequestMapping("/join_member_page.do")
	//@GetMapping("/join_member_page.do")
	//@PostMapping("/join_member_page.do")
	public String joinMemberPage() {
		
		System.out.println("[joinMemberPage] 실행됨");
		
		return "member/join_member_page";
	}
	
	@RequestMapping("/join_member_process.do")
	public String joinMemberProcess(MemberVo param,String [] hobby_content) {
		System.out.println("[joinMemberProcess] 실행됨");
		
		memberService.joinMember(param,hobby_content);

		return "member/join_member_complete";
	}
	
	@RequestMapping("login_process.do")
	public String loginProcess(MemberVo param,HttpSession session , String redirect_url) {
		//매개변수 String redirect_url 추가  1230 오전에 잠듬..
		
		System.out.println("[loginProcess] 실행됨");
		//SELETE..
		//로그인 성공 - > session  -> redirect..
		//로그인 실패시 -> 이프문 들어가고 ->forwarding..
		//이런 비지니스 로직 적인 처리는 서비스 티어와 맵퍼 티어에서 한다.
		
		MemberVo sessionUser = memberService.login(param);
		
		if(sessionUser != null) {
			session.setAttribute("sessionUser", sessionUser);
			
//			if(redirect_url.contains("login_process.do") || redirect_url.contains("update_content_page.do")) {
//				redirect_url=null;
//			}	안됨 ㅡㅡ null 값을 줘버리니..이거 문의해애함..
			
			if(redirect_url != null && !redirect_url.equals("")) {
				return "redirect:" + redirect_url;
			}else {
				return "redirect:/";
			}
			//1230 이프문 추가.. 
			
			//return "redirect:../content/main_page.do";
			//원래있던 코드..
		}else{
			return "member/login_fail";
		}
	}
	
	@RequestMapping("logout_process.do")
	public String logoutProcess(HttpSession session , HttpServletRequest request) {
		//여기도 매개변수 서블릿 리퀘스트 추가.. , HttpServletRequest request
		System.out.println("[logoutProcess] 실행됨");
		session.invalidate();
		
		String referer = request.getHeader("Referer");
		
		if(referer != null && !referer.equals("")) {
			return "redirect:" + referer;
		}else {
			return "redirect:/";
		}
		//return "redirect:../content/main_page.do";
		//원래 코드.. 변햇음..
	}
	
	@ResponseBody	//AJAX로 호출 되는 애들.. 응답을 데이터만 보낼때..
	//RESTful API - 오픈 API (카카오, 네이버, 구글..)
	@RequestMapping("exist_id.do")
	public String existId(String id) {
		System.out.println("[existId] 실행됨 id : " + id);
		
		boolean existId = memberService.existId(id);
		
		if(existId == true) {
			return "true";
		}else {
			return "false";
		}
		
		//AJAX는 ...html 을 포워딩하고 리턴 하면안되고... 순수한 데이터 를 리턴한다 
	}
	
	
	
	
	
	
}
