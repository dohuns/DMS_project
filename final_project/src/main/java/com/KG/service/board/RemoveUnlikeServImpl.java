package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.LikeDTO;

@Service
public class RemoveUnlikeServImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		
		Map<String, Object>map = model.asMap();
		
		LikeDTO dto = (LikeDTO)map.get("dto");
		
		dao.deleteUnlike(dto);
		
		int count = dao.unlikeCount(dto.getL_boardNum());
		
		return count;
	}

	
}
