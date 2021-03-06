package com.tripdiary.TMservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.TMdao.WriteDao;
import com.tripdiary.TMutil.FileUtils;
import com.tripdiary.TMutil.TagUtils;
import com.tripdiary.TMutil.ThumbnailUtils;
import com.tripdiary.TMvo.MapCmd;
import com.tripdiary.TMvo.TagCmd;
import com.tripdiary.TMvo.WriteCmd;

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
	
	public void write(WriteCmd writeCmd,TagCmd tagCmd, MapCmd mapCmd, MultipartHttpServletRequest mpRequest) throws Exception {
		//글작성
		if(writeCmd.getPlaceCheck().equals("abroad")) {
			writeCmd.setPlace("abroad");
		}
		writeDao.write(writeCmd);
		
		//맵 좌표 등록
		if(mapCmd.getMarkerLat() != 0) {
			mapCmd.setBoardNum(writeCmd.getBoardNum());
			writeDao.insertMap(mapCmd);
		}
		
		//태그등록
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
		
    	//대표사진 업로드 (if 값이 들어있다면 실행 비어있다면 실행x)
		if(!mpRequest.getFile("thumbnail").getOriginalFilename().equals("")) {
	   	Map<String, Object> thumbnail = null;
	    thumbnail = thumbnailUtils.parseInsertFileInfo(writeCmd, mpRequest);
	    writeDao.insertFile(thumbnail);	
		}
    	
    	
		//추가 사진 업로드 (if 값이 들어있다면 실행 비어있다면 실행x)
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
	    
	    //회원 활동 글작성 카운트 +1
	    writeDao.cntUp(writeCmd.getMemberNum());
	}
	
	public WriteCmd getBoard(int boardNum) {
		return writeDao.getBoard(boardNum);
	}
	
	public List<TagCmd> getTag(int boardNum) {
		return writeDao.getTag(boardNum);
	}
	
	public void writeUpdate(WriteCmd writeCmd,TagCmd tagCmd, MultipartHttpServletRequest mpRequest) throws Exception {
		//글작성
		if(writeCmd.getPlaceCheck().equals("abroad")) {
			writeCmd.setPlace("abroad");
		}
		writeDao.writeUpdate(writeCmd);
		
		//기존 태그 삭제
		writeDao.deleteTag(writeCmd.getBoardNum());
		//태그 재등록
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
		
    	//대표사진 업로드 (if 값이 들어있다면 실행 비어있다면 실행x)
		if(!mpRequest.getFile("thumbnail").getOriginalFilename().equals("")) {
		//기존 사진 삭제
		writeDao.deleteThumbnail(writeCmd.getBoardNum());
	   	Map<String, Object> thumbnail = null;
	    thumbnail = thumbnailUtils.parseInsertFileInfo(writeCmd, mpRequest);
	    writeDao.insertFile(thumbnail);	
		}
    	
    	
		//추가 사진 업로드 (if 값이 들어있다면 실행 비어있다면 실행x)
	    if(!mpRequest.getFiles("file").get(0).getOriginalFilename().equals("")) {
	    	//기존 사진 삭제
	    	writeDao.deleteFile(writeCmd.getBoardNum());
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
	
	public String getMainImg(int boardNum) {
		return writeDao.getMainImg(boardNum);
	}
	
	public List<String> getSubImg(int boardNum) {
		return writeDao.getSubImg(boardNum);
	}
	
}
