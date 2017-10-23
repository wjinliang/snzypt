package com.dm.app.util.export;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;

 


public class Export {
	
	 
	    // 创建excel文件函数
	    // src为待保存的文件路径,json为待保存的json数据
	    public  static  File createExcel( JSONArray json,String talbeName) {
	    	File file = null;
	        try {
	            // 新建文件
	            file =new File("/"+talbeName+".xls");
	           if(!file.exists()){
	        	   file.createNewFile();
	           }
	            OutputStream outputStream = new FileOutputStream(file);// 创建工作薄
	            WritableWorkbook writableWorkbook = Workbook.createWorkbook(outputStream);
	          
	            Label label; // 单元格对象
	           
	            int maxColumn=20000;
	            int sheetNum=json.size()%maxColumn==0?json.size()/maxColumn:json.size()/maxColumn+1;
	            for(int j=0;j<sheetNum;j++){
	            	 int column = 0; // 列数计数
	            	  WritableSheet sheet = writableWorkbook.createSheet("列表" + (j + 1), j);// 创建新的一页	
	            	  int num=j*maxColumn;
	            	  int index=0;
	            	 JSONObject first = json.getJSONObject(0);
	 	            Iterator<String> iterator = first.keys(); // 得到第一项的key集合
	 	            List<String> keys  = new ArrayList<String>();
	 	            while (iterator.hasNext()) { // 遍历key集合
	 	                String key = (String) iterator.next(); // 得到key
	 	                if(key.equals("_id")){
	 	                	continue;
	 	                }else if(key.equals("exchange_time")){
	 	                	continue;
	 	                }else if(key.equals("XZC_CODE")){
	 	                	continue;
	 	                }else if(key.equals("doflag")){
	 	                	continue;
	 	                }else if(key.equals("SHAPE")){
	 	                	continue;
	 	                }
	 	                label = new Label(column++, 0, key); // 第一个参数是单元格所在列,第二个参数是单元格所在行,第三个参数是值
	 	              	keys.add(key);
	 	                sheet.addCell(label); // 将单元格加到页
	 	            }
	 	          
	 	            // 遍历jsonArray
	 	            for (int i = num; i < json.size(); i++) {
	 	            	if(index==maxColumn){
	 	            		 break;
	 	            	}
	 	                JSONObject item = json.getJSONObject(i); // 得到数组的每项
	 	                column = 0;// 从第0列开始放
	 	               for(int k=0;k<keys.size();k++){
	 	            	   String value=null;
	 	            	   try{
	 	            		   value = item.getString(keys.get(k)); // 得到key对应的value
	 	            	   }catch(Exception e){
	 	            		   System.out.println(e.getMessage());
	 	            	   }
	 	                    label = new Label(column++, (index+ 1), value); // 第一个参数是单元格所在列,第二个参数是单元格所在行,第三个参数是值
	 	                    sheet.addCell(label); // 将单元格加到页
	 	                 }
	 	               index++;
	 	                
	 	            }
	 	          
	            }
	           
	            writableWorkbook.write(); // 加入到文件中
	            writableWorkbook.close(); // 关闭文件，释放资源
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return file;
	    }


	    public  static  File createExcel1(List <Map<String,String>>list,String fileName) {
	    	File file = null;
		try {
			// 新建文件
			 file = new File(fileName);
			if (!file.exists()) {
				file.createNewFile();
			}
			OutputStream outputStream = new FileOutputStream(file);// 创建工作薄
			WritableWorkbook writableWorkbook = Workbook
					.createWorkbook(outputStream);
//			for(int i=0;i<list.size();i++){
//				
//			}
			WritableSheet sheet = writableWorkbook
					.createSheet("First Sheet", 0);// 创建新的一页
			 sheet.getSettings().setDefaultColumnWidth(35);  
			int column = 0; // 列数计数
			Label label = new Label(column++, 0, "符号");
			Label label1 = new Label(column++, 0, "对应意义"); // 第一个参数是单元格所在列,第二个参数是单元格所在行,第三个参数是值
			sheet.addCell(label); // 将单元格加到页
			sheet.addCell(label1); // 将单元格加到页
			// 遍历jsonArray
			 WritableFont font2 = new WritableFont(WritableFont.ARIAL,14,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.RED);  
			 WritableCellFormat cellFormat2 = new WritableCellFormat(font2);  
			 WritableFont font1 = new WritableFont(WritableFont.ARIAL,10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLUE);  
			 WritableCellFormat cellFormat1 = new WritableCellFormat(font1);  
			 for (int i = 0; i < list.size(); i++) {
				
				if(list.get(i).get("tableName")!=null){
					sheet.mergeCells(0, (i+1), 1, (i+1));
					label = new Label(0,(i+1),list.get(i).get("tableName")+"表",cellFormat2);
					sheet.addCell(label);
 
					continue;
				}
				if(list.get(i).get("info")!=null){
					label = new Label(0,(i+1),"数据说明",cellFormat1);
					label1 = new Label(1, (i + 1),list.get(i).get("info"),cellFormat1);
					sheet.addCell(label);
					sheet.addCell(label1);
					continue;
				} 
				if(list.get(i).get("origin")!=null){
					label = new Label(0,(i+1),"数据来源",cellFormat1);
					label1 = new Label(1, (i + 1),list.get(i).get("origin"),cellFormat1);
					sheet.addCell(label);
					sheet.addCell(label1);
					continue;
				} 
				if(list.get(i).get("org")!=null){
					label = new Label(0,(i+1),"所属部门",cellFormat1);
					label1 = new Label(1, (i + 1),list.get(i).get("org"),cellFormat1);
					sheet.addCell(label);
					sheet.addCell(label1);
					continue;
				} 
				
				column = 0;// 从第0列开始放
				label = new Label(0, (i +1), list.get(i).get("fuhao")); // 第一个参数是单元格所在列,第二个参数是单元格所在行,第三个参数是值
				label1 = new Label(1, (i +1), list.get(i).get("chinese"));
				sheet.addCell(label); // 将单元格加到页
				sheet.addCell(label1); // 将单元格加到页
			}
			writableWorkbook.write(); // 加入到文件中
			writableWorkbook.close(); // 关闭文件，释放资源
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file;
	}


	    
	    
	    public static HttpServletResponse downLoadFiles(List<File> files,
	            HttpServletRequest request, HttpServletResponse response,String name)
	            throws Exception {
	        try {
	            /**这个集合就是你想要打包的所有文件，
	             * 这里假设已经准备好了所要打包的文件*/
	            //List<File> files = new ArrayList<File>();
	     
	            /**创建一个临时压缩文件，
	             * 我们会把文件流全部注入到这个文件中
	             * 这里的文件你可以自定义是.rar还是.zip*/
	            File file = new File("/var/taiji/tomcat7_cms/webapps/downfiles/"+name+".rar");
	            if (!file.exists()){   
	                file.createNewFile();   
	            }
	            response.reset();
	            //response.getWriter()
	            //创建文件输出流
	            FileOutputStream fous = new FileOutputStream(file);   
	            /**打包的方法我们会用到ZipOutputStream这样一个输出流,
	             * 所以这里我们把输出流转换一下*/
	           ZipOutputStream zipOut 
	            = new ZipOutputStream(fous);
	            /**这个方法接受的就是一个所要打包文件的集合，
	             * 还有一个ZipOutputStream*/
	           zipFile(files, zipOut);
	            zipOut.close();
	            fous.close();
	           return downloadZip(file,response);
	        }catch (Exception e) {
	                e.printStackTrace();
	            }
	            /**直到文件的打包已经成功了，
	             * 文件的打包过程被我封装在FileUtil.zipFile这个静态方法中，
	             * 稍后会呈现出来，接下来的就是往客户端写数据了*/
	           
	     
	        return response ;
	    }

	  /**
	     * 把接受的全部文件打成压缩包 
	     * @param List<File>;  
	     * @param org.apache.tools.zip.ZipOutputStream  
	     */
	    public static void zipFile
	            (List files,ZipOutputStream outputStream) {
	        int size = files.size();
	        for(int i = 0; i < size; i++) {
	            File file = (File) files.get(i);
	            zipFile(file, outputStream);
	        }
	    }

	    public static HttpServletResponse downloadZip(File file,HttpServletResponse response) {
	        try {
	        // 以流的形式下载文件。
	        InputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
	        byte[] buffer = new byte[fis.available()];
	        fis.read(buffer);
	        fis.close();
	        // 清空response
	        response.reset();

	        OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
	        response.setContentType("application/octet-stream");

	//如果输出的是中文名的文件，在此处就要用URLEncoder.encode方法进行处理
	        response.setHeader("Content-Disposition", "attachment;filename=" +URLEncoder.encode(file.getName(), "UTF-8"));
	        toClient.write(buffer);
	        toClient.flush();
	        toClient.close();
	        } catch (IOException ex) {
	        ex.printStackTrace();
	        }finally{
	             try {
	                    File f = new File(file.getPath());
	                    f.delete();
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	        }
	        return response;
	    }

	/**  
	     * 根据输入的文件与输出流对文件进行打包
	     * @param File
	     * @param org.apache.tools.zip.ZipOutputStream
	     */
	    public static void zipFile(File inputFile,
	            ZipOutputStream ouputStream) {
	        try {
	            if(inputFile.exists()) {
	   
	                if (inputFile.isFile()) {
	                    FileInputStream IN = new FileInputStream(inputFile);
	                    BufferedInputStream bins = new BufferedInputStream(IN, 512);
	                    //org.apache.tools.zip.ZipEntry
	                    ZipEntry entry = new ZipEntry(inputFile.getName());
	                    ouputStream.putNextEntry(entry);
	                    // 向压缩文件中输出数据   
	                    int nNumber;
	                    byte[] buffer = new byte[512];
	                    while ((nNumber = bins.read(buffer)) != -1) {
	                        ouputStream.write(buffer, 0, nNumber);
	                    }
	                    // 关闭创建的流对象   
	                    bins.close();
	                    IN.close();
	                } else {
	                    try {
	                        File[] files = inputFile.listFiles();
	                        for (int i = 0; i < files.length; i++) {
	                            zipFile(files[i], ouputStream);
	                        }
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                }
	               inputFile.delete();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
}