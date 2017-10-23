package com.dm.app.datatopic.xiangcunlvyou.service;

import java.util.List;


/**               
 * @date: 2017年4月5日
 * @Author: fyq
 */
public interface XiangCunLvYouService {

	
	
	
	public List getXiangCunLvYouCountUnderQx();
	
	public List getXiangCunLvYouHuCountUnderQx();
	
	public List getXiangCunLvYouQuCountUnderQx();
	
	public List getXiangCunLvYouQuXiangmuLeiXingCountUnderQx() ;
	
	public  List getXiangCunLvYouHuSumMj(String year);
	
	public List getXiangCunLvYouHuCountOneHyUnderQx();
	
	public List getXiangCunLvYouHuCountTwoHyUnderQx();
	


}
