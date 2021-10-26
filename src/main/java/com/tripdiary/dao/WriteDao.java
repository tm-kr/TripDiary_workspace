package com.tripdiary.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripdiary.vo.WriteCmd;

@Repository
public class WriteDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public WriteDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void write(WriteCmd writeCmd) {
		writeCmd.setTripdate(writeCmd.getYear()+"-"+writeCmd.getMonth()+"-"+writeCmd.getDay());
		sqlSessionTemplate.insert("write", writeCmd);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("insertFile", map);
	}
}
