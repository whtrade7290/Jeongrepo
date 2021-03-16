package com.example.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class OneNoticeVo {
   private int num;
   private String id;
   private String category;
   private String title;
   private String email;
   private String tel;
   private String content;
   private String emailchk;
   private String telchk;
   private Timestamp regDate;
   
   private List<JAttachVo> jattachList;
}