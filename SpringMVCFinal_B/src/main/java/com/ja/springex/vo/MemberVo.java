package com.ja.springex.vo;

import java.util.Date;

public class MemberVo {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_nick;
	private String member_sex;
	private String member_region;
	private String member_phone;
	private Date member_joindate;
	public MemberVo() {
		super();
	}
	public MemberVo(int member_no, String member_id, String member_pw, String member_nick, String member_sex,
			String member_region, String member_phone, Date member_joindate) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nick = member_nick;
		this.member_sex = member_sex;
		this.member_region = member_region;
		this.member_phone = member_phone;
		this.member_joindate = member_joindate;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_region() {
		return member_region;
	}
	public void setMember_region(String member_region) {
		this.member_region = member_region;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Date getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}
	
	
	
}
