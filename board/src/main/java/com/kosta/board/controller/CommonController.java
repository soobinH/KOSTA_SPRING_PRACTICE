package com.kosta.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommonController {
	
	@Autowired
	private ServletContext servletContext;

    // 이미지 보여주기
    @GetMapping("/image")
    public void imageView(@RequestParam("filename") String filename, HttpServletResponse response) {
        try {
            final String IUPLOAD = servletContext.getInitParameter("iupload");
            File file = new File(IUPLOAD, filename);
            if (file.exists()) {
                // 파일 종류에 맞게 이미지 타입 설정 (image/png, image/jpeg 등)
                response.setContentType(servletContext.getMimeType(file.getName()));
                FileInputStream fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, response.getOutputStream());
            } else {
                response.sendError(404);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 파일 다운로드
    @GetMapping("/fileDown")
    public void fileDown(@RequestParam("filename") String filename, HttpServletResponse response) {
        try {
            final String DUPLOAD = servletContext.getInitParameter("dupload");
            File file = new File(DUPLOAD, filename);
            if (file.exists()) {
                String encoded = URLEncoder.encode(filename, "UTF-8").replace("+", "%20");
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + encoded + "\"");
                FileInputStream fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, response.getOutputStream());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	

}
