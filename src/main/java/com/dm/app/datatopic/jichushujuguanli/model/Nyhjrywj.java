package com.dm.app.datatopic.jichushujuguanli.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 农业户籍调查问卷
 * @author Mr.Jin
 *
 */
@Document(collection = "t_NYHJRYWJ")
public class Nyhjrywj implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2431428488496281034L;
	@Id
	private String id;
	@Field("ID")
	private String ID;
	@Field("quxian")
	private String quxian;
	@Field("xiangzhen")
	private String xiangzhen;
	@Field("village")
	private String village;
	@Field("guanchaname")
	private String guanchaname;
	@Field("filldate")
	private String filldate;
	@Field("state")
	private String state;
	@Field("gcy_xm")
	private String gcy_xm;
	@Field("xg_r")
	private String xg_r;
	@Field("xg_rq")
	private String xg_rq;
	@Field("wenjuanbianma")
	private String wenjuanbianma;
	@Field("xiangzhenbianma")
	private String xiangzhenbianma;
	@Field("cunbianma")
	private String cunbianma;
	@Field("zhuhubianma")
	private String zhuhubianma;
	@Field("shoufangzhe_name")
	private String shoufangzhe_name;
	@Field("shoufangzhe_phone")
	private String shoufangzhe_phone;
	@Field("home_xiangzhen")
	private String home_xiangzhen;
	@Field("home_cun")
	private String home_cun;
	@Field("home_code")
	private String home_code;
	@Field("wenjuan_completetime")
	private String wenjuan_completetime;
	@Field("diaochayuan_name")
	private String diaochayuan_name;
	@Field("wenjuan_shenhetime")
	private String wenjuan_shenhetime;
	@Field("a_sex")
	private String a_sex;
	@Field("a_old")
	private String a_old;
	@Field("a_homeaddress")
	private String a_homeaddress;
	@Field("a_jiatingnum")
	private String a_jiatingnum;
	@Field("a_nongyenum")
	private String a_nongyenum;
	@Field("a_edu")
	private String a_edu;
	@Field("a_shouru")
	private String a_shouru;
	@Field("a_shouruzhongzhi")
	private String a_shouruzhongzhi;
	@Field("a_shourugongzi")
	private String a_shourugongzi;
	@Field("a_shourufenhong")
	private String a_shourufenhong;
	@Field("a_shourubutie")
	private String a_shourubutie;
	@Field("a_shouruqita")
	private String a_shouruqita;
	@Field("a_zhichu")
	private String a_zhichu;
	@Field("a_zhichuyi")
	private String a_zhichuyi;
	@Field("a_zhichuer")
	private String a_zhichuer;
	@Field("a_zhichusan")
	private String a_zhichusan;
	@Field("a_zhichuqita")
	private String a_zhichuqita;
	@Field("a_xiaofenzhiyueyi")
	private String a_xiaofenzhiyueyi;
	@Field("a_xiaofenzhiyueer")
	private String a_xiaofenzhiyueer;
	@Field("a_xiaofenzhiyuesan")
	private String a_xiaofenzhiyuesan;
	@Field("a_xiaofenqitazhiyue")
	private String a_xiaofenqitazhiyue;
	@Field("a_jiatingqitashouru")
	private String a_jiatingqitashouru;
	@Field("b_chengbaomushu")
	private String b_chengbaomushu;
	@Field("b_butiefei")
	private String b_butiefei;
	@Field("b_butiefeiliangshi")
	private String b_butiefeiliangshi;
	@Field("b_butiefeizonghe")
	private String b_butiefeizonghe;
	@Field("b_butiefeiliangzhong")
	private String b_butiefeiliangzhong;
	@Field("b_butiefeinongji")
	private String b_butiefeinongji;
	@Field("b_butiefeiqita")
	private String b_butiefeiqita;
	@Field("b_zhaijidinum")
	private String b_zhaijidinum;
	@Field("b_zujin")
	private String b_zujin;
	@Field("b_jingjichengyuan")
	private String b_jingjichengyuan;
	@Field("b_jjcyqita")
	private String b_jjcyqita;
	@Field("b_gufen")
	private String b_gufen;
	@Field("b_gufenqita")
	private String b_gufenqita;
	@Field("b_gufenfenhong")
	private String b_gufenfenhong;
	@Field("b_jitifuli")
	private String b_jitifuli;
	@Field("b_hezuosheif")
	private String b_hezuosheif;
	@Field("b_hezuoshefanyuif")
	private String b_hezuoshefanyuif;
	@Field("b_hezuosheyingli")
	private String b_hezuosheyingli;
	@Field("b_hezuoshexiaoguo")
	private String b_hezuoshexiaoguo;
	@Field("c_jiaoyufei")
	private String c_jiaoyufei;
	@Field("c_ybxnhyinum")
	private String c_ybxnhyinum;
	@Field("c_ybjbbxnum")
	private String c_ybjbbxnum;
	@Field("c_ybqita")
	private String c_ybqita;
	@Field("c_ybqitanum")
	private String c_ybqitanum;
	@Field("c_ybwcjyuanyin")
	private String c_ybwcjyuanyin;
	@Field("c_ybfei")
	private String c_ybfei;
	@Field("c_ylchengxiangnum")
	private String c_ylchengxiangnum;
	@Field("c_ylchengzhengnum")
	private String c_ylchengzhengnum;
	@Field("c_ylqita")
	private String c_ylqita;
	@Field("c_ylqitanum")
	private String c_ylqitanum;
	@Field("c_ylwcjyuanyin")
	private String c_ylwcjyuanyin;
	@Field("c_ylfei")
	private String c_ylfei;
	@Field("c_jiuyuefuwu")
	private String c_jiuyuefuwu;
	@Field("c_jiuyuefuwuqita")
	private String c_jiuyuefuwuqita;
	@Field("c_chengxiangbuzhuif")
	private String c_chengxiangbuzhuif;
	@Field("c_chengxiangbuzhufei")
	private String c_chengxiangbuzhufei;
	@Field("c_hulinyuanif")
	private String c_hulinyuanif;
	@Field("c_hulinyuanfei")
	private String c_hulinyuanfei;
	@Field("c_shuidianqifei")
	private String c_shuidianqifei;
	@Field("d_cunminghuiif")
	private String d_cunminghuiif;
	@Field("d_xuanjuif")
	private String d_xuanjuif;
	@Field("d_canxuanif")
	private String d_canxuanif;
	@Field("e_liangshimanyi")
	private String e_liangshimanyi;
	@Field("e_yishiyifeimanyi")
	private String e_yishiyifeimanyi;
	@Field("e_gongyigangweiif")
	private String e_gongyigangweiif;
	@Field("e_caizhengbuzhu")
	private String e_caizhengbuzhu;
	@Field("e_zuizhongyaoxiangmu")
	private String e_zuizhongyaoxiangmu;
	@Field("e_zuixuyaozhengce")
	private String e_zuixuyaozhengce;
	@Field("e_zuiyanzongweiti1")
	private String e_zuiyanzongweiti1;
	@Field("e_zuiyanzongweiti2")
	private String e_zuiyanzongweiti2;
	@Field("e_zuiyanzongweiti3")
	private String e_zuiyanzongweiti3;
	@Field("e_jiuyepeixun")
	private String e_jiuyepeixun;
	@Field("e_jiuyuepeixunqita")
	private String e_jiuyuepeixunqita;
	@Field("e_zhengequdao1")
	private String e_zhengequdao1;
	@Field("e_zhengequdao2")
	private String e_zhengequdao2;
	@Field("e_zhengequdao3")
	private String e_zhengequdao3;
	@Field("e_zhengequdaoqita")
	private String e_zhengequdaoqita;
	@Field("e_xuyaoxinxi")
	private String e_xuyaoxinxi;
	@Field("e_zhengcemanyi")
	private String e_zhengcemanyi;
	@Field("beiyong1")
	private String beiyong1;
	@Field("beiyong2")
	private String beiyong2;
	@Field("beiyong3")
	private String beiyong3;
	@Field("b_gufen1")
	private String b_gufen1;
	@Field("b_gufen2")
	private String b_gufen2;
	@Field("c_jiuyuefuwu1")
	private String c_jiuyuefuwu1;
	@Field("c_jiuyuefuwu2")
	private String c_jiuyuefuwu2;
	@Field("e_zuizhongyaoxiangmu1")
	private String e_zuizhongyaoxiangmu1;
	@Field("e_zuizhongyaoxiangmu2")
	private String e_zuizhongyaoxiangmu2;
	@Field("e_jiuyepeixun1")
	private String e_jiuyepeixun1;
	@Field("e_jiuyepeixun2")
	private String e_jiuyepeixun2;
	@Field("b_liuzhuandanjia")
	private String b_liuzhuandanjia;

	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
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

	public String getFilldate() {
		return filldate;
	}

	public void setFilldate(String filldate) {
		this.filldate = filldate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getGcy_xm() {
		return gcy_xm;
	}

	public void setGcy_xm(String gcy_xm) {
		this.gcy_xm = gcy_xm;
	}

	public String getXg_r() {
		return xg_r;
	}

	public void setXg_r(String xg_r) {
		this.xg_r = xg_r;
	}

	public String getXg_rq() {
		return xg_rq;
	}

	public void setXg_rq(String xg_rq) {
		this.xg_rq = xg_rq;
	}

	public String getWenjuanbianma() {
		return wenjuanbianma;
	}

	public void setWenjuanbianma(String wenjuanbianma) {
		this.wenjuanbianma = wenjuanbianma;
	}

	public String getXiangzhenbianma() {
		return xiangzhenbianma;
	}

	public void setXiangzhenbianma(String xiangzhenbianma) {
		this.xiangzhenbianma = xiangzhenbianma;
	}

	public String getCunbianma() {
		return cunbianma;
	}

	public void setCunbianma(String cunbianma) {
		this.cunbianma = cunbianma;
	}

	public String getZhuhubianma() {
		return zhuhubianma;
	}

	public void setZhuhubianma(String zhuhubianma) {
		this.zhuhubianma = zhuhubianma;
	}

	public String getShoufangzhe_name() {
		return shoufangzhe_name;
	}

	public void setShoufangzhe_name(String shoufangzhe_name) {
		this.shoufangzhe_name = shoufangzhe_name;
	}

	public String getShoufangzhe_phone() {
		return shoufangzhe_phone;
	}

	public void setShoufangzhe_phone(String shoufangzhe_phone) {
		this.shoufangzhe_phone = shoufangzhe_phone;
	}

	public String getHome_xiangzhen() {
		return home_xiangzhen;
	}

	public void setHome_xiangzhen(String home_xiangzhen) {
		this.home_xiangzhen = home_xiangzhen;
	}

	public String getHome_cun() {
		return home_cun;
	}

	public void setHome_cun(String home_cun) {
		this.home_cun = home_cun;
	}

	public String getHome_code() {
		return home_code;
	}

	public void setHome_code(String home_code) {
		this.home_code = home_code;
	}

	public String getWenjuan_completetime() {
		return wenjuan_completetime;
	}

	public void setWenjuan_completetime(String wenjuan_completetime) {
		this.wenjuan_completetime = wenjuan_completetime;
	}

	public String getDiaochayuan_name() {
		return diaochayuan_name;
	}

	public void setDiaochayuan_name(String diaochayuan_name) {
		this.diaochayuan_name = diaochayuan_name;
	}

	public String getWenjuan_shenhetime() {
		return wenjuan_shenhetime;
	}

	public void setWenjuan_shenhetime(String wenjuan_shenhetime) {
		this.wenjuan_shenhetime = wenjuan_shenhetime;
	}

	public String getA_sex() {
		return a_sex;
	}

	public void setA_sex(String a_sex) {
		this.a_sex = a_sex;
	}

	public String getA_old() {
		return a_old;
	}

	public void setA_old(String a_old) {
		this.a_old = a_old;
	}

	public String getA_homeaddress() {
		return a_homeaddress;
	}

	public void setA_homeaddress(String a_homeaddress) {
		this.a_homeaddress = a_homeaddress;
	}

	public String getA_jiatingnum() {
		return a_jiatingnum;
	}

	public void setA_jiatingnum(String a_jiatingnum) {
		this.a_jiatingnum = a_jiatingnum;
	}

	public String getA_nongyenum() {
		return a_nongyenum;
	}

	public void setA_nongyenum(String a_nongyenum) {
		this.a_nongyenum = a_nongyenum;
	}

	public String getA_edu() {
		return a_edu;
	}

	public void setA_edu(String a_edu) {
		this.a_edu = a_edu;
	}

	public String getA_shouru() {
		return a_shouru;
	}

	public void setA_shouru(String a_shouru) {
		this.a_shouru = a_shouru;
	}

	public String getA_shouruzhongzhi() {
		return a_shouruzhongzhi;
	}

	public void setA_shouruzhongzhi(String a_shouruzhongzhi) {
		this.a_shouruzhongzhi = a_shouruzhongzhi;
	}

	public String getA_shourugongzi() {
		return a_shourugongzi;
	}

	public void setA_shourugongzi(String a_shourugongzi) {
		this.a_shourugongzi = a_shourugongzi;
	}

	public String getA_shourufenhong() {
		return a_shourufenhong;
	}

	public void setA_shourufenhong(String a_shourufenhong) {
		this.a_shourufenhong = a_shourufenhong;
	}

	public String getA_shourubutie() {
		return a_shourubutie;
	}

	public void setA_shourubutie(String a_shourubutie) {
		this.a_shourubutie = a_shourubutie;
	}

	public String getA_shouruqita() {
		return a_shouruqita;
	}

	public void setA_shouruqita(String a_shouruqita) {
		this.a_shouruqita = a_shouruqita;
	}

	public String getA_zhichu() {
		return a_zhichu;
	}

	public void setA_zhichu(String a_zhichu) {
		this.a_zhichu = a_zhichu;
	}

	public String getA_zhichuyi() {
		return a_zhichuyi;
	}

	public void setA_zhichuyi(String a_zhichuyi) {
		this.a_zhichuyi = a_zhichuyi;
	}

	public String getA_zhichuer() {
		return a_zhichuer;
	}

	public void setA_zhichuer(String a_zhichuer) {
		this.a_zhichuer = a_zhichuer;
	}

	public String getA_zhichusan() {
		return a_zhichusan;
	}

	public void setA_zhichusan(String a_zhichusan) {
		this.a_zhichusan = a_zhichusan;
	}

	public String getA_zhichuqita() {
		return a_zhichuqita;
	}

	public void setA_zhichuqita(String a_zhichuqita) {
		this.a_zhichuqita = a_zhichuqita;
	}

	public String getA_xiaofenzhiyueyi() {
		return a_xiaofenzhiyueyi;
	}

	public void setA_xiaofenzhiyueyi(String a_xiaofenzhiyueyi) {
		this.a_xiaofenzhiyueyi = a_xiaofenzhiyueyi;
	}

	public String getA_xiaofenzhiyueer() {
		return a_xiaofenzhiyueer;
	}

	public void setA_xiaofenzhiyueer(String a_xiaofenzhiyueer) {
		this.a_xiaofenzhiyueer = a_xiaofenzhiyueer;
	}

	public String getA_xiaofenzhiyuesan() {
		return a_xiaofenzhiyuesan;
	}

	public void setA_xiaofenzhiyuesan(String a_xiaofenzhiyuesan) {
		this.a_xiaofenzhiyuesan = a_xiaofenzhiyuesan;
	}

	public String getA_xiaofenqitazhiyue() {
		return a_xiaofenqitazhiyue;
	}

	public void setA_xiaofenqitazhiyue(String a_xiaofenqitazhiyue) {
		this.a_xiaofenqitazhiyue = a_xiaofenqitazhiyue;
	}

	public String getA_jiatingqitashouru() {
		return a_jiatingqitashouru;
	}

	public void setA_jiatingqitashouru(String a_jiatingqitashouru) {
		this.a_jiatingqitashouru = a_jiatingqitashouru;
	}

	public String getB_chengbaomushu() {
		return b_chengbaomushu;
	}

	public void setB_chengbaomushu(String b_chengbaomushu) {
		this.b_chengbaomushu = b_chengbaomushu;
	}

	public String getB_butiefei() {
		return b_butiefei;
	}

	public void setB_butiefei(String b_butiefei) {
		this.b_butiefei = b_butiefei;
	}

	public String getB_butiefeiliangshi() {
		return b_butiefeiliangshi;
	}

	public void setB_butiefeiliangshi(String b_butiefeiliangshi) {
		this.b_butiefeiliangshi = b_butiefeiliangshi;
	}

	public String getB_butiefeizonghe() {
		return b_butiefeizonghe;
	}

	public void setB_butiefeizonghe(String b_butiefeizonghe) {
		this.b_butiefeizonghe = b_butiefeizonghe;
	}

	public String getB_butiefeiliangzhong() {
		return b_butiefeiliangzhong;
	}

	public void setB_butiefeiliangzhong(String b_butiefeiliangzhong) {
		this.b_butiefeiliangzhong = b_butiefeiliangzhong;
	}

	public String getB_butiefeinongji() {
		return b_butiefeinongji;
	}

	public void setB_butiefeinongji(String b_butiefeinongji) {
		this.b_butiefeinongji = b_butiefeinongji;
	}

	public String getB_butiefeiqita() {
		return b_butiefeiqita;
	}

	public void setB_butiefeiqita(String b_butiefeiqita) {
		this.b_butiefeiqita = b_butiefeiqita;
	}

	public String getB_zhaijidinum() {
		return b_zhaijidinum;
	}

	public void setB_zhaijidinum(String b_zhaijidinum) {
		this.b_zhaijidinum = b_zhaijidinum;
	}

	public String getB_zujin() {
		return b_zujin;
	}

	public void setB_zujin(String b_zujin) {
		this.b_zujin = b_zujin;
	}

	public String getB_jingjichengyuan() {
		return b_jingjichengyuan;
	}

	public void setB_jingjichengyuan(String b_jingjichengyuan) {
		this.b_jingjichengyuan = b_jingjichengyuan;
	}

	public String getB_jjcyqita() {
		return b_jjcyqita;
	}

	public void setB_jjcyqita(String b_jjcyqita) {
		this.b_jjcyqita = b_jjcyqita;
	}

	public String getB_gufen() {
		return b_gufen;
	}

	public void setB_gufen(String b_gufen) {
		this.b_gufen = b_gufen;
	}

	public String getB_gufenqita() {
		return b_gufenqita;
	}

	public void setB_gufenqita(String b_gufenqita) {
		this.b_gufenqita = b_gufenqita;
	}

	public String getB_gufenfenhong() {
		return b_gufenfenhong;
	}

	public void setB_gufenfenhong(String b_gufenfenhong) {
		this.b_gufenfenhong = b_gufenfenhong;
	}

	public String getB_jitifuli() {
		return b_jitifuli;
	}

	public void setB_jitifuli(String b_jitifuli) {
		this.b_jitifuli = b_jitifuli;
	}

	public String getB_hezuosheif() {
		return b_hezuosheif;
	}

	public void setB_hezuosheif(String b_hezuosheif) {
		this.b_hezuosheif = b_hezuosheif;
	}

	public String getB_hezuoshefanyuif() {
		return b_hezuoshefanyuif;
	}

	public void setB_hezuoshefanyuif(String b_hezuoshefanyuif) {
		this.b_hezuoshefanyuif = b_hezuoshefanyuif;
	}

	public String getB_hezuosheyingli() {
		return b_hezuosheyingli;
	}

	public void setB_hezuosheyingli(String b_hezuosheyingli) {
		this.b_hezuosheyingli = b_hezuosheyingli;
	}

	public String getB_hezuoshexiaoguo() {
		return b_hezuoshexiaoguo;
	}

	public void setB_hezuoshexiaoguo(String b_hezuoshexiaoguo) {
		this.b_hezuoshexiaoguo = b_hezuoshexiaoguo;
	}

	public String getC_jiaoyufei() {
		return c_jiaoyufei;
	}

	public void setC_jiaoyufei(String c_jiaoyufei) {
		this.c_jiaoyufei = c_jiaoyufei;
	}

	public String getC_ybxnhyinum() {
		return c_ybxnhyinum;
	}

	public void setC_ybxnhyinum(String c_ybxnhyinum) {
		this.c_ybxnhyinum = c_ybxnhyinum;
	}

	public String getC_ybjbbxnum() {
		return c_ybjbbxnum;
	}

	public void setC_ybjbbxnum(String c_ybjbbxnum) {
		this.c_ybjbbxnum = c_ybjbbxnum;
	}

	public String getC_ybqita() {
		return c_ybqita;
	}

	public void setC_ybqita(String c_ybqita) {
		this.c_ybqita = c_ybqita;
	}

	public String getC_ybqitanum() {
		return c_ybqitanum;
	}

	public void setC_ybqitanum(String c_ybqitanum) {
		this.c_ybqitanum = c_ybqitanum;
	}

	public String getC_ybwcjyuanyin() {
		return c_ybwcjyuanyin;
	}

	public void setC_ybwcjyuanyin(String c_ybwcjyuanyin) {
		this.c_ybwcjyuanyin = c_ybwcjyuanyin;
	}

	public String getC_ybfei() {
		return c_ybfei;
	}

	public void setC_ybfei(String c_ybfei) {
		this.c_ybfei = c_ybfei;
	}

	public String getC_ylchengxiangnum() {
		return c_ylchengxiangnum;
	}

	public void setC_ylchengxiangnum(String c_ylchengxiangnum) {
		this.c_ylchengxiangnum = c_ylchengxiangnum;
	}

	public String getC_ylchengzhengnum() {
		return c_ylchengzhengnum;
	}

	public void setC_ylchengzhengnum(String c_ylchengzhengnum) {
		this.c_ylchengzhengnum = c_ylchengzhengnum;
	}

	public String getC_ylqita() {
		return c_ylqita;
	}

	public void setC_ylqita(String c_ylqita) {
		this.c_ylqita = c_ylqita;
	}

	public String getC_ylqitanum() {
		return c_ylqitanum;
	}

	public void setC_ylqitanum(String c_ylqitanum) {
		this.c_ylqitanum = c_ylqitanum;
	}

	public String getC_ylwcjyuanyin() {
		return c_ylwcjyuanyin;
	}

	public void setC_ylwcjyuanyin(String c_ylwcjyuanyin) {
		this.c_ylwcjyuanyin = c_ylwcjyuanyin;
	}

	public String getC_ylfei() {
		return c_ylfei;
	}

	public void setC_ylfei(String c_ylfei) {
		this.c_ylfei = c_ylfei;
	}

	public String getC_jiuyuefuwu() {
		return c_jiuyuefuwu;
	}

	public void setC_jiuyuefuwu(String c_jiuyuefuwu) {
		this.c_jiuyuefuwu = c_jiuyuefuwu;
	}

	public String getC_jiuyuefuwuqita() {
		return c_jiuyuefuwuqita;
	}

	public void setC_jiuyuefuwuqita(String c_jiuyuefuwuqita) {
		this.c_jiuyuefuwuqita = c_jiuyuefuwuqita;
	}

	public String getC_chengxiangbuzhuif() {
		return c_chengxiangbuzhuif;
	}

	public void setC_chengxiangbuzhuif(String c_chengxiangbuzhuif) {
		this.c_chengxiangbuzhuif = c_chengxiangbuzhuif;
	}

	public String getC_chengxiangbuzhufei() {
		return c_chengxiangbuzhufei;
	}

	public void setC_chengxiangbuzhufei(String c_chengxiangbuzhufei) {
		this.c_chengxiangbuzhufei = c_chengxiangbuzhufei;
	}

	public String getC_hulinyuanif() {
		return c_hulinyuanif;
	}

	public void setC_hulinyuanif(String c_hulinyuanif) {
		this.c_hulinyuanif = c_hulinyuanif;
	}

	public String getC_hulinyuanfei() {
		return c_hulinyuanfei;
	}

	public void setC_hulinyuanfei(String c_hulinyuanfei) {
		this.c_hulinyuanfei = c_hulinyuanfei;
	}

	public String getC_shuidianqifei() {
		return c_shuidianqifei;
	}

	public void setC_shuidianqifei(String c_shuidianqifei) {
		this.c_shuidianqifei = c_shuidianqifei;
	}

	public String getD_cunminghuiif() {
		return d_cunminghuiif;
	}

	public void setD_cunminghuiif(String d_cunminghuiif) {
		this.d_cunminghuiif = d_cunminghuiif;
	}

	public String getD_xuanjuif() {
		return d_xuanjuif;
	}

	public void setD_xuanjuif(String d_xuanjuif) {
		this.d_xuanjuif = d_xuanjuif;
	}

	public String getD_canxuanif() {
		return d_canxuanif;
	}

	public void setD_canxuanif(String d_canxuanif) {
		this.d_canxuanif = d_canxuanif;
	}

	public String getE_liangshimanyi() {
		return e_liangshimanyi;
	}

	public void setE_liangshimanyi(String e_liangshimanyi) {
		this.e_liangshimanyi = e_liangshimanyi;
	}

	public String getE_yishiyifeimanyi() {
		return e_yishiyifeimanyi;
	}

	public void setE_yishiyifeimanyi(String e_yishiyifeimanyi) {
		this.e_yishiyifeimanyi = e_yishiyifeimanyi;
	}

	public String getE_gongyigangweiif() {
		return e_gongyigangweiif;
	}

	public void setE_gongyigangweiif(String e_gongyigangweiif) {
		this.e_gongyigangweiif = e_gongyigangweiif;
	}

	public String getE_caizhengbuzhu() {
		return e_caizhengbuzhu;
	}

	public void setE_caizhengbuzhu(String e_caizhengbuzhu) {
		this.e_caizhengbuzhu = e_caizhengbuzhu;
	}

	public String getE_zuizhongyaoxiangmu() {
		return e_zuizhongyaoxiangmu;
	}

	public void setE_zuizhongyaoxiangmu(String e_zuizhongyaoxiangmu) {
		this.e_zuizhongyaoxiangmu = e_zuizhongyaoxiangmu;
	}

	public String getE_zuixuyaozhengce() {
		return e_zuixuyaozhengce;
	}

	public void setE_zuixuyaozhengce(String e_zuixuyaozhengce) {
		this.e_zuixuyaozhengce = e_zuixuyaozhengce;
	}

	public String getE_zuiyanzongweiti1() {
		return e_zuiyanzongweiti1;
	}

	public void setE_zuiyanzongweiti1(String e_zuiyanzongweiti1) {
		this.e_zuiyanzongweiti1 = e_zuiyanzongweiti1;
	}

	public String getE_zuiyanzongweiti2() {
		return e_zuiyanzongweiti2;
	}

	public void setE_zuiyanzongweiti2(String e_zuiyanzongweiti2) {
		this.e_zuiyanzongweiti2 = e_zuiyanzongweiti2;
	}

	public String getE_zuiyanzongweiti3() {
		return e_zuiyanzongweiti3;
	}

	public void setE_zuiyanzongweiti3(String e_zuiyanzongweiti3) {
		this.e_zuiyanzongweiti3 = e_zuiyanzongweiti3;
	}

	public String getE_jiuyepeixun() {
		return e_jiuyepeixun;
	}

	public void setE_jiuyepeixun(String e_jiuyepeixun) {
		this.e_jiuyepeixun = e_jiuyepeixun;
	}

	public String getE_jiuyuepeixunqita() {
		return e_jiuyuepeixunqita;
	}

	public void setE_jiuyuepeixunqita(String e_jiuyuepeixunqita) {
		this.e_jiuyuepeixunqita = e_jiuyuepeixunqita;
	}

	public String getE_zhengequdao1() {
		return e_zhengequdao1;
	}

	public void setE_zhengequdao1(String e_zhengequdao1) {
		this.e_zhengequdao1 = e_zhengequdao1;
	}

	public String getE_zhengequdao2() {
		return e_zhengequdao2;
	}

	public void setE_zhengequdao2(String e_zhengequdao2) {
		this.e_zhengequdao2 = e_zhengequdao2;
	}

	public String getE_zhengequdao3() {
		return e_zhengequdao3;
	}

	public void setE_zhengequdao3(String e_zhengequdao3) {
		this.e_zhengequdao3 = e_zhengequdao3;
	}

	public String getE_zhengequdaoqita() {
		return e_zhengequdaoqita;
	}

	public void setE_zhengequdaoqita(String e_zhengequdaoqita) {
		this.e_zhengequdaoqita = e_zhengequdaoqita;
	}

	public String getE_xuyaoxinxi() {
		return e_xuyaoxinxi;
	}

	public void setE_xuyaoxinxi(String e_xuyaoxinxi) {
		this.e_xuyaoxinxi = e_xuyaoxinxi;
	}

	public String getE_zhengcemanyi() {
		return e_zhengcemanyi;
	}

	public void setE_zhengcemanyi(String e_zhengcemanyi) {
		this.e_zhengcemanyi = e_zhengcemanyi;
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

	public String getC_jiuyuefuwu1() {
		return c_jiuyuefuwu1;
	}

	public void setC_jiuyuefuwu1(String c_jiuyuefuwu1) {
		this.c_jiuyuefuwu1 = c_jiuyuefuwu1;
	}

	public String getC_jiuyuefuwu2() {
		return c_jiuyuefuwu2;
	}

	public void setC_jiuyuefuwu2(String c_jiuyuefuwu2) {
		this.c_jiuyuefuwu2 = c_jiuyuefuwu2;
	}

	public String getE_zuizhongyaoxiangmu1() {
		return e_zuizhongyaoxiangmu1;
	}

	public void setE_zuizhongyaoxiangmu1(String e_zuizhongyaoxiangmu1) {
		this.e_zuizhongyaoxiangmu1 = e_zuizhongyaoxiangmu1;
	}

	public String getE_zuizhongyaoxiangmu2() {
		return e_zuizhongyaoxiangmu2;
	}

	public void setE_zuizhongyaoxiangmu2(String e_zuizhongyaoxiangmu2) {
		this.e_zuizhongyaoxiangmu2 = e_zuizhongyaoxiangmu2;
	}

	public String getE_jiuyepeixun1() {
		return e_jiuyepeixun1;
	}

	public void setE_jiuyepeixun1(String e_jiuyepeixun1) {
		this.e_jiuyepeixun1 = e_jiuyepeixun1;
	}

	public String getE_jiuyepeixun2() {
		return e_jiuyepeixun2;
	}

	public void setE_jiuyepeixun2(String e_jiuyepeixun2) {
		this.e_jiuyepeixun2 = e_jiuyepeixun2;
	}

	public String getB_liuzhuandanjia() {
		return b_liuzhuandanjia;
	}

	public void setB_liuzhuandanjia(String b_liuzhuandanjia) {
		this.b_liuzhuandanjia = b_liuzhuandanjia;
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
		Nyhjrywj other = (Nyhjrywj) obj;
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
