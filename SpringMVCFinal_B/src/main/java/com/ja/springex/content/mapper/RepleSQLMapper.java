package com.ja.springex.content.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ja.springex.vo.RepleVo;

public interface RepleSQLMapper {

	public void insert(RepleVo vo);
	
	public ArrayList<RepleVo> selectByContentNo(int content_no);
	
	public ArrayList<HashMap<String, Object>> selectRatioCount(int content_no);
	//남녀 성비 율.. Vo가 아니라 해쉬맵으로 받을수있다 키는 sex가 되고 값이 ratio_count가 된다.남녀 두줄이므로 arrayList로 받는다..
}
