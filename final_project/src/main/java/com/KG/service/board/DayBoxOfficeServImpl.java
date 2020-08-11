package com.KG.service.board;

import java.io.BufferedInputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class DayBoxOfficeServImpl implements BoardService{

	
	private static String readUrl() throws Exception {
		BufferedInputStream reader = null;
		
		try {
			
			Date bdate = new Date(new Date().getTime() - (1000*60*60*24-1));
			String today = new SimpleDateFormat("yyyyMMdd").format(bdate);
			System.out.println("어제 : " + today);
			URL url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchDailyBoxOfficeList.json" 
					+ "?key=a0063402c67e8984aba680399775818a"
					+ "&targetDt=" + today);
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while( (i = reader.read(b)) != -1 ) {
				buffer.append(new String(b , 0 , i));
			}
			return buffer.toString();
		}finally {
			if(reader != null)
				reader.close();
		}
	}
	
	@Override
	public boolean execute_Boo(Model model) {
		// TODO Auto-generated method stub
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
			System.out.println(strJson);
			return strJson;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

}
