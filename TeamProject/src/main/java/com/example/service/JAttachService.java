package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.domain.JAttachVo;
import com.example.mapper.JAttachMapper;

public class JAttachService {

   @Autowired
   private JAttachMapper jattachMapper;
   
   public void insertJAttach(JAttachVo jattachVo) {
      jattachMapper.insertJAttach(jattachVo);
   }
}