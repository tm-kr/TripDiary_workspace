package com.tripdiary.TMutil;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.TMvo.WriteCmd;

@Component
public class ThumbnailUtils {
	private static final String filePath = "C:\\mp\\board_thumbnail\\"; // 파일이 저장될 위치

	public Map<String, Object> parseInsertFileInfo(WriteCmd writeCmd, MultipartHttpServletRequest mpRequest)
			throws Exception {

		/*
		 * Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다. List나 배열은 순차적으로 데이터의
		 * 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다. Iterator을 이용하여 Map에 있는 데이터들을
		 * while문을 이용하여 순차적으로 접근합니다.
		 */
		MultipartFile multipartFile = mpRequest.getFile("thumbnail");
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		Map<String, Object> listMap = null;

		int num = writeCmd.getBoardNum();

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		// 원본 이름
		originalFileName = multipartFile.getOriginalFilename();
		// 파일 확장자
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		// 저장될 파일 이름
		storedFileName = getRandomString() + originalFileExtension;
		file = new File(filePath + storedFileName);
		multipartFile.transferTo(file);
		listMap = new HashMap<String, Object>();
		listMap.put("board_num", num);
		listMap.put("org_file_name", originalFileName);
		listMap.put("store_file_name", storedFileName);
		listMap.put("file_size", multipartFile.getSize());
		listMap.put("file_type", originalFileExtension);
		listMap.put("main_img", 1);

		return listMap;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
