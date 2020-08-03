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
		
		
		try {
			List<Map<String,Object>> list = fileUtils.parseInsertFileMember(memberDTO, request);
			int size = list.size();
			for(int i=0; i<size; i++){ 
				memberDAO.insertFile(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		memberDTO.setM_picture(memberDAO.getPicture(memberDTO.getM_id()));
		System.out.println(memberDTO.getM_picture());
		if (memberDTO.getM_picture() == null) {
			memberDTO.setM_picture("");
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
