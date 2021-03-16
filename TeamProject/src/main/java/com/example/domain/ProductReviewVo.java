package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductReviewVo {

	private int num;
	private String title;
	private String content;
	private String writer;
	private Timestamp dateCreated;
	private int help;
	private int lookup;
	private String goodsPk;
	private String filename;
	private String fileuploadpath;
}
