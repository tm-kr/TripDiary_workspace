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

	private DiaryDao diaryDao;
	
	@Autowired
	public DiaryService(DiaryDao emblemDao) {
		this.diaryDao = emblemDao;
	}
	
	public List<EmblemCmd> selectEmblem(){	
		diaryDao.selectEmblem();
		return diaryDao.selectEmblem();
	}
	
	public List<HaveEmblemCmd> haveEmblem(int memberNum){
		return diaryDao.haveEmblem(memberNum);
	}
	
	public MemberActCmd getActCnt(int memberNum) {
		return diaryDao.getActCnt(memberNum);
	}
	
	public void getEmblem(GetEmblem getEmblem) {
		diaryDao.getEmblem(getEmblem);
	}
	
	//나중에 날짜 정보를 모아오는 다른 서비스가 있다면 삭제
	public List<String> getDate(int memberNum){
		return diaryDao.getDate(memberNum);
	}
		
}
