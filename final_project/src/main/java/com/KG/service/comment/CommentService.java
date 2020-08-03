package com.KG.service.comment;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface CommentService {
	
	public boolean execute(Model model);
	
	public List<Map<String, Object>> execute_list(Model model);
	
	public int execute_int(Model model);

}
