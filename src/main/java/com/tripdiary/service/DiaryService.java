package com.tripdiary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripdiary.dao.DiaryDao;
import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.HaveEmblemCmd;
import com.tripdiary.vo.GetEmblem;
import com.tripdiary.vo.MemberActCmd;

@Service
public class DiaryService {

	private DiaryDao emblemDao;
	
	@Autowired
	public DiaryService(DiaryDao emblemDao) {
		this.emblemDao = emblemDao;
	}
	
	public List<EmblemCmd> selectEmblem(){	
		emblemDao.selectEmblem();
		return emblemDao.selectEmblem();
	}
	
	public List<HaveEmblemCmd> haveEmblem(int memberNum){
		return emblemDao.haveEmblem(memberNum);
	}
	
	public MemberActCmd getActCnt(int memberNum) {
		return emblemDao.getActCnt(memberNum);
	}
	
	public void getEmblem(GetEmblem getEmblem) {
		emblemDao.getEmblem(getEmblem);
	}
		
}
