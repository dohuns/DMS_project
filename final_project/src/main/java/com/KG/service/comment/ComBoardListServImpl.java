package com.KG.service.comment;

import java.util.ArrayList;
import java.util.HashMap;
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

//	댓글단 게시글 검색
	@Override
	public boolean execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession) map.get("session");
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		String c_id = (String) session.getAttribute("m_id");
		ArrayList<BoardDTO> myComBoardList = new ArrayList<BoardDTO>();

		// artiNum 불러오기
		int artiNum = boardDTO.getArtiNum();
		int count = 0;

		// hashmap으로 데이터 넣기
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", 15 * artiNum + 1);
		hash.put("end", 15 * artiNum + 15);
		hash.put("c_id", c_id);

		List<CommentDTO> ComBoardNum = dao.selectComBoardNum(hash);

		for (int i = 0; i < dao.selectComBoardNum(hash).size(); i++) {
			count += 1;
			myComBoardList.add(dao.selectBoardNumList(ComBoardNum.get(i).getC_boardNum()));
		}
		model.addAttribute("myComBoardList", myComBoardList);

		// 게시판 리스트 + 게시판 글 개수
		if (count % 15 == 0) {
			model.addAttribute("count", count / 15);
		} else {
			model.addAttribute("count", count / 15 + 1);
		}
		return false;

	}

	@Override
	public List<Map<String, Object>> execute_list(Model model) {
		return null;
	}

	@Override
	public int execute_int(Model model) {
		return 0;
	}

}
