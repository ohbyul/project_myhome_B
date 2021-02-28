package com.ja.springex.vo;

import java.util.Date;

public class RepleVo {

	private int reple_no;
	private int content_no;
	private int member_no;
	private String reple_content;
	private Date reple_writedate;
	public RepleVo() {
		super();
	}
	public RepleVo(int reple_no, int content_no, int member_no, String reple_content, Date reple_writedate) {
		super();
		this.reple_no = reple_no;
		this.content_no = content_no;
		this.member_no = member_no;
		this.reple_content = reple_content;
		this.reple_writedate = reple_writedate;
	}
	public int getReple_no() {
		return reple_no;
	}
	public void setReple_no(int reple_no) {
		this.reple_no = reple_no;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getReple_content() {
		return reple_content;
	}
	public void setReple_content(String reple_content) {
		this.reple_content = reple_content;
	}
	public Date getReple_writedate() {
		return reple_writedate;
	}
	public void setReple_writedate(Date reple_writedate) {
		this.reple_writedate = reple_writedate;
	}
	
	

}