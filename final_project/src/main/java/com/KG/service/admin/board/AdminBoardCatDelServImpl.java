package com.KG.service.admin.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dao.AdminSidebarDAO;
import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
@Service
public class AdminBoardCatDelServImpl implements AdminBoardService {

	@Autowired
	AdminSidebarDAO admDAO;
	
	@Override
	public void adminList(Model model) {
		
	}

	@Override
	public boolean execute_Boo(Model model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		admDAO.delcategory(boardDTO);
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

}
