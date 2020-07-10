package com.KG.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentDTO {
	
	private int c_boardNum; // 글번호 연동용
	private int c_comNum; // 댓글 고유번호
	private String c_nick; // 작성자
	private String c_content; // 댓글 내용
	private Timestamp c_date; // 작성 시간
	private int c_group; // 정렬 번호
	private int c_reNum; // 답글 정렬
	private String c_id; // 작성자 ID
	
	
	public int getC_boardNum() {
		return c_boardNum;
	}
	public void setC_boardNum(int c_boardNum) {
		this.c_boardNum = c_boardNum;
	}
	public int getC_comNum() {
		return c_comNum;
	}
	public void setC_comNum(int c_comNum) {
		this.c_comNum = c_comNum;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
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
	public int getC_reNum() {
		return c_reNum;
	}
	public void setC_reNum(int c_reNum) {
		this.c_reNum = c_reNum;
	}

	

}
