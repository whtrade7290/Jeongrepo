package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.example.domain.JNoticeVo;

public interface JNoticeMapper {

   void addJNotice(JNoticeVo jnoticeVo);
   
   JNoticeVo getJNoticeByNum(int num);
   
   int getCountBySearch(
         @Param("category") String category, 
         @Param("search") String search);
   
   
   List<JNoticeVo> getJNoticesBySearch(
         @Param("startRow") int startRow, 
         @Param("pageSize") int pageSize, 
         @Param("category") String category, 
         @Param("search") String search);
   
   int getNextNum(String tableName);
   
   // 조회수
   void updateReadcount(int num);
   
   //공지 삭제
   @Delete("DELETE FROM jnotice WHERE num = #{num}")
   void deleteJNoticeByNum(int num);

   //수정
   void updateBoard(JNoticeVo jnoticeVo);
   
   
}