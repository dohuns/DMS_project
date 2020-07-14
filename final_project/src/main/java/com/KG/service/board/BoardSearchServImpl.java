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
public class BoardSearchServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		String b_search = (String)map.get("b_search");
		String b_content = (String)map.get("b_content");
		
		BoardDTO dto = (BoardDTO)map.get("dto");
		int artiNum = dto.getArtiNum();
		
		// betweewn안에 넣을 시작 끝값 넣기
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", 15*artiNum+1);
		hash.put("end", 15*artiNum+15);
		hash.put("b_content", b_content);
		hash.put("b_category" , dto.getB_category());
		hash.put("b_article", dto.getB_article());
		
		
		System.out.println("ser article : " + dto.getB_article());
		if(b_search.equals("titleNcontent")) { // 제목 + 내용
			model.addAttribute("b_search" , "제목 + 내용");
			// 게시판 글 
			if(dto.getB_article() != null) {
				model.addAttribute("searchList", boardDAO.TCsearch(hash));
				int count = boardDAO.TCsearchCount(hash);
				if(count%15 == 0) {
					model.addAttribute("count", count/15);
				} else {
					model.addAttribute("count", count/15+1);
				}
			// 전체 글
			} else {
				model.addAttribute("searchListAll", boardDAO.TCsearchAll(hash));
				int countAll = boardDAO.TCsearchCountAll(b_content);
				if(countAll%15 == 0) {
					model.addAttribute("countAll", countAll/15);
				} else {
					model.addAttribute("countAll", countAll/15+1);
				}
			}
		} else if (b_search.equals("title")) { // 제목
			model.addAttribute("b_search" , "제목");
			// 게시판 글 
			if(dto.getB_article() != null) {
				model.addAttribute("searchList", boardDAO.Tsearch(hash));
				int count = boardDAO.TsearchCount(hash);
				if(count%15 == 0) {
					model.addAttribute("count", count/15);
				} else {
					model.addAttribute("count", count/15+1);
				}
				// 전체 글
			} else {
				model.addAttribute("searchListAll", boardDAO.TsearchAll(hash));
				int countAll = boardDAO.TsearchCountAll(b_content);
				if(countAll%15 == 0) {
					model.addAttribute("countAll", countAll/15);
				} else {
					model.addAttribute("countAll", countAll/15+1);
				}
			}
			
		} else { // 작성자
			model.addAttribute("b_search" , "작성자");
			
			// 게시판 글 
			if(dto.getB_article() != null) {
				model.addAttribute("searchList", boardDAO.Wsearch(hash));
				int count = boardDAO.WsearchCount(hash);
				if(count%15 == 0) {
					model.addAttribute("count", count/15);
				} else {
					model.addAttribute("count", count/15+1);
				}
			// 전체 글
			} else {
				model.addAttribute("searchListAll", boardDAO.WsearchAll(hash));
				int countAll = boardDAO.WsearchCountAll(b_content);
				if(countAll%15 == 0) {
					model.addAttribute("countAll", countAll/15);
				} else {
					model.addAttribute("countAll", countAll/15+1);
				}
			}
		}
		
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
