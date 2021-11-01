package com.tripdiary.util;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.vo.WriteCmd;

@Component
public class CheckUtils {
	private static final String filePath = "C:\\mp\\board_img\\"; // 파일이 저장될 위치
	
	public boolean check(MultipartHttpServletRequest mpRequest) throws Exception{
		MultipartFile file = mpRequest.getFile("thumbnail");
		List<MultipartFile> fileList = mpRequest.getFiles("file");
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String type = null;
		double size = 0;
		boolean check = false;
		
		if (file != null) {
			multipartFile = file;
			// 원본 이름
			originalFileName = multipartFile.getOriginalFilename();
			// 파일 확장자
			type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			size = multipartFile.getSize();
			if(!type.equals("jpg") || !type.equals("jpeg") || !type.equals("png") || !type.equals("gif") || !type.equals("bmp") || !type.equals("pdf") || 
					!type.equals("JPG") || !type.equals("JPEG") || !type.equals("PNG") || !type.equals("GIF") || !type.equals("BMP") || !type.equals("PDF")) {
				check = true;
				return check;
			}
			if (size > 8 * 1024 * 1024 * 5) {
				check = true;
				return check;
			}
		}
		
		if(fileList != null) {
			for(int i=0; i<fileList.size(); i++) {
				multipartFile = fileList.get(i);
				// 원본 이름
				originalFileName = multipartFile.getOriginalFilename();
				// 파일 확장자
				type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				size = multipartFile.getSize();
				if(!type.equals("jpg") || !type.equals("jpeg") || !type.equals("png") || !type.equals("gif") || !type.equals("bmp") || !type.equals("pdf") || 
						!type.equals("JPG") || !type.equals("JPEG") || !type.equals("PNG") || !type.equals("GIF") || !type.equals("BMP") || !type.equals("PDF")) {
					check = true;
					return check;
				}
				if (size > 8 * 1024 * 1024 * 5) {
					check = true;
					return check;
				}
			}
		}
		
		
		return check;
	}
}