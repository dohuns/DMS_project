package com.KG.controller;

import java.io.BufferedInputStream;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemChkRegistServImpl;
import com.KG.service.member.MemChkIdServImpl;
import com.KG.service.member.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MemberRestController {

	
	MemberService memServ;
	
	@GetMapping(value = "overlapId" , produces = "application/json; charset=UTF-8")
	public String chk_id(String m_id, Model model) throws JsonProcessingException {
		
		model.addAttribute("m_id" , m_id);
		
		memServ = (MemChkIdServImpl)AC.ac.getBean("memChkIdServImpl");
		
		boolean flag = memServ.execute_Boo(model);
		
		if(flag) {
			return "true";
		}
		
		return "false";
	}
	
	
	@RequestMapping(value = "apitest" , produces = "application/text; charset=UTF-8")
	public String test() throws Exception {
		
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrl());
		JSONObject json =  (JSONObject) jsonobject.get("boxOfficeResult");
		JSONArray array = (JSONArray)json.get("dailyBoxOfficeList");
		
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(array);
		return strJson;
//		for(int i = 0 ; i < array.size(); i++){
//			
//			JSONObject entity = (JSONObject)array.get(i);
//			String movieNm = (String) entity.get("movieNm");
//			System.out.println("movieNm :" + movieNm);
//		}
		
	}

       
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
               while( (i = reader.read(b)) != -1){
                 buffer.append(new String(b, 0, i));
                 System.out.println("buffer : " + buffer.toString());
               }
               return buffer.toString();
           } finally {
               if (reader != null)
                   reader.close();
           }
       }
	 

	
	
}
