package com.dm.app.datatopic.cunzhuangguhua.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunzhuangguhua.model.CountryPic;
import com.dm.app.datatopic.cunzhuangguhua.service.CountryPicService;
import com.dm.platform.util.ResponseUtil;

@Controller
@RequestMapping("portal/czghpic")
public class CountryPicController {
	
	@Autowired
	private CountryPicService countryPicService;
	@Value("${cunzhuangguihuapic.webfiledir}")
	private String fileDir;
	@Value("${cunzhuangguihuapic.scale}")
	private float scale;
	static String sep = File.separator;
	
	@RequestMapping("bycode")
	@ResponseBody
	public Object findByCode(String code){
		List<CountryPic> list = this.countryPicService.findListByCunCode(code);
		return ResponseUtil.success(list);
	}
	@RequestMapping("byname")
	@ResponseBody
	public Object findByName(String name){
		List<CountryPic> list = this.countryPicService.findListByCunName(name);
		return ResponseUtil.success(list);
	}
	@RequestMapping("/{imageId}.sjpg")
	public void findById(@PathVariable Integer imageId,HttpServletRequest request,HttpServletResponse response){
		CountryPic pic  = this.countryPicService.findById(imageId);
		ServletOutputStream os = null;
		try {
			os = response.getOutputStream();
		String path = getImgePath(pic,request);
		Thumbnails.of(path)   
        	.scale(scale).toOutputStream(os);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				os.flush();
				os.close();
			}catch(Exception e1){
				e1.printStackTrace();
			}
		}
	}
	
	
	private String getImgePath(CountryPic pic, HttpServletRequest request) {
		String countryId = pic.getCountryId();
		String path = request.getRealPath("/");
		String dir = File.separator+ countryId.substring(0,6)+File.separator+countryId.substring(0,9)+File.separator+countryId+File.separator;
		path = path +".."+ File.separator  + fileDir + dir + pic.getShortName();
		return path;
	}
	
	
	
	@RequestMapping("image/active/auto")
	public void active(String[] args) {
		String source="/var/taiji/tomcat7_cms/webapps/resource/countryPic/Layout" ;
		String result="/var/taiji/tomcat7_cms/webapps/resource/countryPic/02";
		if(args==null|| args.length==0){
			
		}else{
		 source = args[0];
		 result = args[1];
		}
		
		File sourceFile = new File(source);
		runimg(sourceFile,result);
	}

	private void runimg(File source, String result) {
		if(source.isDirectory()){
			File resultFile = new File(result);
			if(!resultFile.exists()){
				resultFile.mkdir();
			}
			File[] cfiles = source.listFiles();
			for(int i=0;i<cfiles.length;i++){
				try{
					runimg(cfiles[i],result+sep+cfiles[i].getName());
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}else if(source.isFile()){
			File resultFile = new File(result);
			if(!resultFile.exists()){
				try {
					resultFile.createNewFile();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			String fileName = source.getName();
			if(fileName.endsWith(".jpg")||fileName.endsWith(".png")){
				try {
					Thumbnails.of(source).scale(scale).toFile(resultFile);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(result);
			}else{
				try {
					forChannel(source,resultFile);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
	public long forChannel(File f1,File f2) throws Exception{
        long time=new Date().getTime();
        int length=2097152;
        FileInputStream in=new FileInputStream(f1);
        FileOutputStream out=new FileOutputStream(f2);
        FileChannel inC=in.getChannel();
        FileChannel outC=out.getChannel();
        ByteBuffer b=null;
        while(true){
            if(inC.position()==inC.size()){
                inC.close();
                outC.close();
                return new Date().getTime()-time;
            }
            if((inC.size()-inC.position())<length){
                length=(int)(inC.size()-inC.position());
            }else
                length=2097152;
            b=ByteBuffer.allocateDirect(length);
            inC.read(b);
            b.flip();
            outC.write(b);
            outC.force(false);
        }
    }
}
