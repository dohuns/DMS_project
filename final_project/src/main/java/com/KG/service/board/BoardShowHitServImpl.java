package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dao.MemberDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoardShowHitServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		int b_num = (Integer)map.get("b_num");
		boardDAO.hitUp(b_num);
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
