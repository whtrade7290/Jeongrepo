package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.JNoticeVo;
import com.example.domain.JQuestionVo;
import com.example.mapper.JQuestionMapper;

@Service
public class JQuestionService {
   
   @Autowired
   private JQuestionMapper jquestionMapper;
   
   public JQuestionVo getJQuestionByNum(int num) {
      JQuestionVo jquestionVo = jquestionMapper.getJQuestionByNum(num);
         return jquestionVo;
      }
   
   
   // 질문 쓰귀
   public void addJQuestion(JQuestionVo jquestionVo) {
      jquestionMapper.addJQuestion(jquestionVo);
      }
      
   public int getCountBySearch(String category, String search) {
      int count = jquestionMapper.getCountBySearch(category, search);
      return count;
   }
   
   public List<JQuestionVo> getJQuestionBySearch(int startRow, int pageSize, String category, String search) {
      return jquestionMapper.getJQuestionBySearch(startRow, pageSize, category, search);
   }
   
   // 공지삭제
      public void deleteJNoticeByNum(int num) {
         jquestionMapper.deleteJNoticeByNum(num);
      }
}