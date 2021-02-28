package com.ja.springex.member.mapper;

import java.util.ArrayList;

import com.ja.springex.vo.HobbyVo;
import com.ja.springex.vo.MemberVo;

public interface MemberSQLMapper {

	public int createKey() ; //seq.naxtval 호출할때..(어렵다..이해필요)
	
	public void insert(MemberVo vo);

	public MemberVo seleteByIdAndPw(MemberVo vo);
	//select를 할때는 리턴 타입이 이런식..맵퍼.xml에 리턴타입 정해줘야함.
	//매개변수가 객체.. : 객체일때는 #{그 안쪽에 있는 필드명..}
	 
	public MemberVo selectByNo(int no);
	//SELECT * FROM FB_member WHERE member_no = 1
	//한줄이므로. 어레이 리스트로 안받아도됨
	//매개변수가 int 값... #{}햇을때 규칙이 달라짐..
	//매개 변수가 순수 벨류 : 변수명이 #{no 그대로의 변수명} 가 된다
	
	public MemberVo selectById(String id);
	//중복처리
	
	
	//hobby
	public void insertHobby(HobbyVo vo);
	
	
	
}
