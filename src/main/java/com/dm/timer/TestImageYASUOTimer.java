package com.dm.timer;

import java.io.FileOutputStream;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class TestImageYASUOTimer{

	//test
    public void run() throws IOException{
    	//scale(比例) 
    	long start = System.currentTimeMillis();
    	FileOutputStream o = new FileOutputStream("C:\\Users\\Mr.Jin\\Desktop\\38469172_1.jpg");
    	Thumbnails.of("C:\\Users\\Mr.Jin\\Desktop\\38469172.jpg")   
    	        .scale(0.25f).toOutputStream(o);  
    	       // .toFile("C:\\Users\\Mr.Jin\\Desktop\\38469172_1.jpg");  
    	long end = System.currentTimeMillis();
    	System.out.println(start-end);
    	
    }

public static void main(String[] args) throws IOException {
	new TestImageYASUOTimer().run();;
}
    
}