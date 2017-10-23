package initDivition.init;

import initDivition.util.ExcelReader_xls;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

public class initTongjiNianjian {
	public static void main(String[] args) {
	//String path="D:\\娱乐休闲\\QQ\\QQ数据\\1773503320\\FileRecv\\统计年鉴2015年数据1";
		String path="C:\\Users\\Mr.Jin\\Desktop\\涉农信息\\sql\\统计年鉴2015年数据1";
	     ss(path);
		
	}
	public static void ss(String path) {
		/*
		 * 农村基本情况(1978-2014年)
		 注：1. 从业人员指标1998年以前为乡村劳动力。	
		    2. 乡政府个数、镇政府个数、村民委员会个数由北京市民政局提供。	
		    3. 2006年乡镇及行政村人口和从业人员为农业普查数据；2007年以后乡镇及行政村人口和从业人员为农业普查口径，包含居住半年	
		      以上外来人口。	
		    4. 2006年乡镇及行政村户数为农业普查数据，为自然户口径；2007年以后为居住一年以上的户口径
		 
		 */
		daoru("tj_NCJBQK",
				path+"\\ch10-01.xls",
				new String[]{"TJNF","XZF","ZZF","CMWYH","XZJXZCCZHS","XZJXZCCZRK","XZJXZCCYRY"},
				new int[]{0,1,2,3,4,5,6},
				6,
				51);
		/*
		 * 农业生产条件(1978-2014年)
		注：1. 化肥施用量为折纯量。
		    2. 2003年以前农村用电量由原北京市供电局提供。
		    3. 农业机械总动力数据由北京市农业局提供。
		    4. 1991-2001年有效灌溉面积由北京市水务局提供。
		 */
		daoru("tj_NYSCTJFL",
				path+"\\ch10-02.xls",
				new String[]{"TJNF","NMSYGDMJ","YXGGMJ","NYJXZDL","NCYDL","HFSYL"},
				new int[]{0,1,2,3,4,5},
				6,
				51);
		/*
		 * 农作物播种面积和造林面积(1978-2014年)
		注：1．蔬菜播种面积2006年为农业普查衔接数据，1997年-2005年为历史修订数据。
    		2．造林面积2009年以前为人工造林面积，2009年起调整为荒山荒(沙)地造林面积，包括人工造林、无林地和疏林地新封面积。

		 */
		daoru("tj_NZWBZMJHZLMJ",
		path+"\\ch10-03.xls",
				new String[]{"TJNF","NZWBZMJ","LSZW","YM","XM","YL","SCJYYJ","GLJCM","SL","ZLMJ"},
				new int[]{0,1,2,3,4,5,6,7,8,9},
				6,
				51);
		
		/*农林牧渔业总产值(1978-2014年)
		注：1.农林牧渔业总产值绝对数按现价计算，从2003年起执行新《国民经济行业分类标准》，农林牧渔业总产值中含农林牧渔服务业产值。								
	    2.2003年以后，计算农林牧渔业总产值使用的价格从农产品综合平均价调整为农产品生产价格。								
	    3.2006年为与农业普查衔接的数据，1997-2005年为历史修订数据。								
	    4.2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。*/		

		daoru("tj_NLMYYZCZFL",
				path+"\\ch10-04.xls",
						new String[]{"TJNF","NLMYYZZC","NL","LY","MY","YY","NLMYFWY","AXJJS","AKBJJS"},
						new int[]{0,1,2,3,4,5,6,7,8},
						7,
						52);
		/*主要农业产品产量(1978-2014年)
		注：1. 蔬菜、干鲜果品、猪牛羊肉产量2006年为农业普查衔接数据，1997年-2005年为历史修订数据。						
	    2. 肉类产量1988年及以前为猪牛羊肉产量。						
	    3. 2006年及以前水产品产量为淡水鱼产量，2007年以后含远洋捕捞量。水产品数据由北京市农业局提供。		*/		
		daoru("tj_ZYNYCPCL",
				path+"\\ch10-05.xls",
				   new String[]{"TJNF","LS","YL","SCJSYJ","GXGP","NN","RL","ZRYR","QDCL","SCP"},
						new int[]{0,1,2,3,4,5,6,7,8,9},
						7,
						50);
		/*平均每一从业人员创造农、林、牧、渔业产值(1990-2014年)
		注：1．2006年从业人员为农普数据，2007年以后为农业普查口径，含居住半年以上的外来人口。					
	    2．2006年农林牧渔业总产值及分行业产值为与农业普查衔接的数据，1997-2005年为历史修订数据。					
	    3．2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。					
*/
		daoru("tj_PJMYCYRYCZ",
				path+"\\ch10-06.xls",
				       new String[]{"TJNF","NLMYYZCZ","NY","LY","XMY","YY"},
						new int[]{0,1,2,3,4,5},
						5,
						36);
		/*耕地面积(2009-2013年)
		注：表中2009年耕地面积相关数据为第二次全国土地调查数据，2010-2013年为各年土地变更调查数据。			
		资料来源：北京市国土资源局。			
					*/

		daoru("tj_GDMJ",
				path+"\\ch10-07.xls",
						new String[]{"XM","ELLJ","ELYL","ELYY","ELYE","ELYS"},
						new int[]{0,1,2,3,4,5},
						6,
						22);
/*		农村固定资产投资情况(2014年)
		注：1. 本表非农户固定资产投资为全面调查；农户固定资产投资为抽样调查。		
		2. 行业划分执行2011年国民经济行业分类标准(GB/T 4754-2011)。 */		

		daoru("tj_NCGDZCTZQK",
				path+"\\ch10-08.xls",
						new String[]{"XM","HJ","FNY","NY"},
						new int[]{0,1,2,3},
						5,
						45);
		/*农业生产条件
		注：1. 农村小水电站是指乡村两级小水电站实有数。			
	    2. 主要农业机械拥有量、农业机械作业面积、排灌动力机械数据由北京市农业局提供。			
	    3. 机(电)井、扬水站数据由北农林牧渔业总产值京市水务局提供。	*/		

		daoru("tj_NYSCTJ",
				path+"\\ch10-09.xls",
						new String[]{"XM","DW","SI","SAN","ZB"},
						new int[]{0,1,2,3,4},
						5,
						39);
		
		/*农林牧渔业总产值*/
		
		daoru("tj_NLMYYZCZ",
				path+"\\ch10-10.xls",
						new String[]{"XM","SI","SAN","ZB"},
						new int[]{0,1,2,3},
						5,
						23);
		
		/*主要农作物播种面积及产量
		 * */
		daoru("tj_ZYNZWBZMJJCL",
				path+"\\ch10-11.xls",
						new String[]{"XM","BZMJ_SI","DC_SI","ZCL_SI","BZMJ_SAN","DC_SAN","ZCL_SAN"},
						new int[]{0,1,2,3,4,5,6},
						6,
						27);
		 /*林业及干鲜果品生产
		  *
		  *资料来源：林业生产数据由北京市园林绿化局提供。*/
		daoru("tj_LYJGXGPSC",
				path+"\\ch10-12.xls",
				        new String[]{"XM","DW","SI","SAN","ZB"},
						new int[]{0,1,2,3,4},
						4,
						23);
		/*牲畜饲养及畜产品产量*/
		daoru("tj_SCSYJCCPCL",
				path+"\\ch10-13.xls",
						 new String[]{"XM","DW","SI","SAN","ZB"},
							new int[]{0,1,2,3,4},
						4,
						30);
		/*水产品生产
		资料来源：北京市农业局。	
*/
		daoru("tj_SCPSC",
				path+"\\ch10-14.xls",
				new String[]{"XM","DW","SI","SAN","ZB"},
						new int[]{0,1,2,3,4},						
						3,
						12);
		/*农业观光园、民俗旅游、种业和设施农业(2010-2014年)*/
		daoru("tj_NY_MS_ZY_SS",
				path+"\\ch10-15.xls",
				new String[]{"XM","DW","ELYL","ELYY","ELYE","ELYSAN","ELYISI"},
				new int[]{0,1,2,3,4,5,6},
				4,
				25);
		/*农业观光园*/
		daoru("tj_NYGGY",
				path+"\\ch10-16.xls",
				new String[]{"XM","DW","SI","SAN","ZB"},
				new int[]{0,1,2,3,4},	
						4,
						9);
		/*民俗旅游
		注：从2014年起，将民俗旅游中期末从业人员调整为高峰期从业人员。 			
*/
		daoru("tj_MSLY",
				path+"\\ch10-17.xls",
				new String[]{"XM","DW","SI","SAN","ZB"},
				new int[]{0,1,2,3,4},	
						4,
						10);
		/*种业生产*/
		daoru("tj_ZZSC",
				path+"\\ch10-18.xls",
				new String[]{"XM","DW","CL_SI","CL_SAN","ZB_SI","SI_SR","SAN_SR","ZB_SR"},
				new int[]{0,1,2,3,4,5,6,7},
						6,
						20);
		/*设施农业(2014年)
			注：切花产量的计量单位是万枝，盆花产量的计量单位是万盆。	*/	

		daoru("tj_SSNY",
				path+"\\ch10-19.xls",
				new String[]{"XM","SSNYBZMJ","SSNYCL","SSNYSR"},
				new int[]{0,1,2,3},	
						3,
						29);
		/*乡镇企业各业基本情况(2014年)
		资料来源：北京市经济和信息化委员会。*/		

		daoru("tj_XZQYGYJBQK",
				path+"\\ch10-20.xls",
				new String[]{"XM","SL_QYGS","GC_QYGS","SL_CYGS","GC_CYGS","SL_ZSR","GC_ZSR","SL_LRZE","GC_LRZE"},
				new int[]{0,1,2,3,4,5,6,7,8},	
						4,
						15);
	/*	农村经济收入与分配
		资料来源：北京市农村经济研究中心农村合作经济经营管理站。	*/		

		daoru("tj_NCJJSRYFP",
				path+"\\ch10-21.xls",
				new String[]{"XM","SI","SAN","ZB"},
				new int[]{0,1,2,3},	
						4,
						34);
		/*乡镇企业出口供货情况
		资料来源：北京市经济和信息化委员会。	*/	

		daoru("tj_XZQYCKGHQK",
				path+"\\ch10-22.xls",
				new String[]{"XM","SI","SAN"},
				new int[]{0,1,2},	
						4,
						15);
		
	}
	


