package com.KG.dto;

import java.sql.Date;

public class CustomerDTO {

	private int cus_rn;					// PAGING 번호
	private int cus_num;				// 게시글 번호
	private int cus_group;				// 답글용 번호
	private int cus_reNum;				// 답글 번호
	private int cus_categoryNum;		// 카테고리 번호
	private String cus_category;		// 카테고리 명
	private String cus_nick;			// 닉네임
	private String cus_id;				// 아이디
	private String cus_pw;				// 비밀번호
	private String cus_title;			// 제목
	private String cus_email;			// 이메일
	private String cus_content;			// 내용
	private Date cus_date;				// 작성일
	private String cus_pub;				// 공개 여부
	private int pageNum;

	public int getCus_rn() {
		return cus_rn;
	}

	public void setCus_rn(int cus_rn) {
		this.cus_rn = cus_rn;
	}

	public int getCus_num() {
		return cus_num;
	}

	public void setCus_num(int cus_num) {
		this.cus_num = cus_num;
	}

	public int getCus_group() {
		return cus_group;
	}

	public void setCus_group(int cus_group) {
		this.cus_group = cus_group;
	}

	public int getCus_reNum() {
		return cus_reNum;
	}

	public void setCus_reNum(int cus_reNum) {
		this.cus_reNum = cus_reNum;
	}

	public int getCus_categoryNum() {
		return cus_categoryNum;
	}

	public void setCus_categoryNum(int cus_categoryNum) {
		this.cus_categoryNum = cus_categoryNum;
	}

	public String getCus_category() {
		return cus_category;
	}

	public void setCus_category(String cus_category) {
		this.cus_category = cus_category;
	}

	public String getCus_nick() {
		return cus_nick;
	}

	public void setCus_nick(String cus_nick) {
		this.cus_nick = cus_nick;
	}

	public String getCus_id() {
		return cus_id;
	}

	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}

	public String getCus_pw() {
		return cus_pw;
	}

	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}

	public String getCus_title() {
		return cus_title;
	}

	public void setCus_title(String cus_title) {
		this.cus_title = cus_title;
	}

	public String getCus_email() {
		return cus_email;
	}

	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}

	public String getCus_content() {
		return cus_content;
	}

	public void setCus_content(String cus_content) {
		this.cus_content = cus_content;
	}

	public Date getCus_date() {
		return cus_date;
	}

	public void setCus_date(Date cus_date) {
		this.cus_date = cus_date;
	}

	public String getCus_pub() {
		return cus_pub;
	}

	public void setCus_pub(String cus_pub) {
		this.cus_pub = cus_pub;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

}
