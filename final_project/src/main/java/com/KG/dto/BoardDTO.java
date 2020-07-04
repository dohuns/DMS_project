package com.KG.dto;

import java.sql.Timestamp;

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
	private int b_sortNum; // 정렬번호

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

	public Timestamp getB_date() {
		return b_date;
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