package com.tripdiary.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.tripdiary.vo.WriteCmd;

public class WriteDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public WriteDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void write(WriteCmd writeCmd) {
		sqlSessionTemplate.insert("write", writeCmd);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("insertFile", map);
	}
}
