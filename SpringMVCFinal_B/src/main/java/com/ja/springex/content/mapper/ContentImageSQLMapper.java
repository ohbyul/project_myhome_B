package com.ja.springex.content.mapper;

import java.util.ArrayList;

import com.ja.springex.vo.ContentImageVo;

public interface ContentImageSQLMapper {

	public void insert(ContentImageVo vo);
	
	public ArrayList<ContentImageVo> selectByContentNo(int content_no);
	//외래키로 셀렉트 할꺼임.
	
	
	
}
