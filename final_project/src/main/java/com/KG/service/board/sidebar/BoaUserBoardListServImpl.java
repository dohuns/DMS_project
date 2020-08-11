package com.KG.service.board.sidebar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoaUserBoardListServImpl implements BoardSidebarService {

	@Autowired
	BoardDAO boardDAO;

//	내가 쓴 게시글 리스트 출력
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		String b_id = (String) map.get("id");
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		
		// artiNum 불러오기
		int artiNum = boardDTO.getArtiNum();

		// hashmap으로 데이터 넣기
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", 15 * artiNum + 1);
		hash.put("end", 15 * artiNum + 15);
		hash.put("b_id", b_id);

		model.addAttribute("myList", boardDAO.userBoardList(hash));

		// 게시판 리스트 + 게시판 글 개수
		int count = boardDAO.userBoardListCount(b_id);
		if (count % 15 == 0) {
			model.addAttribute("count", count / 15);
		} else {
			model.addAttribute("count", count / 15 + 1);
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

	@Override
	public List<BoardDTO> execute_List(Model model) {
		return null;
	}

}
