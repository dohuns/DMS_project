package com.KG.dto;

import java.sql.Date;

public class MemberDTO {

	// m_rn : adminPage에서 회원 수 확인용도(paging처리에 사용)
	private String m_rn;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_nick;
	private Date m_birth;
	private String m_email;
	private String m_rank;

	public String getM_rn() {
		return m_rn;
	}

	public void setM_rn(String m_rn) {
		this.m_rn = m_rn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public Date getM_birth() {
		return m_birth;
	}

	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_rank() {
		return m_rank;
	}

	public void setM_rank(String m_rank) {
		this.m_rank = m_rank;
	}

}
