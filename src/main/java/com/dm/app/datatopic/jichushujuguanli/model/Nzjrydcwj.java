package com.dm.app.datatopic.jichushujuguanli.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 农转居人员调查
 * @author Mr.Jin
 *
 */
@Document(collection = "t_NZJRYDCWJ")
public class Nzjrydcwj implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2561624212471700952L;

	@Id
	// @Indexed
	private String id;

	@Field("quxian")
	private String quxian;// 区县名称
	@Field("xiangzhen")
	private String xiangzhen;// 乡镇名称
	@Field("village")
	private String village;// 行政村名称
	@Field("guanchaname")
	private String guanchaname;// 观察员姓名
	@Field("filldate")
	private Date filldate;// 填写时间
	@Field("state")
	private String state;// 状态
	@Field("xg_r")
	private String xgr;// 状态
	@Field("xg_rq")
	private String xgrq;// 状态
	@Field("zhuhubianma")
	private String zhuhubianma;// 状态
	@Field("shoufangzhe_name")
	private String shoufangzheName;// 状态
	@Field("shoufangzhe_telephone")
	private String shoufangzheTelephone;// 状态
	@Field("home_xiangzhen")
	private String homeXiangzhen;// 状态
	@Field("home_cun")
	private String homeCun;// 状态
	@Field("home_code")
	private String homeCode;// 状态
	@Field("wenjuan_completetime")
	private String wenjuanCompletetime;// 状态
	@Field("a_sex")
	private String sex;// 状态
	@Field("a_old")
	private String old;// 状态
	@Field("a_edu")
	private String edu;// 状态
	@Field("a_nongyenum")
	private String nongyenum;// 状态
	@Field("a_homeaddress")
	private String homeaddress;//
	@Field("a_zhuanjunian")
	private String zhuanjunian;//
	@Field("a_gengdiif")
	private String gengdiif;//
	@Field("a_gengdinum")
	private String gengdinum;//
	@Field("a_lindiif")
	private String lindiif;//
	@Field("a_lindinum")
	private String lindinum;//
	@Field("a_zhuanjuqudao")
	private String zhuanjuqudao;//
	@Field("a_zhuanjuqitaqudao")
	private String zhuanjuqitaqudao;//
	@Field("a_zhuanjuyuanyin")
	private String zhuanjuyuanyin;//
	@Field("a_zhuanjuqitayuanyin")
	private String zhuanjuqitayuanyin;//
	@Field("a_quanyi")
	private String quanyi;//
	@Field("a_shouru")
	private String shouru;//
	@Field("a_shouruzhongzhi")
	private String shouruzhongzhi;//
	@Field("a_shourugongzi")
	private String shourugongzi;//
	@Field("a_shourufenhong")
	private String shourufenhong;//
	@Field("a_shourubutie")
	private String shourubutie;//
	@Field("a_shouruqita")
	private String shouruqita;//
	@Field("a_zhichu")
	private String zhichu;//
	@Field("a_zhichuyi")
	private String zhichuyi;//
	@Field("a_zhichuer")
	private String zhichuer;//
	@Field("a_zhichusan")
	private String zhichusan;//
	@Field("a_zhichuqita")
	private String zhichuqita;//
	@Field("a_xiaofenzhiyueyi")
	private String xiaofenzhiyueyi;//
	@Field("a_xiaofenzhiyueer")
	private String xiaofenzhiyueer;//
	@Field("a_xiaofenzhiyuesan")
	private String xiaofenzhiyuesan;//
	@Field("a_xiaofenqitazhiyue")
	private String xiaofenqitazhiyue;//
	@Field("a_jiatingqitashouru")
	private String jiatingqitashouru;//
	@Field("b_zhuanjumushu")
	private String zhuanjumushu;//
	@Field("b_zhuanjuchengbaonian")
	private String zhuanjuchengbaonian;//
	@Field("b_tudibuchangfei")
	private String tudibuchangfei;//
	@Field("b_anzhuanbuchangfei")
	private String anzhuanbuchangfei;//
	@Field("b_anzhuanbuchangfeiyi")
	private String anzhuanbuchangfeiyi;//
	@Field("b_anzhuanbuchangfeier")
	private String anzhuanbuchangfeier;//
	@Field("b_anzhuanbuchangfeisan")
	private String anzhuanbuchangfeisan;//
	@Field("b_chengbaoquanif")
	private String chengbaoquanif;//
	@Field("b_shenqingzhaijidiif")
	private String shenqingzhaijidiif;//
	@Field("b_guidingqianif")
	private String guidingqianif;//
	@Field("b_zichangchuli")
	private String zichangchuli;//
	@Field("b_gufen")
	private String gufen;//
	@Field("b_gufenfenhong")
	private String gufenfenhong;//
	@Field("b_jitifuli")
	private String jitifuli;//
	@Field("c_xuexiaoweizhi")
	private String xuexiaoweizhi;//
	@Field("c_zexiaofeiif")
	private String zexiaofeiif;//
	@Field("c_zexiaofeinum")
	private String zexiaofeinum;//
	@Field("c_ybxnhyinum")
	private String ybxnhyinum;//
	@Field("c_ybjbbxnum")
	private String ybjbbxnum;//
	@Field("c_ybqita")
	private String ybqita;//
	@Field("c_ybqitanum")
	private String ybqitanum;//
	@Field("c_ybwcjyuanyin")
	private String ybwcjyuanyin;//
	@Field("c_ybfei")
	private String ybfei;//
	@Field("c_ylchengxiangnum")
	private String ylchengxiangnum;//
	@Field("c_ylchengzhengnum")
	private String ylchengzhengnum;//
	@Field("c_ylqita")
	private String ylqita;//
	@Field("c_ylqitanum")
	private String ylqitanum;//
	@Field("c_ylwcjyuanyin")
	private String ylwcjyuanyin;//
	@Field("c_ylfei")
	private String ylfei;//
	@Field("c_chengxiangbuzhuif")
	private String chengxiangbuzhuif;//
	@Field("c_chengxiangbuzhufei")
	private String chengxiangbuzhufei;//
	@Field("c_juzhumianji")
	private String juzhumianji;//
	@Field("c_zhufangjiage")
	private String zhufangjiage;//
	@Field("c_qitazhufangif")
	private String qitazhufangif;//
	@Field("c_qitazhufangmianji")
	private String qitazhufangmianji;//
	@Field("c_qitazhufangjiage")
	private String qitazhufangjiage;//
	@Field("c_shuidianqifei")
	private String shuidianqifei;//
	@Field("c_zuidakunnan")
	private String zuidakunnan;//
	@Field("c_zuidakunnanqita")
	private String zuidakunnanqita;//
	@Field("c_shlinliguanxi")
	private String shlinliguanxi;//
	@Field("c_shjiatingguanxi")
	private String shjiatingguanxi;//
	@Field("c_shzhichu")
	private String shzhichu;//
	@Field("c_ggcsif")
	private String ggcsif;//
	@Field("c_ggcsyuanyin")
	private String ggcsyuanyin;//
	@Field("c_youliren")
	private String youliren;//
	@Field("d_cunminghuiif")
	private String cunminghuiif;//
	@Field("d_xuanjuif")
	private String xuanjuif;//
	@Field("d_canxuanif")
	private String canxuanif;//
	@Field("e_liangshimanyi")
	private String liangshimanyi;//
	@Field("e_yishiyifeimanyi")
	private String yishiyifeimanyi;//
	@Field("e_gongyigangweiif")
	private String gongyigangweiif;//
	@Field("e_caizhengbuzhu")
	private String caizhengbuzhu;//
	@Field("e_zuizhongyaoxiangmu")
	private String zuizhongyaoxiangmu;//
	@Field("e_zuixuyaozhengce")
	private String zuixuyaozhengce;//
	@Field("e_zuiyanzongweiti")
	private String zuiyanzongweiti;//
	@Field("e_jiuyepeixun")
	private String jiuyepeixun;//
	@Field("e_jiuyuepeixunqita")
	private String jiuyuepeixunqita;//
	@Field("e_zhengequdao")
	private String zhengequdao;//
	@Field("e_zhengequdaoqita")
	private String zhengequdaoqita;//
	@Field("e_xuyaoxinxi")
	private String xuyaoxinxi;//
	@Field("e_zhengcemanyi")
	private String zhengcemanyi;//
	@Field("beiyong1")
	private String beiyong1;//
	@Field("beiyong2")
	private String beiyong2;//
	@Field("beiyong3")
	private String beiyong3;//
	@Field("b_gufen1")
	private String b_gufen1;//
	@Field("b_gufen2")
	private String b_gufen2;//
	@Field("c_zuidakunnan1")
	private String zuidakunnan1;//
	@Field("c_zuidakunnan2")
	private String zuidakunnan2;//
	@Field("e_zuizhongyaoxiangmu1")
	private String zuizhongyaoxiangmu1;//
	@Field("e_zuizhongyaoxiangmu2")
	private String zuizhongyaoxiangmu2;//
	@Field("e_zuiyanzongweiti1")
	private String zuiyanzongweiti1;//
	@Field("e_zuiyanzongweiti2")
	private String zuiyanzongweiti2;//
	@Field("e_jiuyepeixun1")
	private String jiuyepeixun1;//
	@Field("e_jiuyepeixun2")
	private String jiuyepeixun2;//
	@Field("e_zhengequdao1")
	private String zhengequdao1;//
	@Field("e_zhengequdao2")
	private String zhengequdao2;//
	@Field("e_caizhengbuzhuqita")
	private String caizhengbuzhuqita;//

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuxian() {
		return quxian;
	}

	public void setQuxian(String quxian) {
		this.quxian = quxian;
	}

	public String getXiangzhen() {
		return xiangzhen;
	}

	public void setXiangzhen(String xiangzhen) {
		this.xiangzhen = xiangzhen;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	public String getGuanchaname() {
		return guanchaname;
	}

	public void setGuanchaname(String guanchaname) {
		this.guanchaname = guanchaname;
	}

	public Date getFilldate() {
		return filldate;
	}

	public void setFilldate(Date filldate) {
		this.filldate = filldate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getXgr() {
		return xgr;
	}

	public void setXgr(String xgr) {
		this.xgr = xgr;
	}

	public String getXgrq() {
		return xgrq;
	}

	public void setXgrq(String xgrq) {
		this.xgrq = xgrq;
	}

	public String getZhuhubianma() {
		return zhuhubianma;
	}

	public void setZhuhubianma(String zhuhubianma) {
		this.zhuhubianma = zhuhubianma;
	}

	public String getShoufangzheName() {
		return shoufangzheName;
	}

	public void setShoufangzheName(String shoufangzheName) {
		this.shoufangzheName = shoufangzheName;
	}

	public String getShoufangzheTelephone() {
		return shoufangzheTelephone;
	}

	public void setShoufangzheTelephone(String shoufangzheTelephone) {
		this.shoufangzheTelephone = shoufangzheTelephone;
	}

	public String getHomeXiangzhen() {
		return homeXiangzhen;
	}

	public void setHomeXiangzhen(String homeXiangzhen) {
		this.homeXiangzhen = homeXiangzhen;
	}

	public String getHomeCun() {
		return homeCun;
	}

	public void setHomeCun(String homeCun) {
		this.homeCun = homeCun;
	}

	public String getHomeCode() {
		return homeCode;
	}

	public void setHomeCode(String homeCode) {
		this.homeCode = homeCode;
	}

	public String getWenjuanCompletetime() {
		return wenjuanCompletetime;
	}

	public void setWenjuanCompletetime(String wenjuanCompletetime) {
		this.wenjuanCompletetime = wenjuanCompletetime;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getOld() {
		return old;
	}

	public void setOld(String old) {
		this.old = old;
	}

	public String getEdu() {
		return edu;
	}

	public void setEdu(String edu) {
		this.edu = edu;
	}

	public String getNongyenum() {
		return nongyenum;
	}

	public void setNongyenum(String nongyenum) {
		this.nongyenum = nongyenum;
	}

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}

	public String getZhuanjunian() {
		return zhuanjunian;
	}

	public void setZhuanjunian(String zhuanjunian) {
		this.zhuanjunian = zhuanjunian;
	}

	public String getGengdiif() {
		return gengdiif;
	}

	public void setGengdiif(String gengdiif) {
		this.gengdiif = gengdiif;
	}

	public String getGengdinum() {
		return gengdinum;
	}

	public void setGengdinum(String gengdinum) {
		this.gengdinum = gengdinum;
	}

	public String getLindiif() {
		return lindiif;
	}

	public void setLindiif(String lindiif) {
		this.lindiif = lindiif;
	}

	public String getLindinum() {
		return lindinum;
	}

	public void setLindinum(String lindinum) {
		this.lindinum = lindinum;
	}

	public String getZhuanjuqudao() {
		return zhuanjuqudao;
	}

	public void setZhuanjuqudao(String zhuanjuqudao) {
		this.zhuanjuqudao = zhuanjuqudao;
	}

	public String getZhuanjuqitaqudao() {
		return zhuanjuqitaqudao;
	}

	public void setZhuanjuqitaqudao(String zhuanjuqitaqudao) {
		this.zhuanjuqitaqudao = zhuanjuqitaqudao;
	}

	public String getZhuanjuyuanyin() {
		return zhuanjuyuanyin;
	}

	public void setZhuanjuyuanyin(String zhuanjuyuanyin) {
		this.zhuanjuyuanyin = zhuanjuyuanyin;
	}

	public String getZhuanjuqitayuanyin() {
		return zhuanjuqitayuanyin;
	}

	public void setZhuanjuqitayuanyin(String zhuanjuqitayuanyin) {
		this.zhuanjuqitayuanyin = zhuanjuqitayuanyin;
	}

	public String getQuanyi() {
		return quanyi;
	}

	public void setQuanyi(String quanyi) {
		this.quanyi = quanyi;
	}

	public String getShouru() {
		return shouru;
	}

	public void setShouru(String shouru) {
		this.shouru = shouru;
	}

	public String getShouruzhongzhi() {
		return shouruzhongzhi;
	}

	public void setShouruzhongzhi(String shouruzhongzhi) {
		this.shouruzhongzhi = shouruzhongzhi;
	}

	public String getShourugongzi() {
		return shourugongzi;
	}

	public void setShourugongzi(String shourugongzi) {
		this.shourugongzi = shourugongzi;
	}

	public String getShourufenhong() {
		return shourufenhong;
	}

	public void setShourufenhong(String shourufenhong) {
		this.shourufenhong = shourufenhong;
	}

	public String getShourubutie() {
		return shourubutie;
	}

	public void setShourubutie(String shourubutie) {
		this.shourubutie = shourubutie;
	}

	public String getShouruqita() {
		return shouruqita;
	}

	public void setShouruqita(String shouruqita) {
		this.shouruqita = shouruqita;
	}

	public String getZhichu() {
		return zhichu;
	}

	public void setZhichu(String zhichu) {
		this.zhichu = zhichu;
	}

	public String getZhichuyi() {
		return zhichuyi;
	}

	public void setZhichuyi(String zhichuyi) {
		this.zhichuyi = zhichuyi;
	}

	public String getZhichuer() {
		return zhichuer;
	}

	public void setZhichuer(String zhichuer) {
		this.zhichuer = zhichuer;
	}

	public String getZhichusan() {
		return zhichusan;
	}

	public void setZhichusan(String zhichusan) {
		this.zhichusan = zhichusan;
	}

	public String getZhichuqita() {
		return zhichuqita;
	}

	public void setZhichuqita(String zhichuqita) {
		this.zhichuqita = zhichuqita;
	}

	public String getXiaofenzhiyueyi() {
		return xiaofenzhiyueyi;
	}

	public void setXiaofenzhiyueyi(String xiaofenzhiyueyi) {
		this.xiaofenzhiyueyi = xiaofenzhiyueyi;
	}

	public String getXiaofenzhiyueer() {
		return xiaofenzhiyueer;
	}

	public void setXiaofenzhiyueer(String xiaofenzhiyueer) {
		this.xiaofenzhiyueer = xiaofenzhiyueer;
	}

	public String getXiaofenzhiyuesan() {
		return xiaofenzhiyuesan;
	}

	public void setXiaofenzhiyuesan(String xiaofenzhiyuesan) {
		this.xiaofenzhiyuesan = xiaofenzhiyuesan;
	}

	public String getXiaofenqitazhiyue() {
		return xiaofenqitazhiyue;
	}

	public void setXiaofenqitazhiyue(String xiaofenqitazhiyue) {
		this.xiaofenqitazhiyue = xiaofenqitazhiyue;
	}

	public String getJiatingqitashouru() {
		return jiatingqitashouru;
	}

	public void setJiatingqitashouru(String jiatingqitashouru) {
		this.jiatingqitashouru = jiatingqitashouru;
	}

	public String getZhuanjumushu() {
		return zhuanjumushu;
	}

	public void setZhuanjumushu(String zhuanjumushu) {
		this.zhuanjumushu = zhuanjumushu;
	}

	public String getZhuanjuchengbaonian() {
		return zhuanjuchengbaonian;
	}

	public void setZhuanjuchengbaonian(String zhuanjuchengbaonian) {
		this.zhuanjuchengbaonian = zhuanjuchengbaonian;
	}

	public String getTudibuchangfei() {
		return tudibuchangfei;
	}

	public void setTudibuchangfei(String tudibuchangfei) {
		this.tudibuchangfei = tudibuchangfei;
	}

	public String getAnzhuanbuchangfei() {
		return anzhuanbuchangfei;
	}

	public void setAnzhuanbuchangfei(String anzhuanbuchangfei) {
		this.anzhuanbuchangfei = anzhuanbuchangfei;
	}

	public String getAnzhuanbuchangfeiyi() {
		return anzhuanbuchangfeiyi;
	}

	public void setAnzhuanbuchangfeiyi(String anzhuanbuchangfeiyi) {
		this.anzhuanbuchangfeiyi = anzhuanbuchangfeiyi;
	}

	public String getAnzhuanbuchangfeier() {
		return anzhuanbuchangfeier;
	}

	public void setAnzhuanbuchangfeier(String anzhuanbuchangfeier) {
		this.anzhuanbuchangfeier = anzhuanbuchangfeier;
	}

	public String getAnzhuanbuchangfeisan() {
		return anzhuanbuchangfeisan;
	}

	public void setAnzhuanbuchangfeisan(String anzhuanbuchangfeisan) {
		this.anzhuanbuchangfeisan = anzhuanbuchangfeisan;
	}

	public String getChengbaoquanif() {
		return chengbaoquanif;
	}

	public void setChengbaoquanif(String chengbaoquanif) {
		this.chengbaoquanif = chengbaoquanif;
	}

	public String getShenqingzhaijidiif() {
		return shenqingzhaijidiif;
	}

	public void setShenqingzhaijidiif(String shenqingzhaijidiif) {
		this.shenqingzhaijidiif = shenqingzhaijidiif;
	}

	public String getGuidingqianif() {
		return guidingqianif;
	}

	public void setGuidingqianif(String guidingqianif) {
		this.guidingqianif = guidingqianif;
	}

	public String getZichangchuli() {
		return zichangchuli;
	}

	public void setZichangchuli(String zichangchuli) {
		this.zichangchuli = zichangchuli;
	}

	public String getGufen() {
		return gufen;
	}

	public void setGufen(String gufen) {
		this.gufen = gufen;
	}

	public String getGufenfenhong() {
		return gufenfenhong;
	}

	public void setGufenfenhong(String gufenfenhong) {
		this.gufenfenhong = gufenfenhong;
	}

	public String getJitifuli() {
		return jitifuli;
	}

	public void setJitifuli(String jitifuli) {
		this.jitifuli = jitifuli;
	}

	public String getXuexiaoweizhi() {
		return xuexiaoweizhi;
	}

	public void setXuexiaoweizhi(String xuexiaoweizhi) {
		this.xuexiaoweizhi = xuexiaoweizhi;
	}

	public String getZexiaofeiif() {
		return zexiaofeiif;
	}

	public void setZexiaofeiif(String zexiaofeiif) {
		this.zexiaofeiif = zexiaofeiif;
	}

	public String getZexiaofeinum() {
		return zexiaofeinum;
	}

	public void setZexiaofeinum(String zexiaofeinum) {
		this.zexiaofeinum = zexiaofeinum;
	}

	public String getYbxnhyinum() {
		return ybxnhyinum;
	}

	public void setYbxnhyinum(String ybxnhyinum) {
		this.ybxnhyinum = ybxnhyinum;
	}

	public String getYbjbbxnum() {
		return ybjbbxnum;
	}

	public void setYbjbbxnum(String ybjbbxnum) {
		this.ybjbbxnum = ybjbbxnum;
	}

	public String getYbqita() {
		return ybqita;
	}

	public void setYbqita(String ybqita) {
		this.ybqita = ybqita;
	}

	public String getYbqitanum() {
		return ybqitanum;
	}

	public void setYbqitanum(String ybqitanum) {
		this.ybqitanum = ybqitanum;
	}

	public String getYbwcjyuanyin() {
		return ybwcjyuanyin;
	}

	public void setYbwcjyuanyin(String ybwcjyuanyin) {
		this.ybwcjyuanyin = ybwcjyuanyin;
	}

	public String getYbfei() {
		return ybfei;
	}

	public void setYbfei(String ybfei) {
		this.ybfei = ybfei;
	}

	public String getYlchengxiangnum() {
		return ylchengxiangnum;
	}

	public void setYlchengxiangnum(String ylchengxiangnum) {
		this.ylchengxiangnum = ylchengxiangnum;
	}

	public String getYlchengzhengnum() {
		return ylchengzhengnum;
	}

	public void setYlchengzhengnum(String ylchengzhengnum) {
		this.ylchengzhengnum = ylchengzhengnum;
	}

	public String getYlqita() {
		return ylqita;
	}

	public void setYlqita(String ylqita) {
		this.ylqita = ylqita;
	}

	public String getYlqitanum() {
		return ylqitanum;
	}

	public void setYlqitanum(String ylqitanum) {
		this.ylqitanum = ylqitanum;
	}

	public String getYlwcjyuanyin() {
		return ylwcjyuanyin;
	}

	public void setYlwcjyuanyin(String ylwcjyuanyin) {
		this.ylwcjyuanyin = ylwcjyuanyin;
	}

	public String getYlfei() {
		return ylfei;
	}

	public void setYlfei(String ylfei) {
		this.ylfei = ylfei;
	}

	public String getChengxiangbuzhuif() {
		return chengxiangbuzhuif;
	}

	public void setChengxiangbuzhuif(String chengxiangbuzhuif) {
		this.chengxiangbuzhuif = chengxiangbuzhuif;
	}

	public String getChengxiangbuzhufei() {
		return chengxiangbuzhufei;
	}

	public void setChengxiangbuzhufei(String chengxiangbuzhufei) {
		this.chengxiangbuzhufei = chengxiangbuzhufei;
	}

	public String getJuzhumianji() {
		return juzhumianji;
	}

	public void setJuzhumianji(String juzhumianji) {
		this.juzhumianji = juzhumianji;
	}

	public String getZhufangjiage() {
		return zhufangjiage;
	}

	public void setZhufangjiage(String zhufangjiage) {
		this.zhufangjiage = zhufangjiage;
	}

	public String getQitazhufangif() {
		return qitazhufangif;
	}

	public void setQitazhufangif(String qitazhufangif) {
		this.qitazhufangif = qitazhufangif;
	}

	public String getQitazhufangmianji() {
		return qitazhufangmianji;
	}

	public void setQitazhufangmianji(String qitazhufangmianji) {
		this.qitazhufangmianji = qitazhufangmianji;
	}

	public String getQitazhufangjiage() {
		return qitazhufangjiage;
	}

	public void setQitazhufangjiage(String qitazhufangjiage) {
		this.qitazhufangjiage = qitazhufangjiage;
	}

	public String getShuidianqifei() {
		return shuidianqifei;
	}

	public void setShuidianqifei(String shuidianqifei) {
		this.shuidianqifei = shuidianqifei;
	}

	public String getZuidakunnan() {
		return zuidakunnan;
	}

	public void setZuidakunnan(String zuidakunnan) {
		this.zuidakunnan = zuidakunnan;
	}

	public String getZuidakunnanqita() {
		return zuidakunnanqita;
	}

	public void setZuidakunnanqita(String zuidakunnanqita) {
		this.zuidakunnanqita = zuidakunnanqita;
	}

	public String getShlinliguanxi() {
		return shlinliguanxi;
	}

	public void setShlinliguanxi(String shlinliguanxi) {
		this.shlinliguanxi = shlinliguanxi;
	}

	public String getShjiatingguanxi() {
		return shjiatingguanxi;
	}

	public void setShjiatingguanxi(String shjiatingguanxi) {
		this.shjiatingguanxi = shjiatingguanxi;
	}

	public String getShzhichu() {
		return shzhichu;
	}

	public void setShzhichu(String shzhichu) {
		this.shzhichu = shzhichu;
	}

	public String getGgcsif() {
		return ggcsif;
	}

	public void setGgcsif(String ggcsif) {
		this.ggcsif = ggcsif;
	}

	public String getGgcsyuanyin() {
		return ggcsyuanyin;
	}

	public void setGgcsyuanyin(String ggcsyuanyin) {
		this.ggcsyuanyin = ggcsyuanyin;
	}

	public String getYouliren() {
		return youliren;
	}

	public void setYouliren(String youliren) {
		this.youliren = youliren;
	}

	public String getCunminghuiif() {
		return cunminghuiif;
	}

	public void setCunminghuiif(String cunminghuiif) {
		this.cunminghuiif = cunminghuiif;
	}

	public String getXuanjuif() {
		return xuanjuif;
	}

	public void setXuanjuif(String xuanjuif) {
		this.xuanjuif = xuanjuif;
	}

	public String getCanxuanif() {
		return canxuanif;
	}

	public void setCanxuanif(String canxuanif) {
		this.canxuanif = canxuanif;
	}

	public String getLiangshimanyi() {
		return liangshimanyi;
	}

	public void setLiangshimanyi(String liangshimanyi) {
		this.liangshimanyi = liangshimanyi;
	}

	public String getYishiyifeimanyi() {
		return yishiyifeimanyi;
	}

	public void setYishiyifeimanyi(String yishiyifeimanyi) {
		this.yishiyifeimanyi = yishiyifeimanyi;
	}

	public String getGongyigangweiif() {
		return gongyigangweiif;
	}

	public void setGongyigangweiif(String gongyigangweiif) {
		this.gongyigangweiif = gongyigangweiif;
	}

	public String getCaizhengbuzhu() {
		return caizhengbuzhu;
	}

	public void setCaizhengbuzhu(String caizhengbuzhu) {
		this.caizhengbuzhu = caizhengbuzhu;
	}

	public String getZuizhongyaoxiangmu() {
		return zuizhongyaoxiangmu;
	}

	public void setZuizhongyaoxiangmu(String zuizhongyaoxiangmu) {
		this.zuizhongyaoxiangmu = zuizhongyaoxiangmu;
	}

	public String getZuixuyaozhengce() {
		return zuixuyaozhengce;
	}

	public void setZuixuyaozhengce(String zuixuyaozhengce) {
		this.zuixuyaozhengce = zuixuyaozhengce;
	}

	public String getZuiyanzongweiti() {
		return zuiyanzongweiti;
	}

	public void setZuiyanzongweiti(String zuiyanzongweiti) {
		this.zuiyanzongweiti = zuiyanzongweiti;
	}

	public String getJiuyepeixun() {
		return jiuyepeixun;
	}

	public void setJiuyepeixun(String jiuyepeixun) {
		this.jiuyepeixun = jiuyepeixun;
	}

	public String getJiuyuepeixunqita() {
		return jiuyuepeixunqita;
	}

	public void setJiuyuepeixunqita(String jiuyuepeixunqita) {
		this.jiuyuepeixunqita = jiuyuepeixunqita;
	}

	public String getZhengequdao() {
		return zhengequdao;
	}

	public void setZhengequdao(String zhengequdao) {
		this.zhengequdao = zhengequdao;
	}

	public String getZhengequdaoqita() {
		return zhengequdaoqita;
	}

	public void setZhengequdaoqita(String zhengequdaoqita) {
		this.zhengequdaoqita = zhengequdaoqita;
	}

	public String getXuyaoxinxi() {
		return xuyaoxinxi;
	}

	public void setXuyaoxinxi(String xuyaoxinxi) {
		this.xuyaoxinxi = xuyaoxinxi;
	}

	public String getZhengcemanyi() {
		return zhengcemanyi;
	}

	public void setZhengcemanyi(String zhengcemanyi) {
		this.zhengcemanyi = zhengcemanyi;
	}

	public String getBeiyong1() {
		return beiyong1;
	}

	public void setBeiyong1(String beiyong1) {
		this.beiyong1 = beiyong1;
	}

	public String getBeiyong2() {
		return beiyong2;
	}

	public void setBeiyong2(String beiyong2) {
		this.beiyong2 = beiyong2;
	}

	public String getBeiyong3() {
		return beiyong3;
	}

	public void setBeiyong3(String beiyong3) {
		this.beiyong3 = beiyong3;
	}

	public String getB_gufen1() {
		return b_gufen1;
	}

	public void setB_gufen1(String b_gufen1) {
		this.b_gufen1 = b_gufen1;
	}

	public String getB_gufen2() {
		return b_gufen2;
	}

	public void setB_gufen2(String b_gufen2) {
		this.b_gufen2 = b_gufen2;
	}

	public String getZuidakunnan1() {
		return zuidakunnan1;
	}

	public void setZuidakunnan1(String zuidakunnan1) {
		this.zuidakunnan1 = zuidakunnan1;
	}

	public String getZuidakunnan2() {
		return zuidakunnan2;
	}

	public void setZuidakunnan2(String zuidakunnan2) {
		this.zuidakunnan2 = zuidakunnan2;
	}

	public String getZuizhongyaoxiangmu1() {
		return zuizhongyaoxiangmu1;
	}

	public void setZuizhongyaoxiangmu1(String zuizhongyaoxiangmu1) {
		this.zuizhongyaoxiangmu1 = zuizhongyaoxiangmu1;
	}

	public String getZuizhongyaoxiangmu2() {
		return zuizhongyaoxiangmu2;
	}

	public void setZuizhongyaoxiangmu2(String zuizhongyaoxiangmu2) {
		this.zuizhongyaoxiangmu2 = zuizhongyaoxiangmu2;
	}

	public String getZuiyanzongweiti1() {
		return zuiyanzongweiti1;
	}

	public void setZuiyanzongweiti1(String zuiyanzongweiti1) {
		this.zuiyanzongweiti1 = zuiyanzongweiti1;
	}

	public String getZuiyanzongweiti2() {
		return zuiyanzongweiti2;
	}

	public void setZuiyanzongweiti2(String zuiyanzongweiti2) {
		this.zuiyanzongweiti2 = zuiyanzongweiti2;
	}

	public String getJiuyepeixun1() {
		return jiuyepeixun1;
	}

	public void setJiuyepeixun1(String jiuyepeixun1) {
		this.jiuyepeixun1 = jiuyepeixun1;
	}

	public String getJiuyepeixun2() {
		return jiuyepeixun2;
	}

	public void setJiuyepeixun2(String jiuyepeixun2) {
		this.jiuyepeixun2 = jiuyepeixun2;
	}

	public String getZhengequdao1() {
		return zhengequdao1;
	}

	public void setZhengequdao1(String zhengequdao1) {
		this.zhengequdao1 = zhengequdao1;
	}

	public String getZhengequdao2() {
		return zhengequdao2;
	}

	public void setZhengequdao2(String zhengequdao2) {
		this.zhengequdao2 = zhengequdao2;
	}

	public String getCaizhengbuzhuqita() {
		return caizhengbuzhuqita;
	}

	public void setCaizhengbuzhuqita(String caizhengbuzhuqita) {
		this.caizhengbuzhuqita = caizhengbuzhuqita;
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
		Nzjrydcwj other = (Nzjrydcwj) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	// "OBJECTID" : 3,
	// "SZ_QX" : "朝阳区",
	// "MC" : "朝阳区",
	// "ID" : 3,
	// "AREA" : 0.0,
	// "LEN" : 0.0,
	// "SHAPE" : 3

}
