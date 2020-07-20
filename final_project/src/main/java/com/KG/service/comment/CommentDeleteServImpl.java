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
		CommentDTO dto = (CommentDTO)map.get("dto");
		
		System.out.println("con com : " + dto.getC_comNum());
		System.out.println("con bor : " + dto.getC_boardNum());
		
		dao.commentDelete(dto.getC_comNum());
		dao.downComCount(dto.getC_boardNum());
		return false;
	}

	@Override
	public List<CommentDTO> execute_list(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_int(Model model) {
		Map<String, Object> map = model.asMap();
		CommentDTO dto = (CommentDTO)map.get("dto");
		int c_boardNum = dao.selectBoardNum(dto.getC_comNum()).getC_boardNum();
		dao.commentDelete(dto.getC_comNum());
		dao.downComCount(c_boardNum);
		return 0;
	}
	
	

}
