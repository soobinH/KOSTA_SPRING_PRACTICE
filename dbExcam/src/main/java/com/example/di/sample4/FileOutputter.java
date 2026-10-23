package com.example.di.sample4;

import java.io.FileWriter;

public class FileOutputter implements Outputter {
	private String filePath;
	
	
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	@Override
	public void output(String message) throws Exception {
		FileWriter writer = new FileWriter(filePath);
		writer.write(message);
		writer.close();

	}

}
