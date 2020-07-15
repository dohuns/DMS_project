package com.KG.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoaListServImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		
		
		// artiNum 불러오기
		int artiNum = boardDTO.getArtiNum();
		
		// hashmap으로 데이터 넣기
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", 15*artiNum+1);
		hash.put("end", 15*artiNum+15);
		hash.put("article" , boardDTO.getB_article());
		hash.put("category", boardDTO.getB_category());
		
		// 전체 글 보기 + 전체 글 개수
		List<BoardDTO> listAll = boardDAO.listAll(hash);
		int countAll = boardDAO.getCountAll();
		model.addAttribute("listAll" , listAll);
		
		if(countAll%15 == 0) {
			model.addAttribute("countAll" , countAll/15);
		} else {
			model.addAttribute("countAll" , countAll/15+1);
		}
		
		// 게시판 리스트 + 게시판 글 개수
		List<BoardDTO> list = boardDAO.list(hash);
		int count = boardDAO.getCount(boardDTO);
		System.out.println("count : " + count);
		
		model.addAttribute("list" , list);
		
		if(count%15 == 0) {
			model.addAttribute("count" , count/15);
		} else {
			model.addAttribute("count" , count/15+1);
		}
		
		return false;
	}

//	사이드바 리스트 출력
	@Override
	public String execute_Str(Model model) {
		model.addAttribute("boardCate", boardDAO.categoryList());
		model.addAttribute("boardArt", boardDAO.articleList());
		return "성공";
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

}
