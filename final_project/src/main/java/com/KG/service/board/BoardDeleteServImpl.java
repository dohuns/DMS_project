package com.KG.service.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.upload.FileUtils;

@Service
public class BoardDeleteServImpl implements BoardService{

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	BoardDAO dao;

	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO)map.get("dto");
		HttpSession session = (HttpSession)map.get("session");
		dto.setB_id((String) session.getAttribute("m_id"));
		
		List<Map<String, Object>> list = dao.selectFileList(dto.getB_num());
		fileUtils.parseDeleteFile(dto, list);
		dao.allFileDel(dto);
		dao.deleteBoard(dto); 
		dao.deleteComment(dto);
		
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
