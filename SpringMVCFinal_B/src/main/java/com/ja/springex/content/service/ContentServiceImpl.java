package com.ja.springex.content.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.springex.content.mapper.ContentImageSQLMapper;
import com.ja.springex.content.mapper.ContentSQLMapper;
import com.ja.springex.content.mapper.RepleSQLMapper;
import com.ja.springex.member.mapper.MemberSQLMapper;
import com.ja.springex.vo.ContentImageVo;
import com.ja.springex.vo.ContentVo;
import com.ja.springex.vo.MemberVo;
import com.ja.springex.vo.RepleVo;


@Service
public class ContentServiceImpl {
	
	@Autowired
	private ContentSQLMapper contentSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	//오토와이어드 : 주입!!
	//닉네임이 나와야 하므로 멤버도!
	
	@Autowired
	private ContentImageSQLMapper contentImageSQLMapper; 
	//첫번째로 해야할것 맵퍼 주입시키기!
	
	@Autowired
	private RepleSQLMapper repleSQLMapper;
	
	
	//글쓰기
	public void writeContent(ContentVo vo , ArrayList<ContentImageVo> imageVoList) {
		
		int contentPK = contentSQLMapper.creatKey();
		//프라이머리 키 생성하고
		vo.setContent_no(contentPK);
		//프라이머리키 세팅 해주고
			
		contentSQLMapper.insert(vo);
		//글 쓰기
		
		for(ContentImageVo imageVo : imageVoList) {
			imageVo.setContent_no(contentPK);
			//이미지마다 글번호 세팅..이미지VO에서는 PK 가 외래키
			contentImageSQLMapper.insert(imageVo);
			//for문 돌려서 인서트에 이미지 넣기..이미지가 몇개인지 모르니까
		}
		
	}
	
	//글 출력
	public ArrayList<HashMap<String, Object>> getContentList(String search_word ,String search_type,int page_num) {
		//get content List in main page
		//자료구조 **
		//리스트를 뽑을때 contentVo 만 사용 하는것이 아님 memberVo 도 같이 담아야하므로 리턴 타입 해쉬맵..
		//검색에 필요한 서치워드 받음
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		//해쉬맵을 담을 *어레이 리스트*를 생성하겠다.
		
		
		ArrayList<ContentVo> contentList = null;
		
		if(search_word == null || search_type == null) {
			contentList = contentSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("title")) {	
			contentList = contentSQLMapper.selectByTitle(search_word);
			}
			else if(search_type.equals("content")) {
				contentList = contentSQLMapper.selectByContent(search_word);
			}else if (search_type.equals("writer")) {
				contentList = contentSQLMapper.selectByWriter(search_word);
			}else {
				contentList = contentSQLMapper.selectAll(page_num);
			}
		}
		
				
		//닉네임 넣어주려면 해체! 반복문 돌리자
		for(ContentVo contentVo: contentList) {
			//contentList가 몇개인가 contentVo로 뽑아온다.
			
			int member_no = contentVo.getMember_no();
			//한바귀 돌때마다 이 글을쓴사람의 번호를 리턴해준다.  이번호로 셀렉트한다.
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			//글쓴 사람의 넘버로 ..리턴해주는건 Membervo를 리턴해준다.

			HashMap<String, Object> map = new HashMap<String, Object>();
			//키는 항상 스트링 값은 오브젝트.. 왜 오브젝트냐 ? 둘이 다른 리턴 타입임으로
			map.put("memberVo", memberVo);
			map.put("contentVo", contentVo);
			//키는 내가 짓고싶은 이름, 이름 중요, get할때 쓰임, 값은 넣어야하는 오브젝트들..
			
			resultList.add(map);
			//맵이 소멸 됨으로  어레이 리스트은 리절트리스트에 넣어준다.
		}
		return resultList;		
	}
	
	//글보기 게시글확인 + 조회수 증가 + 수정..
	public HashMap<String, Object> getContent(int contentNo) {
		//리턴 타입은 해쉬맵.. 하나만 나오면 되니까 멤버브이오 컨텐트 브이오 엮어야함
		
		contentSQLMapper.increaseReadcount(contentNo);
		//조회수증가..
		
		ContentVo contentVo = contentSQLMapper.selectByNo(contentNo);
		
		//read 할때 엔터가 안되는거 고치기.
		String str = contentVo.getContent_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		contentVo.setContent_content(str);
		
		
		
		int member_no = contentVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		//MemberVo memberVo = memberSQLMapper.selectByNo(contentVo.getMember_no()); 이렇게 한줄로 쓸수있음
		//contentVo memberVo 두개 나옴
				
		//이미지 출력
		ArrayList<ContentImageVo> imageVoList = contentImageSQLMapper.selectByContentNo(contentNo);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);		//단일객체
		map.put("contentVo", contentVo);	//단일객체
		map.put("imageVoList", imageVoList);	//배열객체
		
		
		return map;
	}
	
	//글삭제
	public void deleteContent(int contentNo) {
		contentSQLMapper.deleteByNo(contentNo);
	}
	
	//글수정
	public void updateContent(ContentVo vo) {
		contentSQLMapper.update(vo);
	}

	//페이지 갯수
	public int getPageCount() {	
		return contentSQLMapper.getPageCount();
	}
	
	//리플 쓰기
	public void writeReple(RepleVo vo) {
		
		repleSQLMapper.insert(vo);
	}
	
	//리플 출력
	public ArrayList<HashMap<String, Object>> getRepleList(int contentNo) {

		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RepleVo> repleVoList = repleSQLMapper.selectByContentNo(contentNo);
		
		for(RepleVo repleVo : repleVoList) {
		
			MemberVo memberVo = memberSQLMapper.selectByNo(repleVo.getMember_no());
	
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("repleVo", repleVo);
			
			result.add(map);
			
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> getRatioCount(int contentNo) {
		
		
		return repleSQLMapper.selectRatioCount(contentNo);
		
	}
	
	
	
}
