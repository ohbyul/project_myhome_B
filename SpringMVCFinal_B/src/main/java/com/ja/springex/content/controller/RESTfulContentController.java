package com.ja.springex.content.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.springex.content.service.ContentServiceImpl;
import com.ja.springex.vo.MemberVo;
import com.ja.springex.vo.RepleVo;

@Controller
@RequestMapping("/content/*")
@ResponseBody	//이쪽에서 리턴하는건 포워딩하지않고 데이터로 만들어서 넘긴다.AJAX으로 만든느건..
public class RESTfulContentController {
	
	@Autowired
	private ContentServiceImpl contentService;
	
	@RequestMapping("get_ratio_count.do")
	public ArrayList<HashMap<String, Object>> getRatioCount(int content_no) {
		
		return contentService.getRatioCount(content_no);
	}
	
	@RequestMapping("get_reple_list.do")
	public ArrayList<HashMap<String, Object>> getRepleList(int content_no) {
		System.out.println("[getRepleList] 실행됨");
		//...
		ArrayList<HashMap<String, Object>> result = contentService.getRepleList(content_no);
		
		return result;
	}
	
	
	@RequestMapping("write_reple_process.do")
	public void writeRepleprocess(RepleVo param , HttpSession sessoin) {
		System.out.println("[writeRepleprocess] 실행됨");
		//...
		
		int member_no = ((MemberVo)sessoin.getAttribute("sessionUser")).getMember_no();
		
		param.setMember_no(member_no);
		
		contentService.writeReple(param);
		
	}
	
	
	//test
	@RequestMapping("test_json.do")
	public HashMap<String, Object> testJSON() {
		System.out.println("[testJSON] 실행됨");

		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		list.add(new MemberVo());
		list.add(new MemberVo());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("AAA", 1);
		map.put("BBB", 1.13);
		map.put("CCC", "안녕하세요");
		map.put("DDD", true);
		map.put("EEE", "true");
		map.put("XXX", list);
		map.put("TTT", new RepleVo());
		
		
		return map;
		
	}
	
	
	
	
	
}
