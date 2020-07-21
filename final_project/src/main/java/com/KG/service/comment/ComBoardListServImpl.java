package com.KG.service.comment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CommentDAO;
import com.KG.dto.BoardDTO;
import com.KG.dto.CommentDTO;

@Service
public class ComBoardListServImpl implements CommentService {

	@Autowired
	CommentDAO dao;

	@Override
	public boolean execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession) map.get("session");
		String c_id = (String) session.getAttribute("m_id");
		ArrayList<BoardDTO> myComBoardList = new ArrayList<BoardDTO>();

		List<CommentDTO> ComBoardNum = dao.selectComBoardNum(c_id);

		for (int i = 0; i < dao.selectComBoardNum(c_id).size(); i++) {
			myComBoardList.add(dao.selectBoardNumList(ComBoardNum.get(i).getC_boardNum()));
		}
		model.addAttribute("myComBoardList", myComBoardList);
		return false;
	}

	@Override
	public List<CommentDTO> execute_list(Model model) {
		return null;
	}

	@Override
	public int execute_int(Model model) {
		return 0;
	}

}
