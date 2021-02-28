package com.ja.springex.content.mapper;

import java.util.ArrayList;

import com.ja.springex.vo.ContentVo;

public interface ContentSQLMapper {

	//프라이머리 키 생성
	public int creatKey();
	
	
	//글 쓰기
	public void insert(ContentVo vo);
	//인서트는 값을 받는다. 
	
	//전체 출력
	public ArrayList<ContentVo> selectAll(int page_num);
	//어레이리스트 로 받고 리턴 타입은 conntentVo..
	//셀렉트 * 프롬 해서  게시판을 셀렉트
	
	//제목 검색
	public ArrayList<ContentVo> selectByTitle(String search_word);
	
	//내용검색
	public ArrayList<ContentVo> selectByContent(String search_word);
	 
	//작성자 검색
	public ArrayList<ContentVo> selectByWriter(String search_word);
	
	//글 보기
	public ContentVo selectByNo(int no);
	//SELECT * FROM fb_content WHERE content_no = 2
	
	//글 삭제
	public void deleteByNo(int no);
	//DELETE FROM fb_content WHERE content_no = 3

	//글 수정
	public void update(ContentVo vo);
	//UPDATE fb_content SET content_title = '바끈 제목' ,	content_content = '바뀐 내용'	WHERE content_no = 1
	
	//글 조회수 증가
	public void increaseReadcount(int no);
	//UPDATE fb_content SET content_readcount = content_readcount + 1 WHERE content_no = 4
	
	//페이지  갯수
	public int getPageCount() ;
	
	
}
