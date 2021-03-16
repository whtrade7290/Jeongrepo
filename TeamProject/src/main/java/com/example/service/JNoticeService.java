package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.JNoticeVo;
import com.example.mapper.JNoticeMapper;

@Service
public class JNoticeService {

   @Autowired
   private JNoticeMapper jnoticeMapper;

   public JNoticeVo getJNoticeByNum(int num) {
      JNoticeVo jnoticeVo = jnoticeMapper.getJNoticeByNum(num);
      return jnoticeVo;
   }
   
   public List<JNoticeVo> getJNoticesBySearch(int startRow, int pageSize, String category, String search) {
      return jnoticeMapper.getJNoticesBySearch(startRow, pageSize, category, search);
   }
   
   public int getCountBySearch(String category, String search) {
      int count = jnoticeMapper.getCountBySearch(category, search);
      return count;
   }
   
   public int getNextNum(String tableName) {
      int num = jnoticeMapper.getNextNum(tableName);
      return num;
   }
   
   // 공지 쓰기
   public void addJNotice(JNoticeVo jnoticeVo) {
      jnoticeMapper.addJNotice(jnoticeVo);
   }
   // 조회수 1 씩오리기
   public void updateReadcount(int num) {
      jnoticeMapper.updateReadcount(num);
   }
   // 공지삭제
   public void deleteJNoticeByNum(int num) {
      jnoticeMapper.deleteJNoticeByNum(num);
   }
   // 수정
   public void updateBoard(JNoticeVo jnoticeVo) {
      jnoticeMapper.updateBoard(jnoticeVo);
   }
}