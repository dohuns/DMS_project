package com.KG.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentDTO {
	
	private int c_num; // 글번호 연동용
	private String c_nick; // 작성자
	private String c_content; // 댓글 내용
	private Timestamp c_date; // 작성 시간
	private int c_group; // 정렬 번호
	private int c_renum; // 답글 정렬
	private String c_id; // 작성자 ID
	
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_nick() {
		return c_nick;
	}
	public void setC_nick(String c_nick) {
		this.c_nick = c_nick;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_date() {
		return new SimpleDateFormat("yyyy.MM.dd HH:mm").format(c_date);
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
	public int getC_group() {
		return c_group;
	}
	public void setC_group(int c_group) {
		this.c_group = c_group;
	}
	public int getC_renum() {
		return c_renum;
	}
	public void setC_renum(int c_renum) {
		this.c_renum = c_renum;
	}

	

}
