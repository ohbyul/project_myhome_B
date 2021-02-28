package com.ja.springex.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.springex.member.mapper.MemberSQLMapper;
import com.ja.springex.util.FBMessageDigest;
import com.ja.springex.vo.HobbyVo;
import com.ja.springex.vo.MemberVo;


@Service
public class MemberServiceImpl {
	//impl : 임플레먼츠의 약자 
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	//오토 와이어드 root-context 안에있는걸..넣는다..
	
	public void joinMember(MemberVo vo,String [] hobby_content) {
		
		//비밀번호를 암호화 하자..! (복호화가 불가능 해야된다 = 해쉬 알고리즘)
		System.out.println("사용자가 입력한 비밀번호 : " + vo.getMember_pw());
		
		String hashCode = FBMessageDigest.messageDigest(vo.getMember_pw());
		
		System.out.println("해쉬 비번 : " + hashCode);
		
		vo.setMember_pw(hashCode);
		//비번 setting 을 해쉬 코드로..
		//..비밀번호 암호화 하기 끝
		
		int memberPK = memberSQLMapper.createKey();
		//nextval 호출을 위한 키..(어려워)
		
		vo.setMember_no(memberPK);
		//insert전 세팅..
		
		memberSQLMapper.insert(vo);
		//데이터 베이스 연동. member insert
		//맵퍼 인터페이스 만들고 -> 매쏘드 선언만!(앱스트랙스) -> 구현은 마이베티스..자동 구현 
		//폴더 구조에 맞는 xml만들기
		
		if(hobby_content == null) {
			return;
			//취미를 하나도 선택하지 않았을때 밑에 코드를 안쓴다.
		}
		
		//hobby 포문  hobby insert
		for(String hobby : hobby_content) {
		
			HobbyVo hobbyVo = new HobbyVo();
			hobbyVo.setHobby_content(hobby);
			hobbyVo.setMember_no(memberPK);
			
			memberSQLMapper.insertHobby(hobbyVo);
		
		}
	}
	
	public MemberVo login(MemberVo param) {
		
		//암호화 비번
		String hashCode = FBMessageDigest.messageDigest(param.getMember_pw());
		param.setMember_pw(hashCode);
		//..param 입력받은 비번을 셋 다시..
		
		MemberVo result = memberSQLMapper.seleteByIdAndPw(param);
		
		return result;
	}
	
	//중복 체크
	public boolean existId(String id) {
		
		MemberVo vo = memberSQLMapper.selectById(id);
		
		if(vo != null) {
			return true;
		}else {
			return false;
		}
	}
	
	
}
