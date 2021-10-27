package com.tripdiary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.dao.WriteDao;
import com.tripdiary.util.FileUtils;
import com.tripdiary.util.TagUtils;
import com.tripdiary.util.ThumbnailUtils;
import com.tripdiary.vo.TagCmd;
import com.tripdiary.vo.WriteCmd;

@Service
public class WriteService {

	private WriteDao writeDao;
	private FileUtils fileUtils;
	private ThumbnailUtils thumbnailUtils;
	private TagUtils tagUtils;
	
	@Autowired
	public WriteService(WriteDao writeDao, FileUtils fileUtils, ThumbnailUtils thumbnailUtils, TagUtils tagUtils) {
		this.writeDao = writeDao;
		this.fileUtils = fileUtils;
		this.thumbnailUtils = thumbnailUtils;
		this.tagUtils = tagUtils;
	}
	
	public void write(WriteCmd writeCmd,TagCmd tagCmd, MultipartHttpServletRequest mpRequest) throws Exception {
		//글작성
		writeDao.write(writeCmd);
		
		//태그등록
		if(tagCmd.getTag() != null) {
		List<Map<String,Object>> tag = tagUtils.tagList(writeCmd, tagCmd);
			for (int i=0; i<tagCmd.getTag().size(); i++) {
				writeDao.insertTag(tag.get(i));
			}
		}
		
			//대표사진 업로드
			Map<String, Object> thumbnail = null;
			thumbnail = thumbnailUtils.parseInsertFileInfo(writeCmd, mpRequest);
			writeDao.insertFile(thumbnail);
		
		
			//추가 사진 업로드
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(writeCmd, mpRequest);
			int size = list.size();
			for(int i=0; i<size; i++){ 
				writeDao.insertFile(list.get(i)); 
			}
		

		
	}
		
}
