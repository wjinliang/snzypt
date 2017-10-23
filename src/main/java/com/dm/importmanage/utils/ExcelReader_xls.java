package com.dm.importmanage.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.dm.platform.util.DmDateUtil;
import com.dm.platform.util.UUIDUtils;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

/**
 * 操作Excel表格的功能类
 */
public class ExcelReader_xls {
    private POIFSFileSystem fs;
    private HSSFWorkbook wb;
    private HSSFSheet sheet;
    private HSSFRow row;

    /**
     * 读取Excel表格表头的内容
     * @param InputStream
     * @return String 表头内容的数组
     */
    public String[] readExcelTitle(InputStream is) {
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        row = sheet.getRow(0);
        // 标题总列数
        int colNum = row.getPhysicalNumberOfCells();
        String[] title = new String[colNum];
        for (int i = 0; i < colNum; i++) {
            //title[i] = getStringCellValue(row.getCell((short) i));
            title[i] = getCellFormatValue(row.getCell((short) i));
        }
        return title;
    }

    /**
     * 读取Excel数据内容
     * @param l 
     * @param k 
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
    public List<DBObject> readExcelContent(InputStream is,int sheetIndex,int startRow,int endRow,int titleRow, int[] coll,String[] filed) {
        List<DBObject> content = new  ArrayList<DBObject>();
        String now = DmDateUtil.Current();
        try {
         //   fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(sheetIndex);
        int nu =sheet.getLastRowNum();
        int rowNum = endRow;
        if(endRow==0||rowNum>nu){
        // 得到总行数
        	rowNum = nu;
        }
     	row = sheet.getRow(titleRow);
     	int colNum = row.getPhysicalNumberOfCells();
     	if(coll==null ){
     		coll = new int[colNum];
     		filed = new String[colNum];
     		int j = 0;
     		List list = new ArrayList();
     		while (j < colNum) {
     			coll[j]=j;
     			String jc = ChineseToEnglish.getPinYinHeadChar(getCellFormatValue(row.getCell((short) j)).trim());
     			String s = contains(list,jc);
     			list.add(s);
     			filed[j]=s;
     			j++;
     		}
     	}
    	if(filed==null){
     		filed = new String[coll.length];
    		int j = 0;
     		List list = new ArrayList();
     		for(int i:coll){
     			coll[j]=j;
     			String jc = ChineseToEnglish.getPinYinHeadChar(getCellFormatValue(row.getCell((short) i)).trim());
     			String s = contains(list,jc);
     			list.add(s);
     			filed[j]=s;
     			j++;
     		}
    	}
        
        int n=0;
        for (int i = startRow; i <= rowNum; i++) {
            row = sheet.getRow(i);
            DBObject v = new BasicDBObject();
            v.put("id",UUIDUtils.getUUID8());
            v.put("importTime", now);
            boolean f = false;
            for(int j=0;j<coll.length;j++){
            	int k = coll[j];
            	String key = filed[j];
            	String val = getCellFormatValue(row.getCell((short) k)).trim();
            	v.put(key, val);
            	if(val!=null && !val.trim().equals("")){
            		f=true;
            	}
            	
            }
            if(f){
            	content.add(v);
            }
        }
        return content;
    }

    private String contains(List list, String jc) {
    	String s = jc.trim().replaceAll("[,;，。.、：:\\s\\(\\)/（）]|[0-9]","");
		while (s.equals("")||list.contains(s)) {
			s+=(char)((int)Math.random()*((int)'z'-(int)'a')+(int)'a');
		}
		return s;
		
	}

	/**
     * 获取单元格数据内容为字符串类型的数据
     * 
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    private String getStringCellValue(HSSFCell cell) {
        String strCell = "";
        switch (cell.getCellType()) {
        case HSSFCell.CELL_TYPE_STRING:
            strCell = cell.getStringCellValue();
            break;
        case HSSFCell.CELL_TYPE_NUMERIC:
        	DecimalFormat df = new DecimalFormat("0"); 
            strCell = String.valueOf(df.format(cell.getNumericCellValue()));
            break;
        case HSSFCell.CELL_TYPE_BOOLEAN:
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case HSSFCell.CELL_TYPE_BLANK:
            strCell = "";
            break;
        default:
            strCell = "";
            break;
        }
        if (strCell.equals("") || strCell == null) {
            return "";
        }
        if (cell == null) {
            return "";
        }
        return strCell;
    }

    /**
     * 获取单元格数据内容为日期类型的数据
     * 
     * @param cell
     *            Excel单元格
     * @return String 单元格数据内容
     */
    private String getDateCellValue(HSSFCell cell) {
        String result = "";
        try {
            int cellType = cell.getCellType();
            if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
                Date date = cell.getDateCellValue();
                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
                        + "-" + date.getDate();
            } else if (cellType == HSSFCell.CELL_TYPE_STRING) {
                String date = getStringCellValue(cell);
                result = date.replaceAll("[年月]", "-").replace("日", "").trim();
            } else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
                result = "";
            }
        } catch (Exception e) {
            System.out.println("日期格式不正确!");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private String getCellFormatValue(HSSFCell cell) {
        String cellvalue = "";
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
            // 如果当前Cell的Type为NUMERIC
            case HSSFCell.CELL_TYPE_NUMERIC:
            case HSSFCell.CELL_TYPE_FORMULA: {
                // 判断当前的cell是否为Date
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    // 如果是Date类型则，转化为Data格式
                    
                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                    //cellvalue = cell.getDateCellValue().toLocaleString();
                    
                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                    Date date = cell.getDateCellValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    cellvalue = sdf.format(date);
                    
                }
                // 如果是纯数字
                else {
                    // 取得当前Cell的数值
                	DecimalFormat df = new DecimalFormat("0"); 
                    cellvalue = String.valueOf(df.format(cell.getNumericCellValue()));
                }
                break;
            }
            // 如果当前Cell的Type为STRIN
            case HSSFCell.CELL_TYPE_STRING:
                // 取得当前的Cell字符串
                cellvalue = cell.getRichStringCellValue().getString();
                break;
            // 默认的Cell值
            default:
                cellvalue = " ";
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;

    }

    public static void main(String[] args) {
        try {
        	System.out.println((int )'a');
            // 对读取Excel表格标题测试
//            InputStream is = new FileInputStream("d:\\log\\20160927.xlsx");
            ExcelReader_xls excelReader = new ExcelReader_xls();
//            String[] title = excelReader.readExcelTitle(is);
//            System.out.println("获得Excel表格的标题:");
//            for (String s : title) {
//                System.out.print(s + " ");
//            }

            // 对读取Excel表格内容测试
            InputStream is2 = new FileInputStream("d:\\log\\全市休闲农业园区批量标注数据采集表.xls");
            List<DBObject> map = excelReader.readExcelContent(is2,0,2,8,1,null,null);
            System.out.println("获得Excel表格的内容:");
            System.out.println(map.size());
            for (int i = 1; i < map.size(); i++) {
                System.out.println(map.get(i));
            }

        } catch (FileNotFoundException e) {
            System.out.println("未找到指定路径的文件!");
            e.printStackTrace();
        }
    }

	public Map<Integer, Object> readExcelTitle(InputStream is, int sheetIndex,
			Integer startRow, Integer endRow, Integer titleRow, int[] coll,
			String[] filed) {
		Map<Integer, Object> map = new HashMap();
	        try {
	         //   fs = new POIFSFileSystem(is);
	            wb = new HSSFWorkbook(is);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        sheet = wb.getSheetAt(sheetIndex);
	        int nu =sheet.getLastRowNum();
	        int rowNum = endRow;
	        if(endRow==0||rowNum>nu){
	        // 得到总行数
	        	rowNum = nu;
	        }
	        row = sheet.getRow(0);
	        String name = getCellFormatValue(row.getCell(0)).trim();
	        if(name.equals("")){
	        	name = UUIDUtils.getUUID8();
	        }
	        String tableName = ChineseToEnglish.getPinYinHeadChar("im_"+name);
	        String[] names = null;
	     	row = sheet.getRow(titleRow);
	     	int colNum = row.getPhysicalNumberOfCells();
	     	if(coll==null ){
	     		coll = new int[colNum];
	     		filed = new String[colNum];
	     		 names = new String[colNum];
	     		int j = 0;
	     		List list = new ArrayList();
	     		while (j < colNum) {
	     			coll[j]=j;
	     			String o = getCellFormatValue(row.getCell(j)).trim();
	     			String jc = ChineseToEnglish.getPinYinHeadChar(o);
	     			String s = contains(list,jc);
	     			list.add(s);
	     			filed[j]=s;
	     			names[j]=o;
	     			j++;
	     		}
	     	}
	    	if(filed==null){
	     		filed = new String[coll.length];
	     		 names = new String[coll.length];
	    		int j = 0;
	     		List list = new ArrayList();
	     		for(int i:coll){
	     			coll[j]=j;
	     			String o = getCellFormatValue(row.getCell(j)).trim();
	     			String jc = ChineseToEnglish.getPinYinHeadChar(o);
	     			String s = contains(list,jc);
	     			list.add(s);
	     			filed[j]=s;
	     			names[j]=o;
	     			j++;
	     		}
	    	}
	    	map.put(0,sheetIndex);
	    	map.put(1, startRow);
	    	map.put(2, endRow);
	    	map.put(3, titleRow);
	    	map.put(4,tableName);
	    	String index = "";
	    	String f = "";
	    	String t  ="";
	    	for(int i=0;i<coll.length;i++){
	    		index +=","+coll[i];
	    		f +=","+filed[i];
	    		t +=","+names[i];
	    	}
	    	index = index.substring(1);
	    	f = f.substring(1);
	    	t = t.substring(1);
	    	map.put(5, index);
	    	map.put(6, f);
	    	map.put(7, t);
	        
	        return map;
	}

	
}