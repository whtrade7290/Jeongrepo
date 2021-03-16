package com.example.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.JAttachVo;
import com.example.domain.OneNoticeVo;
import com.example.mapper.JAttachMapper;
import com.example.mapper.OneNoticeMapper;

@Service
public class OneNoticeService {

   @Autowired
   private OneNoticeMapper oneNoticeMapper;
   @Autowired
   private JAttachMapper jattachMapper;
   
   public void addOneNotice(OneNoticeVo oneNoticeVo) {
      oneNoticeMapper.addOneNotice(oneNoticeVo);
    }
   
   public List<OneNoticeVo> getOneNoticesBySearch(int startRow, int pageSize, String category, String search) {
         return oneNoticeMapper.getOneNoticesBySearch(startRow, pageSize, category, search);
    }
      
    public int getCountBySearch(String category, String search) {
       int count = oneNoticeMapper.getCountBySearch(category, search);
       return count;
    }
    
    public OneNoticeVo getOneNoticeAndJAttaches(int num) {
      return oneNoticeMapper.getOneNoticeAndJAttaches(num);
   }
   
   // 1:1 질문 주글쓰기
      @Transactional
      public void addOneNoticeAndJAttaches(OneNoticeVo oneNoticeVo, List<JAttachVo> jattachList) {
         // 게시글 등록
         oneNoticeMapper.addOneNotice(oneNoticeVo);
         
         // 첨부파일정보 등록
         for (JAttachVo jattachVo : jattachList) {
            jattachMapper.insertJAttach(jattachVo);
         }
      }
}