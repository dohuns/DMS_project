package com.KG.service.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.BoardDTO;
@Service
public class AdminBoardCatChkServImpl implements AdminService {

	@Autowired
	AdminDAO admDAO;
	
	@Override
	public void adminList(Model model) {
		
	}

	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		try {
			if (admDAO.chkcategory(boardDTO) == null) {
				return true;
			}
		} catch (Exception e) {
		}
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
