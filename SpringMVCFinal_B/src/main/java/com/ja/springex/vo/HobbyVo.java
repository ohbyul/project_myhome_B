package com.ja.springex.vo;

public class HobbyVo {

	private int hobby_no;
	private int member_no;
	private String hobby_content;
	public HobbyVo() {
		super();
	}
	public HobbyVo(int hobby_no, int member_no, String hobby_content) {
		super();
		this.hobby_no = hobby_no;
		this.member_no = member_no;
		this.hobby_content = hobby_content;
	}
	public int getHobby_no() {
		return hobby_no;
	}
	public void setHobby_no(int hobby_no) {
		this.hobby_no = hobby_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getHobby_content() {
		return hobby_content;
	}
	public void setHobby_content(String hobby_content) {
		this.hobby_content = hobby_content;
	}
	
	
	
}
