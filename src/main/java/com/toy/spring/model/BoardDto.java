package com.toy.spring.model;

public class BoardDto {
	private int articleno;
	private String title;
	private String content;
	private String userid;
	private String regtime;
	public BoardDto() {}
	public BoardDto(int articleno, String title, String content, String userid, String regtime) {
		super();
		this.articleno = articleno;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.regtime = regtime;
	}
	public int getArticleno() {
		return articleno;
	}
	public void setArticleno(int articleno) {
		this.articleno = articleno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	@Override
	public String toString() {
		return "BoardDto [articleno=" + articleno + ", title=" + title + ", content=" + content + ", userid=" + userid
				+ ", regtime=" + regtime + "]";
	}
}
