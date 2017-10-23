package com.dm.app.datatopic.cunqing.cunqinginfo.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;


/**
 * @description 实用人才库表
 * @author huoge
 */
@Document(collection="h_TB_BaseInfo")
public class TbBaseInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String  id;	//
	@Field("BaseInfo_ID")
	private String   baseInfoId;  //基本信息编号
	@Field("Area_QXID")
	private String   areaQxid;  //所在区县编号
	@Field("Area_XzID")
	private String   areaXzId;  //所在乡镇编号
	@Field("Area_CjID")
	private String   areaCjId;  //所在村/居委会编号
	@Field("BaseInfo_Name")
	private String   baseInfoName;  //姓名
	@Field("BaseInfo_IDNumber")
	private String   baseInfoIdNumber;  //身份证
	@Field("BaseInfo_Sex")
	private String   baseInfoSex;  //性别 1--男,0---女
	@Field("BaseInfo_Birthday")
	private Date   baseInfoBirthday;  //生日
	@Field("Nation_ID")
	private String   nationId;  //民族
	private String   nationName;  //民族名
	@Field("Politics_ID")
	private String  politicsId ;  //政治面貌
	private String  politicsName ;  //政治面貌
	@Field("Education_ID")
	private String   educationId;  //学历
	private String   educationName;  //学历
	@Field("BaseInfo_Xw")
	private String   baseInfoXw;  //学位
	@Field("Hukou_ID")
	private String   hukouId;  //户籍属性
	private String   hukouName;  //户籍属性
	@Field("BaseInfo_Jtrk")
	private Integer   baseInfoJtrk;  //家庭人口
	@Field("BaseInfo_Jtpjsr")
	private Float   baseInfoJtpjsr;  //最新家庭年平均收入（万）
	@Field("BaseInfo_Ddhs")
	private Integer   baseInfoDdhs;  //最新带动户数
	@Field("ClassiFication_ID")
	private String   classiFicationId;  //人才类别
	private String  classiFicationName;	//人才类别
	/*@Field("WorkType_ID")
	private String   workTypeId;  //从事产业
	private String  workTypeName;	//从事产业
*/	@Field("BaseInfo_Cydz")
	private String   baseInfoCydz;  //从业地址
	@Field("BaseInfo_Gzdw")
	private String   baseInfoGzdw;  //工作单位
	@Field("BaseInfo_Phone")
	private String   baseInfoPhone;  //电话
	@Field("BaseInfo_CellPhone")
	private String   baseInfoCellPhone;  //手机
	@Field("BaseInfo_Code")
	private String   baseInfoCode;  //邮编
	@Field("BaseInfo_Byyx")
	private String   baseInfoByyx;  //毕业院校
	@Field("BaseInfo_Bysj")
	private String   baseInfoBysj;  //毕业时间
	@Field("BaseInfo_Address")
	private String   baseinfoAddress;  //通讯地址
	@Field("Techposition_ID")
	private String   techpositionID;  //技术职称
	private String   techpositionName;	//技术职称
	@Field("BaseInfo_Zw")
	private String   baseInfoZw;  //职务
	@Field("TraingType_ID")
	private String   traingTypeId;  //培养渠道
	private String   traingTypeName;	//培养渠道
	@Field("Level_ID")
	private String  levelId ;  //人才级别
	private String  levelName;	//人才级别
	@Field("BaseInfo_Certificate")
	private String   baseInfoCertificate;  //初级证书编号
	@Field("BaseInfo_ZjNum")
	private String   baseInfoZjNum;  //中级证书编号
	@Field("BaseInfo_GjNum")
	private String   baseInfoGjNum;  //高级证书编号
	@Field("BaseInfo_TG")
	private String   baseInfoTg;  //突贡人才标记(0为否，1为是)
	@Field("BaseInfo_TGNum")
	private String   baseInfoTGNum;  //突贡人才证书编号
	@Field("Baseinfo_Nominate")
	private Integer   baseinfoNominate;  //推荐状态（０,已推荐；１,未推荐;2,所有）
	@Field("BaseInfo_Status")
	private Integer   baseInfoStatus;  //年检状态(０,正常；１,已故；２,迁出
	@Field("BaseInfo_Bz")
	private String   baseInfoBz;  //	备注
	@Field("BaseInfo_DelFlag")
	private Integer   baseInfoDelFlag;  //	删除标志
	@Field("BaseInfo_ReTime")
	private Date   baseInfoReTime;  //添加/修改时间
	@Field("BaseInfo_Check")
	private Integer   baseInfoCheck;  //审核标记（０,未审核；１,已审核）
	@Field("BaseInfo_Completely")
	private Integer   baseInfoCompletely;  //记录完整性；1为完整，0为不完整
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBaseInfoId() {
		return baseInfoId;
	}
	public void setBaseInfoId(String baseInfoId) {
		this.baseInfoId = baseInfoId;
	}
	public String getAreaQxid() {
		return areaQxid;
	}
	public void setAreaQxid(String areaQxid) {
		this.areaQxid = areaQxid;
	}
	public String getAreaXzId() {
		return areaXzId;
	}
	public void setAreaXzId(String areaXzId) {
		this.areaXzId = areaXzId;
	}
	public String getAreaCjId() {
		return areaCjId;
	}
	public void setAreaCjId(String areaCjId) {
		this.areaCjId = areaCjId;
	}
	public String getBaseInfoName() {
		return baseInfoName;
	}
	public void setBaseInfoName(String baseInfoName) {
		this.baseInfoName = baseInfoName;
	}
	public String getBaseInfoIdNumber() {
		return baseInfoIdNumber;
	}
	public void setBaseInfoIdNumber(String baseInfoIdNumber) {
		this.baseInfoIdNumber = baseInfoIdNumber;
	}
	public String getBaseInfoSex() {
		return baseInfoSex;
	}
	public void setBaseInfoSex(String baseInfoSex) {
		this.baseInfoSex = baseInfoSex;
	}

	public String getNationId() {
		return nationId;
	}
	public void setNationId(String nationId) {
		this.nationId = nationId;
	}
	public String getNationName() {
		return nationName;
	}
	public void setNationName(String nationName) {
		this.nationName = nationName;
	}
	public String getPoliticsId() {
		return politicsId;
	}
	public void setPoliticsId(String politicsId) {
		this.politicsId = politicsId;
	}
	public String getPoliticsName() {
		return politicsName;
	}
	public void setPoliticsName(String politicsName) {
		this.politicsName = politicsName;
	}
	public String getEducationId() {
		return educationId;
	}
	public void setEducationId(String educationId) {
		this.educationId = educationId;
	}
	public String getEducationName() {
		return educationName;
	}
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	public String getBaseInfoXw() {
		return baseInfoXw;
	}
	public void setBaseInfoXw(String baseInfoXw) {
		this.baseInfoXw = baseInfoXw;
	}
	public String getHukouId() {
		return hukouId;
	}
	public void setHukouId(String hukouId) {
		this.hukouId = hukouId;
	}
	public String getHukouName() {
		return hukouName;
	}
	public void setHukouName(String hukouName) {
		this.hukouName = hukouName;
	}
	
	public String getClassiFicationId() {
		return classiFicationId;
	}
	public void setClassiFicationId(String classiFicationId) {
		this.classiFicationId = classiFicationId;
	}
	public String getClassiFicationName() {
		return classiFicationName;
	}
	public void setClassiFicationName(String classiFicationName) {
		this.classiFicationName = classiFicationName;
	}
	/*public String getWorkTypeId() {
		return workTypeId;
	}
	public void setWorkTypeId(String workTypeId) {
		this.workTypeId = workTypeId;
	}
	public String getWorkTypeName() {
		return workTypeName;
	}
	public void setWorkTypeName(String workTypeName) {
		this.workTypeName = workTypeName;
	}*/
	public String getBaseInfoCydz() {
		return baseInfoCydz;
	}
	public void setBaseInfoCydz(String baseInfoCydz) {
		this.baseInfoCydz = baseInfoCydz;
	}
	public String getBaseInfoGzdw() {
		return baseInfoGzdw;
	}
	public void setBaseInfoGzdw(String baseInfoGzdw) {
		this.baseInfoGzdw = baseInfoGzdw;
	}
	public String getBaseInfoPhone() {
		return baseInfoPhone;
	}
	public void setBaseInfoPhone(String baseInfoPhone) {
		this.baseInfoPhone = baseInfoPhone;
	}
	public String getBaseInfoCellPhone() {
		return baseInfoCellPhone;
	}
	public void setBaseInfoCellPhone(String baseInfoCellPhone) {
		this.baseInfoCellPhone = baseInfoCellPhone;
	}
	public String getBaseInfoCode() {
		return baseInfoCode;
	}
	public void setBaseInfoCode(String baseInfoCode) {
		this.baseInfoCode = baseInfoCode;
	}
	public String getBaseInfoByyx() {
		return baseInfoByyx;
	}
	public void setBaseInfoByyx(String baseInfoByyx) {
		this.baseInfoByyx = baseInfoByyx;
	}
	public String getBaseInfoBysj() {
		return baseInfoBysj;
	}
	public void setBaseInfoBysj(String baseInfoBysj) {
		this.baseInfoBysj = baseInfoBysj;
	}
	public String getBaseinfoAddress() {
		return baseinfoAddress;
	}
	public void setBaseinfoAddress(String baseinfoAddress) {
		this.baseinfoAddress = baseinfoAddress;
	}
	public String getTechpositionID() {
		return techpositionID;
	}
	public void setTechpositionID(String techpositionID) {
		this.techpositionID = techpositionID;
	}
	public String getTechpositionName() {
		return techpositionName;
	}
	public void setTechpositionName(String techpositionName) {
		this.techpositionName = techpositionName;
	}
	public String getBaseInfoZw() {
		return baseInfoZw;
	}
	public void setBaseInfoZw(String baseInfoZw) {
		this.baseInfoZw = baseInfoZw;
	}
	public String getTraingTypeId() {
		return traingTypeId;
	}
	public void setTraingTypeId(String traingTypeId) {
		this.traingTypeId = traingTypeId;
	}
	public String getTraingTypeName() {
		return traingTypeName;
	}
	public void setTraingTypeName(String traingTypeName) {
		this.traingTypeName = traingTypeName;
	}
	public String getLevelId() {
		return levelId;
	}
	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	public String getBaseInfoCertificate() {
		return baseInfoCertificate;
	}
	public void setBaseInfoCertificate(String baseInfoCertificate) {
		this.baseInfoCertificate = baseInfoCertificate;
	}
	public String getBaseInfoZjNum() {
		return baseInfoZjNum;
	}
	public void setBaseInfoZjNum(String baseInfoZjNum) {
		this.baseInfoZjNum = baseInfoZjNum;
	}
	public String getBaseInfoGjNum() {
		return baseInfoGjNum;
	}
	public void setBaseInfoGjNum(String baseInfoGjNum) {
		this.baseInfoGjNum = baseInfoGjNum;
	}
	public String getBaseInfoTg() {
		return baseInfoTg;
	}
	public void setBaseInfoTg(String baseInfoTg) {
		this.baseInfoTg = baseInfoTg;
	}
	public String getBaseInfoTGNum() {
		return baseInfoTGNum;
	}
	public void setBaseInfoTGNum(String baseInfoTGNum) {
		this.baseInfoTGNum = baseInfoTGNum;
	}
	
	public String getBaseInfoBz() {
		return baseInfoBz;
	}
	public void setBaseInfoBz(String baseInfoBz) {
		this.baseInfoBz = baseInfoBz;
	}
	
	public Date getBaseInfoBirthday() {
		return baseInfoBirthday;
	}
	public void setBaseInfoBirthday(Date baseInfoBirthday) {
		this.baseInfoBirthday = baseInfoBirthday;
	}
	public Integer getBaseInfoJtrk() {
		return baseInfoJtrk;
	}
	public void setBaseInfoJtrk(Integer baseInfoJtrk) {
		this.baseInfoJtrk = baseInfoJtrk;
	}
	public Float getBaseInfoJtpjsr() {
		return baseInfoJtpjsr;
	}
	public void setBaseInfoJtpjsr(Float baseInfoJtpjsr) {
		this.baseInfoJtpjsr = baseInfoJtpjsr;
	}
	public Integer getBaseInfoDdhs() {
		return baseInfoDdhs;
	}
	public void setBaseInfoDdhs(Integer baseInfoDdhs) {
		this.baseInfoDdhs = baseInfoDdhs;
	}
	public Integer getBaseinfoNominate() {
		return baseinfoNominate;
	}
	public void setBaseinfoNominate(Integer baseinfoNominate) {
		this.baseinfoNominate = baseinfoNominate;
	}
	public Integer getBaseInfoStatus() {
		return baseInfoStatus;
	}
	public void setBaseInfoStatus(Integer baseInfoStatus) {
		this.baseInfoStatus = baseInfoStatus;
	}
	public Integer getBaseInfoDelFlag() {
		return baseInfoDelFlag;
	}
	public void setBaseInfoDelFlag(Integer baseInfoDelFlag) {
		this.baseInfoDelFlag = baseInfoDelFlag;
	}
	public Date getBaseInfoReTime() {
		return baseInfoReTime;
	}
	public void setBaseInfoReTime(Date baseInfoReTime) {
		this.baseInfoReTime = baseInfoReTime;
	}
	public Integer getBaseInfoCheck() {
		return baseInfoCheck;
	}
	public void setBaseInfoCheck(Integer baseInfoCheck) {
		this.baseInfoCheck = baseInfoCheck;
	}
	public Integer getBaseInfoCompletely() {
		return baseInfoCompletely;
	}
	public void setBaseInfoCompletely(Integer baseInfoCompletely) {
		this.baseInfoCompletely = baseInfoCompletely;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TbBaseInfo other = (TbBaseInfo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	 
}
