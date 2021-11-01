package com.tripdiary.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.GetEmblemCmd;
import com.tripdiary.vo.HaveEmblemCmd;
import com.tripdiary.vo.MapCmd;
import com.tripdiary.vo.MemberActCmd;
import com.tripdiary.vo.ProfileCmd;

@Repository
public class DiaryDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public DiaryDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<EmblemCmd> selectEmblem() {
		return sqlSessionTemplate.selectList("selectEmblem");
	}
	
	public List<HaveEmblemCmd> haveEmblem(int memberNum){
		return sqlSessionTemplate.selectList("haveEmblem", memberNum);
	}
	
	public MemberActCmd getActCnt(int memberNum) {
		return sqlSessionTemplate.selectOne("getActCnt", memberNum);
	}
	
	public void getEmblem(GetEmblemCmd getEmblem) {
		sqlSessionTemplate.insert("getEmblem",getEmblem);
	}
	
	//���߿� ��¥ ������ ��ƿ��� �ٸ� ���񽺰� �ִٸ� ����
	public List<String> getDate(int memberNum){
		return sqlSessionTemplate.selectList("getDate", memberNum);
	}
	
	public ProfileCmd getProfile(int memberNum) {
		return sqlSessionTemplate.selectOne("getProfile", memberNum);
	}
	
	public void profileMessageUpdate(Map<String,Object> profileMessage) {
		sqlSessionTemplate.update("profileMessageUpdate", profileMessage);
	}
	
	public void profileImgUpdate(Map<String,Object> profileImg) {
		sqlSessionTemplate.update("profileImgUpdate", profileImg);
	}
	
	public List<MapCmd> getMap (int memeberNum){
		return sqlSessionTemplate.selectList("getMap", memeberNum);
	}
	

}
