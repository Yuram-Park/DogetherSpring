package com.yooram.domain;

import java.util.Date;

public class FileDto {
	private int file_id;
	private int post_id;
	private String file_oriname;
	private String file_link;
	private Date file_create_date;
	
	public FileDto() {}
	
	public FileDto(int file_id, int post_id, String file_oriname, String file_link) {
		super();
		this.file_id = file_id;
		this.post_id = post_id;
		this.file_oriname = file_oriname;
		this.file_link = file_link;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getFile_oriname() {
		return file_oriname;
	}
	public void setFile_oriname(String file_oriname) {
		this.file_oriname = file_oriname;
	}
	public String getFile_link() {
		return file_link;
	}
	public void setFile_link(String file_link) {
		this.file_link = file_link;
	}
	public Date getFile_create_date() {
		return file_create_date;
	}
	public void setFile_create_date(Date file_create_date) {
		this.file_create_date = file_create_date;
	}
	
	
}
