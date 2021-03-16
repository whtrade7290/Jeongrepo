package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class JNoticeVo {
   private int num;
   private String id;
   private String title;
   private String content;
   private Timestamp regDate;
   private int readcount;
   private int reRef;
   private int reLev;
   private int reSeq;
}