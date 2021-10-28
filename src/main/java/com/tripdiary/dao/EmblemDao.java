package com.tripdiary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripdiary.vo.EmblemCmd;
import com.tripdiary.vo.EmblemGetCmd;
import com.tripdiary.vo.GetEmblem;
import com.tripdiary.vo.MemberActCmd;

@Repository
public class EmblemDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public EmblemDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<EmblemCmd> emblemSelect() {
		return sqlSessionTemplate.selectList("emblemSelect");
	}
	
	public List<EmblemGetCmd> emblemGet(int memberNum){
		return sqlSessionTemplate.selectList("emblemGet", memberNum);
	}
	
	public MemberActCmd getActCnt(int memberNum) {
		return sqlSessionTemplate.selectOne("getActCnt", memberNum);
	}
	
	public void getEmblem(GetEmblem getEmblem) {
		sqlSessionTemplate.insert("getEmblem",getEmblem);
	}

}
