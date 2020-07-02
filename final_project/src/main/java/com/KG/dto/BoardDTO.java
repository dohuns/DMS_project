package com.KG.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private String b_category; // 카테고리
	private int b_cateNum; // 카테고리 번호부여
	private String article; // 게시판
	private int b_articleNum; // 게시판 번호부여
	private int cateSort; // 카테고리 옮기기용 번호
	private int b_num; // 글 번호
	private String b_title; // 글 제목
	private String b_content; // 글 내용
	private String b_nick; // 닉네임
	private Timestamp b_date; // 작성시간
	private int hit; // 조회수
	private int reNum; // 답글 번호
	private int sortNum; // 글 정렬용 번호
	
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
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public int getB_articleNum() {
		return b_articleNum;
	}
	public void setB_articleNum(int b_articleNum) {
		this.b_articleNum = b_articleNum;
	}
	public int getCateSort() {
		return cateSort;
	}
	public void setCateSort(int cateSort) {
		this.cateSort = cateSort;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	public int getSortNum() {
		return sortNum;
	}
	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}
	
	
	

	
	
}
