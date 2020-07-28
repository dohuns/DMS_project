package com.KG.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.dto.CommentDTO;
import com.KG.dto.PhotoVo;
import com.KG.service.board.BoardDeleteServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.comment.CommentDeleteServImpl;
import com.KG.service.comment.CommentService;

@RestController
public class BoardRestController {
	BoardService boaServ;
	CommentService comServ;

//	내 작성글 삭제
	@RequestMapping(value = "myWriteDelete", produces = "application/json;charset=utf-8")
	public void myWriteDelete(Model model,BoardDTO dto) {
		model.addAttribute("dto",dto);
		boaServ = (BoardDeleteServImpl) AC.ac.getBean("boardDeleteServImpl");
		boaServ.execute_Boo(model);
	}

//	내 댓글 삭제
	@RequestMapping(value = "myComDelete", produces = "application/json;charset=utf-8")
	public void myComDelete(Model model,CommentDTO dto) {
		model.addAttribute("dto",dto);
		comServ = (CommentDeleteServImpl) AC.ac.getBean("commentDeleteServImpl");
		comServ.execute_int(model);
	}

	// 다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {

		try {

			// 파일정보

			String sFileInfo = "";

			// 파일명을 받는다 - 일반 원본파일명

			String filename = request.getHeader("file-name");
			System.out.println("getHeader : " + filename);

			// 파일 확장자

			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);

			// 확장자를소문자로 변경

			filename_ext = filename_ext.toLowerCase();

			// 파일 기본경로

			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			System.out.println("파일 기본경로 : " + dftFilePath);

			// 파일 기본경로 _ 상세경로

			String filePath = "C:\\spring\\DMS_project\\final_project\\src\\main\\webapp\\resources\\boardImage\\";
			System.out.println("파일 상세경로 : " + filePath);
			

			File file = new File(filePath);

			if (!file.exists()) {
				file.mkdirs();
			}

			String realFileNm = "";

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			String today = formatter.format(new java.util.Date());

			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));

			String rlFileNm = filePath + realFileNm;
			System.out.println("rlFilename : " + rlFileNm);
			System.out.println("나머지 : " + realFileNm);

			///////////////// 서버에 파일쓰기 /////////////////

			InputStream is = request.getInputStream();

			OutputStream os = new FileOutputStream(rlFileNm);

			int numRead;

			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

			while ((numRead = is.read(b, 0, b.length)) != -1) {

				os.write(b, 0, numRead);

			}

			if (is != null) {

				is.close();

			}

			os.flush();

			os.close();

			///////////////// 서버에 파일쓰기 /////////////////

			// 정보 출력

			sFileInfo += "&bNewLine=true";

			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함

			sFileInfo += "&sFileName=" + filename;

			sFileInfo += "&sFileURL=" + "/img/boardImage/" + realFileNm;

			PrintWriter print = response.getWriter();

			print.print(sFileInfo);

			print.flush();

			print.close();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

}
