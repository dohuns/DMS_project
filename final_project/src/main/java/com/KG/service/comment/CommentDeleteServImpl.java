package com.KG.service.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CommentDAO;
import com.KG.dto.CommentDTO;

@Service
public class CommentDeleteServImpl implements CommentService{

	@Autowired
	CommentDAO dao;
	
	@Override
	public boolean execute(Model model) {
		
		
		Map<String, Object> map = model.asMap();
		int comNum = (Integer)map.get("comNum");
		
		
		dao.commentDelete(comNum);
		
		return false;
	}

	@Override
	public List<CommentDTO> execute_list(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
