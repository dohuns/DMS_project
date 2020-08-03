package com.KG.service.comment;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CommentDAO;
import com.KG.dto.CommentDTO;

@Service
public class CommentListServImpl implements CommentService{

	@Autowired
	CommentDAO dao;

	@Override
	public boolean execute(Model model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> execute_list(Model model) {
		
		Map<String, Object> map = model.asMap();
		CommentDTO dto = (CommentDTO)map.get("dto");
		List<Map<String, Object>> list =  dao.commentList(dto);
		
		for(Map<String, Object> map2 : list) {
			dto.setC_date((Timestamp)map2.get("C_DATE"));
			map2.put("C_DATE", dto.getC_date());
		}
		return list;
	}

	@Override
	public int execute_int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
