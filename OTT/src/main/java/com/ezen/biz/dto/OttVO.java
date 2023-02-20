package com.ezen.biz.dto;

import org.springframework.web.multipart.MultipartFile;

public class OttVO {
	private int 	id;
	private String 	title;
	private String 	genre;
	private String 	director;
	private String 	actor;
	private int 	cnt;
	private String	poster;
	private String	image;
	private String	content;
	private String	server;
	private String searchCondition;
	private String searchKeyword;
	private MultipartFile pUploadFile;
	private MultipartFile iUploadFile;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public MultipartFile getpUploadFile() {
		return pUploadFile;
	}
	public void setpUploadFile(MultipartFile pUploadFile) {
		this.pUploadFile = pUploadFile;
	}
	public MultipartFile getiUploadFile() {
		return iUploadFile;
	}
	public void setiUploadFile(MultipartFile iUploadFile) {
		this.iUploadFile = iUploadFile;
	}
	@Override
	public String toString() {
		return "OttVO [id=" + id + ", title=" + title + ", genre=" + genre + ", director=" + director + ", actor="
				+ actor + ", cnt=" + cnt + ", poster=" + poster + ", image=" + image + ", content=" + content
				+ ", server=" + server + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pUploadFile=" + pUploadFile + ", iUploadFile=" + iUploadFile + "]";
	}
	
	
	
	
	
}
