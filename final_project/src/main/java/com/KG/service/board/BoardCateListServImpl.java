package com.KG.service.board;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BoardCateListServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	private static String readUrl() throws Exception {
		BufferedInputStream reader = null;
		
		try {
			URL url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchDailyBoxOfficeList.json" 
					+ "?key=a0063402c67e8984aba680399775818a"
					+ "&targetDt=20150101");
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while( (i = reader.read(b)) != -1 ) {
				buffer.append(new String(b , 0 , i));
				System.out.println("buffer : " + buffer.toString());
			}
			return buffer.toString();
		}finally {
			if(reader != null)
				reader.close();
		}
	}
	
	
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("boardDTO");
		
		
		model.addAttribute("cate" , boardDAO.cateList(dto));
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject;
		try {
			jsonobject = (JSONObject) jsonparser.parse(readUrl());
			JSONObject json = (JSONObject) jsonobject.get("boxOfficeResult");
			JSONArray array = (JSONArray)json.get("dailyBoxOfficeList");
			
			ObjectMapper mapper = new ObjectMapper();
			String strJson = mapper.writeValueAsString(array);
			
			model.addAttribute("list" , strJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "";
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}
	
	
	
	

}
