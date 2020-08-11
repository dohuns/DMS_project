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
public class BoardReplySaveServImpl implements BoardService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	BoardDAO dao;

	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		BoardDTO dto = (BoardDTO) map.get("dto");
		HttpSession session = (HttpSession)map.get("session");
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)map.get("mpRequest");
		
		BoardDTO getDTO = dao.showBoard(dto.getB_num());
		
		dto.setB_id((String)session.getAttribute("m_id"));
		dto.setB_nick((String)session.getAttribute("m_nick"));
		dto.setB_reNum(getDTO.getB_reNum());
		dto.setB_sortNum(getDTO.getB_sortNum());
		
		dao.replySave(dto);
		
		// 첨부파일 등록
		try {
			List<Map<String,Object>> list = fileUtils.parseInsertFileBoard(dto, mpRequest);
			int size = list.size();
			for(int i=0; i<size; i++){ 
				dao.insertFile(list.get(i));
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