	public static void daoru(String collectionName, String xlsxPath,
			String[] filed, int[] index, int startRow, int endRow) {

		try {
			DB db = getDB();
			DBCollection coll = db.getCollection(collectionName);
			// String[] filed=new
			// String[]{"TJNF","XZF","ZZF","CMWYH","XZJXZCCZHS","XZJXZCCZRK","XZJXZCCYRY"};
			// int[] index =new int[]{0,1,2,3,4,5,6};
			// 获取表格中数据
			ExcelReader_xls excelReader = new ExcelReader_xls();
			// String xlsxPath = "d:\\log\\201609227.xlsx";
			InputStream is = new FileInputStream(xlsxPath);
			Map<Integer, List<String>> map = excelReader.readExcelContent(is,
					0, startRow, endRow, index);
			for (int i = 0; i < map.size(); i++) {
				// System.out.println(map.get(i));
				List<String> list = map.get(i);
				BasicDBObject o = new BasicDBObject();
				boolean f =false;
				for (int j = 0; j < filed.length; j++) {
					String name = filed[j];
					o.append(name, list.get(j));
					if(list.get(j)!=null&&!(list.get(j).trim().equals(""))){
						f = true;
					}
				}
				if(f)
				coll.save(o);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}

	private static DB getDB() {
		Mongo mongo;
		try {
			mongo = new Mongo("localhost", 27017);
			//mongo = new Mongo("192.168.102.131", 27017);
			DB db = mongo.getDB("datamanage");
			return db;
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
