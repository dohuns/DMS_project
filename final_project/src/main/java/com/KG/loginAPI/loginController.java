package com.KG.loginAPI;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.KG.dao.MemberDAO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class loginController {

	@Autowired
	overlapEmail over;
	@Autowired
	autoLogin auto;
	
	
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	};
	
    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView login(HttpSession session , 
    		@RequestParam(required = false) String m_id , Model model) {
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        System.out.println("id : " + m_id);
		if(m_id != null) {
			model.addAttribute("login" , "fail");
		}
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("login/login", "url", naverAuthUrl);
    }

    
	@RequestMapping(value = "login/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws IOException, ParseException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		// String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		// 데이터 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		// response의 nickname값 파싱
		String email = (String)response_obj.get("email");
		
		// 파싱 닉네임 세션으로 저장
		model.addAttribute("result" , apiResult);
		
		model.addAttribute("email" , email);

		if(over.execute(model)) {
			return "member/regist";
		}
		return "redirect:/login/autoLogin?e_mail="+email;
	}
	
	////////////////////////////////// 구글 ///////////////////////////////
	@RequestMapping("login/googleCallback")
	public String googleLogin(@RequestParam(required = false) String email , Model model ) throws UnsupportedEncodingException {
		
		model.addAttribute("email" , email);
		if(over.execute(model)) {
			return "member/regist";
		}
		return "redirect:/login/autoLogin?e_mail="+email;
	}
	
	/////////////////////////////// 가입되어 있으면 자동 로그인 ////////////////////////////
	@RequestMapping("/login/autoLogin")
	public String autoLogin(Model model, @RequestParam("e_mail") String email, HttpSession session) {
		
		model.addAttribute("email" , email);
		model.addAttribute("session" , session);
		
		auto.execute(model);
		
		return "redirect:/";
	}
}
