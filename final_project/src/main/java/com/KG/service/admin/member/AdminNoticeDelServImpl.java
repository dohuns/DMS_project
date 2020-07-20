package com.KG.service.admin.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.service.board.BoardService;

@Service
public class AdminNoticeDelServImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();

		BoardDTO dto = new BoardDTO();
		dto.setB_num((Integer)map.get("b_num"));
		boardDAO.deleteBoard(dto);
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
