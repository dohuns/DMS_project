package com.KG.service.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;
import com.KG.upload.FileUtils;

@Service
public class MemMyPageUpServImpl implements MemberService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		
		MemberDTO memberDTO = (MemberDTO)map.get("memberDTO");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		memberDTO.setM_picture(memberDAO.getPicture(memberDTO.getM_id()));
		
		try {
			List<Map<String,Object>> list = fileUtils.parseUpdateImageMember(memberDTO, request);
			int size = list.size();
			for(int i=0; i<size; i++){ 
				memberDAO.updateImage(list.get(i));
				memberDTO.setM_picture((String) list.get(i).get("f_modiName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		memberDAO.memberUp(memberDTO);
		
		
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
