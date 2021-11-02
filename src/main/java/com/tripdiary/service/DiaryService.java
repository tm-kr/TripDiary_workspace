package com.tripdiary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.dao.DiaryDao;
import com.tripdiary.util.ProfileUtils;
import com.tripdiary.vo.BoardListVO;
import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.GetEmblemCmd;
import com.tripdiary.vo.HaveEmblemCmd;
import com.tripdiary.vo.MapCmd;
import com.tripdiary.vo.MemberActCmd;
import com.tripdiary.vo.PageVO;
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
	
	//���߿� ��¥ ������ ��ƿ��� �ٸ� ���񽺰� �ִٸ� ����
	public List<String> getDate(int memberNum){
		return diaryDao.getDate(memberNum);
	}
	
	public ProfileCmd getProfile(int memberNum) {
		return diaryDao.getProfile(memberNum);
	}
	
	public void profileUpdate(MultipartHttpServletRequest mpRequest, int memberNum, String message) throws Exception {
		// ������ ���¸޼��� ������Ʈ
		Map<String, Object> profileMessage = new HashMap<String, Object>();
		profileMessage.put("member_num", memberNum);
		profileMessage.put("message", message);
		diaryDao.profileMessageUpdate(profileMessage);
		
    	// ������ ���� ���ε� (if ���� ����ִٸ� ���� ����ִٸ� ����x)
		if(!mpRequest.getFile("profile_img").getOriginalFilename().equals("")) {
		   	Map<String, Object> profileImg = null;
		    profileImg = profileUtils.parseInsertFileInfo(memberNum, mpRequest);
		    diaryDao.profileImgUpdate(profileImg);	
		}
	}
	
	public List<MapCmd> getMap (int memberNum){
		return diaryDao.getMap(memberNum);
	}
	
	public int getArticleCount(int memberNum) {
		return diaryDao.getArticleCount(memberNum);
	}
	
	public List<BoardListVO> getBoardList(PageVO pageVO){
		return diaryDao.getBoardList(pageVO);
	}
	
	
		
}
