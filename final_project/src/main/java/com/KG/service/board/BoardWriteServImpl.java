package com.KG.service.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.upload.FileUtils;
@Service
public class BoardWriteServImpl implements BoardService{

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	BoardDAO boardDAO;
	

	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("dto");
		HttpSession session = (HttpSession)map.get("session");
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)map.get("mpRequest");
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		boardDTO.setB_nick((String)session.getAttribute("m_nick"));
		boardDTO.setB_id((String)session.getAttribute("m_id"));
		
		boardDAO.boardWrite(boardDTO);
		
		// 첨부파일 등록
		try {
			List<Map<String,Object>> list = fileUtils.parseInsertFileBoard(boardDTO, mpRequest);
			int size = list.size();
			for(int i=0; i<size; i++){ 
				boardDAO.insertFile(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 이미지 등록하기
		
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}
	
	

}
