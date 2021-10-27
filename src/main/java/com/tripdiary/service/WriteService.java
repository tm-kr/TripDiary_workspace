package com.tripdiary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
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
		//���ۼ�
		if(writeCmd.getPlaceCheck().equals("abroad")) {
			writeCmd.setPlace("abroad");
		}
		writeDao.write(writeCmd);
		
		//�±׵��
		if(tagCmd.getTag() != null) {
		List<Map<String,Object>> tag = tagUtils.tagList(writeCmd, tagCmd);
			int tagSize = tagCmd.getTag().size();
			if(tagSize > 5) {
				tagSize = 5;
			}
			for (int i=0; i<tagSize; i++) {
				writeDao.insertTag(tag.get(i));
			}
		}
		
    	//��ǥ���� ���ε� (if ���� ����ִٸ� ���� ����ִٸ� ����x)
		if(!mpRequest.getFile("thumbnail").getOriginalFilename().equals("")) {
	   	Map<String, Object> thumbnail = null;
	    thumbnail = thumbnailUtils.parseInsertFileInfo(writeCmd, mpRequest);
	    writeDao.insertFile(thumbnail);	
		}
    	
    	
		//�߰� ���� ���ε� (if ���� ����ִٸ� ���� ����ִٸ� ����x)
	    if(!mpRequest.getFiles("file").get(0).getOriginalFilename().equals("")) {
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(writeCmd, mpRequest);
			int size = list.size();
			if(size > 10) {
				size = 10;
			}
			for(int i=0; i<size; i++){ 
				writeDao.insertFile(list.get(i)); 
			}
	    }

    	
		
	}
		
}
