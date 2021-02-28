package com.ja.springex.test.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	@RequestMapping("test2.do")
	public String test2() throws ParseException {
		
		//(개념적)데이터 (값) 타입 : 숫자, 문자 , 날짜
		
		int	intValue = 10;
		System.out.println(intValue);
		
		String strValue = "안녕";
		System.out.println(strValue);
		
		Date dateValue = new Date(); 	//현재 시간
		System.out.println(dateValue); 	//test코드임..
		
		long currentTime = System.currentTimeMillis();
		System.out.println(currentTime/(1000*60*60*24));
		
		//값 변환 ...
		//숫지(정수) -> 문자
		{
			int v1 = 10;
			String v2 = v1 + "" ; 	//자바 문법을 이용한 변환
			String v3 = Integer.toString(v1) ;	//api를 이용한 변환
			System.out.println("[숫자 -> 문자] : " + v3);
		}
		
		//문자 -> 숫자(정수)
		{
			String v1 = "10";
			int v2 = Integer.parseInt(v1);
			System.out.println("[문자 -> 숫자] : " + v2);
		}
		
		//숫자 -> 날짜
		{
			long v1 = 1000*60*60*24*1000;
			Date v2 = new Date(v1);
			System.out.println("[숫자 -> 날짜] : " + v2);
		}
		//날짜 -> 숫자
		{
			Date v1 = new Date();
			long v2 = v1.getTime();
			System.out.println("[날짜 -> 숫자 ] : " + v2);
		}
		
		//날짜 -> 문자(추가적으로..)
		{
			Date v1 = new Date();
			String v2 = v1.toString();	//test...
			//원하는 모양으로.. 2020년12월22일 이런식..
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String v3 = sdf.format(v1);
			System.out.println("[날짜 -> 문자 ] : " + v3);
			
		}
		//문자 -> 날짜 (용도: 연산,문법적 Date..)
		{
			String v1 = "2020-12-22";
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date v2 = sdf.parse(v1);
			System.out.println("[문자 -> 날짜 ] : " + v2);
		}
		
		
		return "xxx";
		
		
	
	
		
	}
	
	
	@RequestMapping("test1.do")
	public String test1() {
		
		System.out.println("[test1] 실행됨");
		
		return "test/test1";
	}
	
	
}
