package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.OneNoticeVo;

public interface OneNoticeMapper {

    void addOneNotice(OneNoticeVo oneNoticeVo);
    
    int getCountBySearch(
            @Param("category") String category, 
            @Param("search") String search);
      
      
      List<OneNoticeVo> getOneNoticesBySearch(
            @Param("startRow") int startRow, 
            @Param("pageSize") int pageSize, 
            @Param("category") String category, 
            @Param("search") String search);
      
      OneNoticeVo getOneNoticeAndJAttaches(int num);
    
}