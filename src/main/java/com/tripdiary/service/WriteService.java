package com.tripdiary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.dao.WriteDao;
import com.tripdiary.vo.WriteCmd;

@Service
public class WriteService {

	private WriteDao writeDao;
	
	@Autowired
	public WriteService(WriteDao writeDao) {
		this.writeDao = writeDao;
	}
	
	public void write(WriteCmd writeCmd, MultipartHttpServletRequest mpRequest) {
		writeDao.write(writeCmd);
	}
		
}
