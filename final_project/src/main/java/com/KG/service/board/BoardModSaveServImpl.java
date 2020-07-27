package com.KG.service.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.upload.FileUtils;

@Service
public class BoardModSaveServImpl implements BoardService{

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("dto");
		String[] files = (String[]) map.get("files");
		String[] fileNames = (String[]) map.get("fileNames");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		HttpSession session = (HttpSession)map.get("session");
		
		dto.setB_id((String)session.getAttribute("m_id"));
		
		dao.modifyBoard(dto);
		
		// 파일들 업로드 
		try {
			List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(dto, files, fileNames, request);
			Map<String, Object> tempMap = null;
			
			for(int i=0; i<list.size(); i++) {
				tempMap = list.get(i);
				if(tempMap.get("f_del").equals("Y")) {
					dao.insertFile(tempMap);
				} else {
					dao.deleteFile(tempMap);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	} 

	
}
