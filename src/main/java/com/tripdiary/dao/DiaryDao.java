package com.tripdiary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.GetEmblemCmd;
import com.tripdiary.vo.HaveEmblemCmd;
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
	
	//나중에 날짜 정보를 모아오는 다른 서비스가 있다면 삭제
	public List<String> getDate(int memberNum){
		return sqlSessionTemplate.selectList("getDate", memberNum);
	}
	
	public ProfileCmd getProfile(int memberNum) {
		return sqlSessionTemplate.selectOne("getProfile", memberNum);
	}


}
