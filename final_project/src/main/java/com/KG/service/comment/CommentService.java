package com.KG.service.comment;

import java.util.List;

import org.springframework.ui.Model;

import com.KG.dto.CommentDTO;

public interface CommentService {
	
	public boolean execute(Model model);
	
	public List<CommentDTO> execute_list(Model model);

}
