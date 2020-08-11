package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class LikeMemberListServImpl implements BoardService{

	
	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {

		return false;
	}

	@Override
	public String execute_Str(Model model) {
		try {

			Map<String, Object>map = model.asMap();
			int b_num = (Integer)map.get("b_num");
		
			for(Map<String, Object> map2 : dao.likeMemberList(b_num)) {
				System.out.println(map2.get("L_DIVLIKE"));
			}
			
			ObjectMapper mapper = new ObjectMapper();
			
			return mapper.writeValueAsString(dao.likeMemberList(b_num));
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
