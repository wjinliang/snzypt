package com.dm.importmanage.utils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;

import com.dm.importmanage.model.ExclImportConf;
import com.dm.importmanage.model.ExclImportLog;
import com.mongodb.DBObject;

public class ImportUtils {
	// 读取Excel内容
	public static List<DBObject> daoru(String xlsxPath, int[] index,
			String[] field, Integer startRow, Integer endRow, Integer titleRow) {
		List<DBObject> map = null;
		try {
			// 获取表格中数据
			ExcelReader_xls excelReader = new ExcelReader_xls();
			InputStream is = new FileInputStream(xlsxPath);
			endRow = endRow == null ? 0 : endRow;
			if (startRow == null) {
				startRow = 2;
				if (titleRow == null) {
					titleRow = 1;
				} else {
					titleRow = startRow > 0 ? startRow - 1 : 0;
				}
			} else {
				if (titleRow == null) {
					titleRow = startRow > 0 ? startRow - 1 : 0;
				}
			}

			map = excelReader.readExcelContent(is, 0, startRow, endRow,
					titleRow, index, field);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return map;
	}

	// 读取Excel信息
	private static Map<Integer, Object> get(String xlsxPath, Integer startRow,
			Integer endRow, Integer titleRow) {
		Map<Integer, Object> map = null;
		try {
			// 获取表格中数据
			ExcelReader_xls excelReader = new ExcelReader_xls();
			InputStream is = new FileInputStream(xlsxPath);
			endRow = endRow == null ? 0 : endRow;
			if (startRow == null) {
				startRow = 2;
				if (titleRow == null) {
					titleRow = 1;
				} else {
					titleRow = startRow > 0 ? startRow - 1 : 1;
				}
			} else {
				if (titleRow == null) {
					titleRow = startRow > 0 ? startRow - 1 : 1;
				}
			}

			map = excelReader.readExcelTitle(is, 0, startRow, endRow, titleRow,
					null, null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return map;
	}

	public static ExclImportConf getConf(ExclImportLog log) {
		ExclImportConf r = new ExclImportConf();
		Integer startRow = log.getStartRow();
		Integer endRow = log.getEndRow();
		Integer titleRow = log.getTitleRow();
		if (startRow == null) {
			startRow = 2;
			if (titleRow == null) {
				titleRow = 1;
			} else {
				titleRow = startRow > 0 ? startRow - 1 : 1;
			}
		} else {
			if (titleRow == null) {
				titleRow = startRow > 0 ? startRow - 1 : 1;
			}
		}
		Map m = get(log.getFilePath(), startRow, endRow, titleRow);
		r.setCreatime(new Date());
		r.setStartRow((int) m.get(1));
		r.setEndRow((int) m.get(2));
		r.setCollectionIndexs((String) m.get(5));
		r.setCollectionNames((String) m.get(6));
		r.setCollectionTitles((String) m.get(7));
		String path = log.getFilePath();
		path = path.substring(0, path.lastIndexOf("."));
		path = path.substring(path.lastIndexOf("excel") + 7);
		String tableName = log.getTableName();
		if (!StringUtils.hasText(tableName)) {
			tableName = ChineseToEnglish.getPinYinHeadChar("im_"+path);
			//tableName = (String) m.get(4);
		}
		r.setTableName(tableName);
		r.setName(path);
		return r;
	}
}
