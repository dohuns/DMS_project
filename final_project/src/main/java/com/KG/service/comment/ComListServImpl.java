package com.KG.service.comment;

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
public class ComListServImpl implements CommentService {

	@Autowired
	CommentDAO dao;

//	내가 쓴 댓글 목록
	@Override
	public boolean execute(Model model) {
		Map<String, Object> map = model.asMap();
		String c_id = (String) map.get("id");
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");

		// artiNum 불러오기
		int artiNum = boardDTO.getArtiNum();

		// hashmap으로 데이터 넣기
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", 15 * artiNum + 1);
		hash.put("end", 15 * artiNum + 15);
		hash.put("c_id", c_id);
		model.addAttribute("myComList", dao.selectId(hash));

		// 게시판 리스트 + 게시판 글 개수
		int count = dao.selectIdConut(c_id);
		if (count % 15 == 0) {
			model.addAttribute("count", count / 15);
		} else {
			model.addAttribute("count", count / 15 + 1);
		}

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
