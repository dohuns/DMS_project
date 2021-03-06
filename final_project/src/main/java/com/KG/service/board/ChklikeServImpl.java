package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.LikeDTO;

@Service
public class ChklikeServImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		LikeDTO dto = (LikeDTO) map.get("dto");
		
		String chkLike = dao.getLike(dto);
		
		return chkLike;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
