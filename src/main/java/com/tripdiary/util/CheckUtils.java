package com.tripdiary.util;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class CheckUtils {
	
	public boolean check(MultipartHttpServletRequest mpRequest) throws Exception{
		MultipartFile file = mpRequest.getFile("thumbnail");
		List<MultipartFile> fileList = mpRequest.getFiles("file");
		if(mpRequest.getFiles("file").get(0).getOriginalFilename().equals("")) {
			fileList.clear();
		}
		fileList.add(file);
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String type = null;
		double size = 0;
		boolean check = true;
		
		if(fileList != null) {
			for(int i=0; i<fileList.size(); i++) {
				multipartFile = fileList.get(i);
				// 원본 이름
				originalFileName = multipartFile.getOriginalFilename();
				// 파일 확장자
				type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				size = multipartFile.getSize();
				if(type.equals("jpg") || type.equals("jpeg") || type.equals("png") || type.equals("gif") || type.equals("bmp") || type.equals("pdf") || 
						type.equals("JPG") || type.equals("JPEG") || type.equals("PNG") || type.equals("GIF") || type.equals("BMP") || type.equals("PDF")) {
				
				}else {
					check = false;
				}
				if (size > 8 * 1024 * 1024 * 5) {
					check = false;
				}
			}
		}
		return check;
	}
}