package com.KG.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.KG.dto.BoardDTO;
import com.KG.dto.MemberDTO;

@Component("fileUtils")
public class FileUtils {
	
	
	// 게시글 업로드
	public List<Map<String, Object>> parseInsertFileBoard(BoardDTO boardDTO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\uploadFile\\"; // 파일이 저장될 위치
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bno = boardDTO.getB_num();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("f_boardNum", bno);
				listMap.put("f_oriName", originalFileName);
				listMap.put("f_modiName", storedFileName);
				listMap.put("f_size", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	// 프로필 사진 업로드
	public List<Map<String, Object>> parseInsertFileMember(MemberDTO memberDTO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\memberImage\\"; // 파일이 저장될 위치
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		String id = memberDTO.getM_id();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("f_memberId", id);
				listMap.put("f_oriName", originalFileName);
				listMap.put("f_modiName", storedFileName);
				listMap.put("f_size", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}