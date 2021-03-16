package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.example.domain.JNoticeVo;
import com.example.domain.JQuestionVo;

public interface JQuestionMapper {

   void addJQuestion(JQuestionVo jquestionVo);

   JQuestionVo getJQuestionByNum(int num);
   
   int getCountBySearch(
         @Param("category") String category, 
         @Param("search") String search);

   List<JQuestionVo> getJQuestionBySearch(
         @Param("startRow") int startRow, 
         @Param("pageSize") int pageSize, 
         @Param("category") String category, 
         @Param("search") String search);
   
      //공지 삭제
   @Delete("DELETE FROM jservice WHERE num = #{num}")
   void deleteJNoticeByNum(int num);

}