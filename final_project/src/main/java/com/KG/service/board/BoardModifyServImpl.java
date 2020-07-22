package com.KG.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;

@Service
public class BoardModifyServImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		int num = (Integer)map.get("num");
		
		model.addAttribute("boardList" , dao.showBoard(num));
		model.addAttribute("articleAll" , dao.getArticle());
		
		//업로드 파일 리스트
		List<Map<String, Object>> fileList = dao.selectFileList(num);
		System.out.println("ser : " + fileList.get(0).get("F_ORINAME"));
		model.addAttribute("fileList" , fileList);
		
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
