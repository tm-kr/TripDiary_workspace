package com.tripdiary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripdiary.dao.EmblemDao;
import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.EmblemGetCmd;
import com.tripdiary.vo.MemberActCmd;

@Service
public class EmblemService {

	private EmblemDao emblemDao;
	
	@Autowired
	public EmblemService(EmblemDao emblemDao) {
		this.emblemDao = emblemDao;
	}
	
	public List<EmblemCmd> emblemSelect(){	
		return emblemDao.emblemSelect();
	}
	
	public List<EmblemGetCmd> emblemGet(int memberNum){
		return emblemDao.emblemGet(memberNum);
	}
	
	public MemberActCmd getActCnt(int memberNum) {
		return emblemDao.getActCnt(memberNum);
	}
		
}
