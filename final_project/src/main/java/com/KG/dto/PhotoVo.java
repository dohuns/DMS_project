package com.KG.dto;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVo {
	private MultipartFile uploadInputBox;
	private String callback;
	private String callback_func;

	public MultipartFile getUploadInputBox() {
		return uploadInputBox;
	}

	public void setUploadInputBox(MultipartFile uploadInputBox) {
		this.uploadInputBox = uploadInputBox;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

}
