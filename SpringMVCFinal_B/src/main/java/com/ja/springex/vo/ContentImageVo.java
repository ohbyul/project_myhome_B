package com.ja.springex.vo;

public class ContentImageVo {

	private int image_no;
	private int content_no;
	private String image_link;
	public ContentImageVo() {
		super();
	}
	public ContentImageVo(int image_no, int content_no, String image_link) {
		super();
		this.image_no = image_no;
		this.content_no = content_no;
		this.image_link = image_link;
	}
	public int getImage_no() { 
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	
	
}
