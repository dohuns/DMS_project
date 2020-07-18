package com.KG.service.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.service.board.BoardService;

@Service
public class AdminNoticeServImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("dto");
		int pageNum = boardDTO.getArtiNum();

		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", pageNum * 15 + 1);
		hash.put("end", pageNum * 15 + 15);
		hash.put("article", boardDTO.getB_article());
		hash.put("category", boardDTO.getB_category());

		List<BoardDTO> list = boardDAO.list(hash);
		int noticeCount = boardDAO.getCount(boardDTO);
		model.addAttribute("noticeList", list);
		model.addAttribute("totalNum", (noticeCount % 15 == 0 ? noticeCount / 15 : noticeCount / 15 + 1));
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
