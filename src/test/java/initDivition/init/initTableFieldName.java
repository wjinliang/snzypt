
package initDivition.init;

import initDivition.util.DataSourceUtil;
import initDivition.util.ExcelReader;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import com.mongodb.DB;
import com.mongodb.Mongo;

public class initTableFieldName {

	public static void main(String[] args) {

		Connection snconn = DataSourceUtil.getConnection("sndataSource");
		Statement snStat = null;
		try {
			snStat = snconn.createStatement();
			//snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='DX_JJ'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='GL_ID'");
			snStat.executeUpdate("update at_field_config set a_title='所在区县' where a_title='SZ_QX'");
			snStat.executeUpdate("update at_field_config set a_title='所在区县' where a_title='QX_MC'");
			snStat.executeUpdate("update at_field_config set a_title='所在乡镇' where a_title='XZ_MC'");
			snStat.executeUpdate("update at_field_config set a_title='所在乡镇' where a_title='SZ_XZ'");
			snStat.executeUpdate("update at_field_config set a_title='所在行政村' where a_title='XZC_MC'");
			snStat.executeUpdate("update at_field_config set a_title='所在行政村' where a_title='SZ_XZC'");
			snStat.executeUpdate("update at_field_config set a_title='所在行政村编码' where a_title='XZC_CODE'");
			snStat.executeUpdate("update at_field_config set a_title='热点(area)' where a_title like '%AREA%'");
			snStat.executeUpdate("update at_field_config set a_title='热点(shape)' where a_title like 'SHAPE%'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='ID'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='OBJECTID'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='C_GRADE'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='C_UPDATE'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='C_CODE'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='C_GDNUMBER'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='SDE_ST_HIG'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='LEN_'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field like 'LEN%'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='SDE_ST_ROA'");
			snStat.executeUpdate("update at_field_config set `grid_show`=0, `detail_show`=1 where a_field='XZC_CODE'");
			//获取表格中数据
			ExcelReader excelReader = new ExcelReader();
			 InputStream is2 = new FileInputStream("d:\\log\\201609227.xlsx");
	            Map<Integer, List<String>> map = excelReader.readExcelContent(is2,1,1,0,new int[]{2,6});
	            System.out.println("获得Excel表格的内容:");
	            System.out.println(map.size());
	            for (int i = 0; i < map.size(); i++) {
	                //System.out.println(map.get(i));
	            	List<String> list = map.get(i);
	            	
	            	String enName = list.get(1);
	            	String sql ="update at_field_config set a_title='"+list.get(0)+"' where a_title='"+enName+"'";
	            	snStat.executeUpdate(sql);
	            	
	            	
	            }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DataSourceUtil.closeConn(snconn);
		}
	}
	
	private static DB getDB() {
		Mongo mongo;
		try {
			mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("datamanage");
			return db;
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
