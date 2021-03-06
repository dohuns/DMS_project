package com.KG.dto;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Formatter;
import java.util.GregorianCalendar;
import java.util.Locale;

public class BoardDTO {
	private String b_category; // 카테고리
	private int b_cateNum; // 카테고리 번호
	private int b_cateSort; // 카테고리 정렬
	private String b_article; // 게시판 이름
	private int b_articleNum; // 게시판 번호
	private int b_num; // 글 번호
	private String b_title; // 글 제목
	private String b_content; // 글 내용
	private String b_nick; // 작성자
	private Timestamp b_date; // 작성시간
	private int b_hit; // 조회수
	private int b_reNum; // 답글번호
	private int b_sortNum; // 답글 정렬번호
	private int b_group; // 정렬번호
	private int artiNum; // 게시글 보기에서 15개씩 나누는 번호
	private String b_id; // 아이디 
	private int b_comCount; // 댓글 개수
 


	public int getB_comCount() {
		return b_comCount;
	}

	public void setB_comCount(int b_comCount) {
		this.b_comCount = b_comCount;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public int getArtiNum() {
		return artiNum;
	}

	public void setArtiNum(int artiNum) {
		this.artiNum = artiNum;
	}

	public int getB_group() {
		return b_group;
	}


	public void setB_group(int b_group) {
		this.b_group = b_group;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public int getB_cateNum() {
		return b_cateNum;
	}

	public void setB_cateNum(int b_cateNum) {
		this.b_cateNum = b_cateNum;
	}

	public int getB_cateSort() {
		return b_cateSort;
	}

	public void setB_cateSort(int b_cateSort) {
		this.b_cateSort = b_cateSort;
	}

	public String getB_article() {
		return b_article;
	}

	public void setB_article(String b_article) {
		this.b_article = b_article;
	}

	public int getB_articleNum() {
		return b_articleNum;
	}

	public void setB_articleNum(int b_articleNum) {
		this.b_articleNum = b_articleNum;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}


	public String getB_nick() {
		return b_nick;
	}

	public void setB_nick(String b_nick) {
		this.b_nick = b_nick;
	}

	
	public String getB_date() throws ParseException {

		String today1 = new SimpleDateFormat("yy.MM.dd").format(new Date());
		String article = new SimpleDateFormat("yy.MM.dd").format(b_date);
		if(today1.equals(article)) { 
			return new SimpleDateFormat("HH:mm").format(b_date);
		}
		return new SimpleDateFormat("yyyy.MM.dd").format(b_date);
	}

	public String getDate() {
		return new SimpleDateFormat("yyyy.MM.dd HH:mm").format(b_date);
	}

	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}

	public int getB_hit() {
		return b_hit;
	}

	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}

	public int getB_reNum() {
		return b_reNum;
	}

	public void setB_reNum(int b_reNum) {
		this.b_reNum = b_reNum;
	}

	public int getB_sortNum() {
		return b_sortNum;
	}

	public void setB_sortNum(int b_sortNum) {
		this.b_sortNum = b_sortNum;
	}

}