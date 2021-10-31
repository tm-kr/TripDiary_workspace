package com.tripdiary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.dao.DiaryDao;
import com.tripdiary.util.ProfileUtils;
import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.GetEmblemCmd;
import com.tripdiary.vo.HaveEmblemCmd;
import com.tripdiary.vo.MemberActCmd;
import com.tripdiary.vo.ProfileCmd;

@Service
public class DiaryService {

	private DiaryDao diaryDao;
	private ProfileUtils profileUtils;
	
	@Autowired
	public DiaryService(DiaryDao emblemDao, ProfileUtils profileUtils) {
		this.diaryDao = emblemDao;
		this.profileUtils = profileUtils;
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
	
	public void getEmblem(GetEmblemCmd getEmblem) {
		diaryDao.getEmblem(getEmblem);
	}
	
	//나중에 날짜 정보를 모아오는 다른 서비스가 있다면 삭제
	public List<String> getDate(int memberNum){
		return diaryDao.getDate(memberNum);
	}
	
	public ProfileCmd getProfile(int memberNum) {
		return diaryDao.getProfile(memberNum);
	}
	
	public void profileUpdate(MultipartHttpServletRequest mpRequest, int memberNum, String message) throws Exception {
		// 프로필 상태메세지 업데이트
		Map<String, Object> profileMessage = new HashMap<String, Object>();
		profileMessage.put("member_num", memberNum);
		profileMessage.put("message", message);
		diaryDao.profileMessageUpdate(profileMessage);
		
    	// 프로필 사진 업로드 (if 값이 들어있다면 실행 비어있다면 실행x)
		if(!mpRequest.getFile("profile_img").getOriginalFilename().equals("")) {
		   	Map<String, Object> profileImg = null;
		    profileImg = profileUtils.parseInsertFileInfo(memberNum, mpRequest);
		    diaryDao.profileImgUpdate(profileImg);	
		}
	}
		
}
