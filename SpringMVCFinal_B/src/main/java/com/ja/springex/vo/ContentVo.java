package com.ja.springex.vo;

import java.util.Date;

public class ContentVo {
	
	private int content_no;
	private int member_no;
	private String content_title;
	private String content_content;
	private int content_readcount;
	private Date content_writedate;
	public ContentVo() {
		super();
	}
	public ContentVo(int content_no, int member_no, String content_title, String content_content, int content_readcount,
			Date content_writedate) {
		super();
		this.content_no = content_no;
		this.member_no = member_no;
		this.content_title = content_title;
		this.content_content = content_content;
		this.content_readcount = content_readcount;
		this.content_writedate = content_writedate;
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
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	public String getContent_content() {
		return content_content;
	}
	public void setContent_content(String content_content) {
		this.content_content = content_content;
	}
	public int getContent_readcount() {
		return content_readcount;
	}
	public void setContent_readcount(int content_readcount) {
		this.content_readcount = content_readcount;
	}
	public Date getContent_writedate() {
		return content_writedate;
	}
	public void setContent_writedate(Date content_writedate) {
		this.content_writedate = content_writedate;
	}

	
	
	
}
