package com.kosta.board.service;

import java.io.OutputStream;

public interface CommonService {
	void imageView(String path, String fileName, OutputStream out) throws Exception;
}
