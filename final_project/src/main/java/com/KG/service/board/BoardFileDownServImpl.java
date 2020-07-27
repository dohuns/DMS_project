package com.KG.service.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;

@Service
public class BoardFileDownServImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		int f_no = (Integer)map.get("f_no");
		
		Map<String, Object> resultMap =  dao.selectFileInfo(f_no);
		String f_oriName = (String)resultMap.get("F_ORINAME");
		String f_modiName = (String)resultMap.get("F_MODINAME");
		
		try {
			byte[] fileByte = FileUtils.readFileToByteArray(
				new File("C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\uploadFile\\" + f_modiName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(f_oriName , "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
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
