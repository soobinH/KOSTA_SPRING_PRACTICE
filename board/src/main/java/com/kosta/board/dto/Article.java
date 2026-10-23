package com.kosta.board.dto;

public class Article {
	private Integer num;
	private String title;
	private String content;
	private String writer;
	private String imageFilename;
	private String downloadFilename;
	private Integer viewcnt;
	
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Article(String title, String content, String writer) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
	}

	public Article(Integer num, String title, String content, String writer, String imageFilename,
			String downloadFilename, Integer viewcnt) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.imageFilename = imageFilename;
		this.downloadFilename = downloadFilename;
		this.viewcnt = viewcnt;
	}



	public Article(Integer num, String title, String content, String writer, String imageFilename,
			String downloadFilename) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.imageFilename = imageFilename;
		this.downloadFilename = downloadFilename;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getImageFilename() {
		return imageFilename;
	}

	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}

	public String getDownloadFilename() {
		return downloadFilename;
	}

	public void setDownloadFilename(String downloadFilename) {
		this.downloadFilename = downloadFilename;
	}
	

	public Integer getViewcnt() {
		return viewcnt;
	}



	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}



	@Override
	public String toString() {
		return "Article [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", imageFilename=" + imageFilename + ", downloadFilename=" + downloadFilename + ", viewcnt=" + viewcnt
				+ "]";
	}




}
