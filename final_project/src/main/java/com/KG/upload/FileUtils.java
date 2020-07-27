package com.KG.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.KG.dto.BoardDTO;
import com.KG.dto.MemberDTO;

@Component("fileUtils")
public class FileUtils {
	// F_MARK 1 -> 첨부파일 , 
	// 		  2 -> 이미지 첨부파일(게시내용 이미지),
	// 	      3 -> 프로필 사진
	
	// 게시글 업로드
	public List<Map<String, Object>> parseInsertFileBoard(BoardDTO boardDTO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\uploadFile\\" +  boardDTO.getB_id() + "\\"; // 파일이 저장될 위치
		
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
				listMap.put("f_mark" , 1);
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
				listMap.put("f_mark", 3);
				list.add(listMap);
			}
		}
		return list;
	}
	
	// 첨부파일 수정
	public List<Map<String, Object>> parseUpdateFileInfo(BoardDTO boardDTO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{ 
		
		String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\uploadFile\\" + boardDTO.getB_id() + "\\";
		
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		int bno = boardDTO.getB_num();
		while(iterator.hasNext()){ 
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				listMap = new HashMap<String,Object>();
				listMap.put("f_del", "Y");
				listMap.put("f_boardNum", bno);
				listMap.put("f_oriName", originalFileName);
				listMap.put("f_modiName", storedFileName);
				listMap.put("f_size", multipartFile.getSize());
				listMap.put("f_mark" , 2);
				list.add(listMap);
			}
		}
		if(files != null && fileNames != null){
			for(int i = 0; i<fileNames.length; i++) {
					listMap = new HashMap<String,Object>();
                    listMap.put("f_del", "N");
					listMap.put("f_no", files[i]);
					new File(filePath + fileNames[i]).delete();
					list.add(listMap);
			}
		}
		return list;
	}
	
	// 게시글 삭제 시 첨부파일 전부 삭제
	public void parseDeleteFile(BoardDTO dto , List<Map<String, Object>> list) {
		String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\uploadFile\\" + dto.getB_id() + "\\";
		
		for(int i=0; i<list.size(); i++) {
			new File(filePath + list.get(i).get("F_MODINAME")).delete();
		}
	}
	
	// 게시글 이미지 등록하기
	public List<Map<String, Object>> parseInsertImageBoard(BoardDTO boardDTO, 
			MultipartHttpServletRequest mpRequest , 
			HttpServletRequest request , 
			HttpServletResponse response) throws Exception{
		
		String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\boardImage\\" +  boardDTO.getB_id() + "\\"; // 파일이 저장될 위치
		
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
				listMap.put("f_mark" , 1);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}