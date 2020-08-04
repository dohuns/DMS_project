package com.KG.service.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SearchMovieServImpl implements BoardService{
	
	 private String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }

	    private HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }

	    private String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	

	@Override
	public boolean execute_Boo(Model model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		
		Map<String, Object> map = model.asMap();
		String movieNm = (String)map.get("movieNm");
		
		String clientId = "QE3Qv8oLgfKhVV6UDpzM"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "ToLynbNGdn"; //애플리케이션 클라이언트 시크릿값"

        String text = movieNm;
        try {
            text = URLEncoder.encode(text, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&display=1&sort=date";    // json 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
		JSONParser jsonparser = new JSONParser();
		try {
			JSONObject jsonobject = (JSONObject)jsonparser.parse(responseBody);
			JSONArray json = (JSONArray)jsonobject.get("items");
//			for(int i=0; i<1; i++) {
//				JSONObject movieList = (JSONObject)json.get(i);
//			}
			
			ObjectMapper mapper = new ObjectMapper();
			
			String strJson = mapper.writeValueAsString(json);
			
			return strJson;
		} catch (Exception e) {
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
