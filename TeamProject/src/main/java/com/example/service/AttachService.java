package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.AttachVo;
import com.example.mapper.AttachMapper;

@Service
@Transactional
public class AttachService {

	@Autowired
	private AttachMapper attachMapper;

	public void insertAttach(AttachVo attachVo) {
		attachMapper.insertAttach(attachVo);
	}

	public void insertAttaches(List<AttachVo> attaches) {
		for (AttachVo attachVo : attaches) {
			attachMapper.insertAttach(attachVo);
		}
	}
	
	public List<AttachVo> getAttachesByName(String attachName) {
		List<AttachVo> attachList = attachMapper.getAttachesByName(attachName);
		return attachList;
	}
	
	public int getFileNum(String attachName, String main){
		int num = 0;
		num = attachMapper.getFileNum(attachName, main);
		return num;
	}
	
	public void deleteAttachbyNum(int num) {
		attachMapper.deleteAttachbyNum(num);
	}
	

	
	

}