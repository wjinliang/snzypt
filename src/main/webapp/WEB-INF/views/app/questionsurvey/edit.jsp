<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>欢迎来到北京涉农平台</title>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/layout.css">
<link rel="stylesheet" type="text/css" href="static/css/canvasbg.css">
<link rel="stylesheet" type="text/css" href="static/css/checkbox.css">
<script type="text/javascript" src="static/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/agricultureScroller.js"></script>
<script type="text/javascript" src="static/js/vector.js"></script>
<script>
/*canvas动画效果开始*/
$(function(){
	var victor = new Victor("container", "output");
	var theme = [
			["#f1f1f1", "#005584"],
			["#35ac03", "#3f4303"],
			["#ac0908", "#cd5726"],
			["#18bbff", "#00486b"]
		]
	$(".color li").each(function(index, val) {
		var color = theme[index];
		 $(this).mouseover(function(){
			victor(color).set();
		 })
	});
});
/*canvas动画效果结束*/
</script>
</head>
<body>
	<div class="header">
    	<div class="head-top">
        	<div class="container">
            	<div class="row">
                	<span>您好,欢迎光临北京市涉农资源平台</span>
                    <a href="javasrcipt:void(0)">登录</a>|
                    <a href="javascript:void(0)">免费注册</a>
                </div>
            </div>
        </div>
        <div class="head-bottom">
        	<div class="container">
            	<div class="row">
                	<div>
                        <span><img src="static/image/logo.png"></span>
                        <ul class="nav nav-pills alter-nav">
                            <li><a href="">首页</a></li>
                            <li><a href="">数据资源</a></li>
                            <li><a href="">数据专题</a></li>
                            <li><a href="">地图服务</a></li>
                            <li class="active"><a href="">互动交流</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="container"><div id="output"></div></div>
        </div>
    </div>
    <div class="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<ul class="interact-list clearfix">
                	<li style="padding-left:0px;"><a href="" target="_blank">资料下载<br>DOWLOAD</a></li>
                    <li><a href="" target="_blank">数据共享<br>DATA SHARE</a></li>
                    <li><a href="" target="_blank">问卷调查<br>SURVEY</a></li>
                    <li style="padding-right:0px;"><a href="" target="_blank">意见反馈<br>FEED BACK</a></li>
                </ul>
            </div>
            <div class="row mgt15">
            	<div class="item-title clearfix alter-title">
                     <div class="item-title-partl icon6 pull-left">
                         <span>问卷调查</span>
                     </div>
               </div>
               <div class="option-con">
               		<form action="" method="post" class="style-name">
                    	<ul>
                        	<li>
                            	<span>需求标题</span>
                            	<input id="topic" type="text" name="topic"/>
                            </li>
                            <li>
                            	<span>电子邮件</span>
                            	<input id="email" type="email" name="email"/>
                            </li>
                            <li class="clearfix">
                                <span>需求类型</span>
                                <div class="pull-left" style="width:70%;">
                                    <label for="demond-1"><input type="checkbox" id="demond-1" name="demond" value=""><i>数据</i></label>
                                    <label for="demond-2"><input type="checkbox" id="demond-2" name="demond" value=""><i>应用</i></label>
                                    <label for="demond-3"><input type="checkbox" id="demond-3" name="demond" value=""><i>接口</i></label>
                               </div>
                            </li>
                            <li class="clearfix">
                                <span>委办局</span>
                                <div class="pull-left" style="width:70%;">
                                    <label for="commition-1"><input type="checkbox" id="commition-1" name="commition" value=""><i>社会局</i></label>
                                    <label for="commition-2"><input type="checkbox" id="commition-2" name="commition" value=""><i>金融处</i></label>
                                    <label for="commition-3"><input type="checkbox" id="commition-3" name="commition" value=""><i>城乡发展处</i></label>
                                    <label for="commition-4"><input type="checkbox" id="commition-4" name="commition" value=""><i>经济体制处</i></label>
                                    <label for="commition-5"><input type="checkbox" id="commition-5" name="commition" value=""><i>农村经济统计处</i></label>
                                    <label for="commition-6"><input type="checkbox" id="commition-6" name="commition" value=""><i>农村经济统计处</i></label>
                                    <label for="commition-7"><input type="checkbox" id="commition-7" name="commition" value=""><i>北京市城乡经济信息中心</i></label>
                                    <label for="commition-8"><input type="checkbox" id="commition-8" name="commition" value=""><i>资源与区划处</i></label>
                                <div>
                            </li>
                            <li>
                                <span>功能描述</span>
                                <textarea id="funDescrip" name="funDescrip" style="height:190px;"></textarea>
                            </li>
                            <li style="text-align:center; margin-bottom:10px;">
                            	<span>&nbsp;</span>
                            	<button>提交</button>
                            </li>
                        </ul>
                    </form>
               </div>
            </div>
        </div>
    </div>
    <!--footer开始-->
    <div class="footer">
        <div class="container">
            <div class="row">
            	<div class="footer-top">
                	<div class="bg-gray clearfix">
                    	<span>友情链接&nbsp;LINKS</span>	
                    	<ul class="footer-list">
                        	<li>
                            	<select name="country" id="country">
                                  	<option value ="国家部委网站" disabled="disabled" selected="selected">国家部委网站</option>
                                  	<option value ="http://www.gov.cn">中央政府门户网站</option>
                                    <option value="http://www.gov.cn">中央政府门户网站</option>
            
                                    <option value="http://www.mfa.gov.cn/web/">外交部</option>
            
                                    <option value="http://www.mod.gov.cn">国防部</option>
            
                                    <option value="http://www.ndrc.gov.cn/">国家发展改革委</option>
            
                                    <option value="http://www.moe.gov.cn/">教育部</option>
            
                                    <option value="http://www.most.gov.cn/">科技部</option>
            
                                    <option value="http://www.miit.gov.cn/">工业和信息化部</option>
            
                                    <option value="http://www.seac.gov.cn/ ">国家民委</option>
            
                                    <option value="http://www.mps.gov.cn/">公安部</option>
            
                                    <option value="http://www.ccdi.gov.cn/">监察部</option>
            
                                    <option value="http://www.mca.gov.cn/ ">民政部</option>
            
                                    <option value="http://www.moj.gov.cn/">司法部</option>
            
                                    <option value="http://www.mof.gov.cn/">财政部</option>
            
                                    <option value="http://www.mohrss.gov.cn/">人力资源社会保障部</option>
            
                                    <option value="http://www.mlr.gov.cn/">国土资源部</option>
            
                                    <option value="http://www.mep.gov.cn/">环境保护部</option>
            
                                    <option value="http://www.mohurd.gov.cn/">住房城乡建设部</option>
            
                                    <option value="http://www.moc.gov.cn/">交通运输部</option>
            
                                    <option value="http://www.mwr.gov.cn/">水利部</option>
            
                                    <option value="http://www.moa.gov.cn/">农业部</option>
            
                                    <option value="http://www.mofcom.gov.cn ">商务部</option>
            
                                    <option value="http://www.mcprc.gov.cn/">文化部</option>
            
                                    <option value="http://www.nhfpc.gov.cn/">卫生计生委</option>
            
                                    <option value="http://www.pbc.gov.cn/">人民银行</option>
            
                                    <option value="http://www.audit.gov.cn/">审计署</option>
            
                                    <option value="http://www.china-language.gov.cn/">国家语委</option>
            
                                    <option value="http://www.cnsa.gov.cn">航天局</option>
            
                                    <option value="http://www.caea.gov.cn">原子能机构</option>
            
                                    <option value="http://www.sasac.gov.cn/">国资委</option>
            
                                    <option value="http://www.customs.gov.cn/">海关总署</option>
            
                                    <option value="http://www.chinatax.gov.cn/">税务总局</option>
            
                                    <option value="http://www.saic.gov.cn">工商总局</option>
            
                                    <option value="http://www.aqsiq.gov.cn/">质检总局</option>
            
                                    <option value="http://www.sapprft.gov.cn/">新闻出版广电总局</option>
            
                                    <option value="http://www.sport.gov.cn/">体育总局</option>
            
                                    <option value="http://www.chinasafety.gov.cn/">安全监管总局</option>
            
                                    <option value="http://www.sda.gov.cn/WS01/CL0001/">食品药品监管总局</option>
            
                                    <option value="http://www.stats.gov.cn/">统计局</option>
            
                                    <option value="http://www.forestry.gov.cn/">林业局</option>
            
                                    <option value="http://www.sipo.gov.cn/">知识产权局</option>
            
                                    <option value="http://www.cnta.gov.cn/">旅游局</option>
            
                                    <option value="http://www.sara.gov.cn/">宗教局</option>
            
                                    <option value="http://www.counsellor.gov.cn/">参事室</option>
            
                                    <option value="http://www.ggj.gov.cn/">国管局</option>
            
                                    <option value="http://www.ncac.gov.cn/">版权局</option>
            
                                    <option value="http://www.gqb.gov.cn/">侨办</option>
            
                                    <option value="http://www.hmo.gov.cn/">港澳办</option>
            
                                    <option value="http://www.chinalaw.gov.cn/">法制办</option>
            
                                    <option value="http://www.gov.cn/guoqing/2005-12/26/content_2652073.htm">国研室</option>
            
                                    <option value="http://www.gwytb.gov.cn/">台办</option>
            
                                    <option value="http://www.scio.gov.cn">新闻办</option>
            
                                    <option value="http://www.xinhuanet.com/">新华社</option>
            
                                    <option value="http://www.cas.cn/">中科院</option>
            
                                    <option value="http://cass.cssn.cn/">社科院</option>
            
                                    <option value="http://www.cae.cn/">工程院</option>
            
                                    <option value="http://www.drc.gov.cn/">发展研究中心</option>
            
                                    <option value="http://www.nsa.gov.cn/">行政学院</option>
            
                                    <option value="http://www.cea.gov.cn/">地震局</option>
            
                                    <option value="http://www.cma.gov.cn/">气象局</option>
            
                                    <option value="http://www.cbrc.gov.cn/">银监会</option>
            
                                    <option value="http://www.csrc.gov.cn/">证监会</option>
            
                                    <option value="http://www.circ.gov.cn/">保监会</option>
            
                                    <option value="http://www.ssf.gov.cn/">社保基金会</option>
            
                                    <option value="http://www.nsfc.gov.cn">自然科学基金会</option>
            
                                    <option value="http://www.gjxfj.gov.cn/">信访局</option>
            
                                    <option value="http://www.chinagrain.gov.cn/">粮食局</option>
            
                                    <option value="http://www.nea.gov.cn/">能源局</option>
            
                                    <option value="http://www.sastind.gov.cn/">国防科工局</option>
            
                                    <option value="http://www.tobacco.gov.cn/">烟草局</option>
            
                                    <option value="http://www.safea.gov.cn/">外专局</option>
            
                                    <option value="http://www.scs.gov.cn/">公务员局</option>
            
                                    <option value="http://www.soa.gov.cn/">海洋局</option>
            
                                    <option value="http://www.sbsm.gov.cn/">测绘地信局</option>
            
                                    <option value="http://www.nra.gov.cn/">铁路局</option>
            
                                    <option value="http://www.caac.gov.cn/">民航局</option>
            
                                    <option value="http://www.spb.gov.cn/">邮政局</option>
            
                                    <option value="http://www.sach.gov.cn/">文物局</option>
            
                                    <option value="http://www.satcm.gov.cn/">中医药局</option>
            
                                    <option value="http://www.safe.gov.cn/">外汇局</option>
            
                                    <option value="http://www.chinacoal-safety.gov.cn/mkaj/">煤矿安监局</option>
            
                                    <option value="http://www.saac.gov.cn/">档案局</option>
            
                                    <option value="http://www.oscca.gov.cn/">密码局</option>
            
                                    <option value="http://www.nsbd.gov.cn/">南水北调办</option>
            
                                    <option value="http://www.3g.gov.cn/index.ycs">三峡办</option>
            
                                    <option value="http://www.cpad.gov.cn">扶贫办</option>
                                </select>
                            </li>
                            <li>
                            	<select name="capital" id="capital">
                                	<option value ="全国省会城市网站" disabled="disabled" selected="selected">全国省会城市网站</option>
                                  	<option value="http://www.tj.gov.cn/">天津</option>
                                    <option value="http://www.hebei.gov.cn">河北</option>
                                    <option value="http://www.shanxigov.cn/">山西</option>
                                    <option value="http://www.nmg.gov.cn/">内蒙古</option>
                                    <option value="http://www.ln.gov.cn/">辽宁</option>
                                    <option value="http://www.jl.gov.cn/">吉林</option>
                                    <option value="http://www.hlj.gov.cn/">黑龙江</option>
                                </select>
                            </li>
                            <li>
                            	<select name="province-gover" id="province-gover">
                                	<option value ="省政府及厅局网站" disabled="disabled" selected="selected">省政府及厅局网站</option>
                                  	<option value="http://www.tj.gov.cn/">天津</option>
                                    <option value="http://www.hebei.gov.cn">河北</option>
                                    <option value="http://www.shanxigov.cn/">山西</option>
                                </select>
                            </li>
                            <li>
                            	<select name="local-city" id="local-city">
                                	<option value ="本省市州政府网站" disabled="disabled" selected="selected">本省市州政府网站</option>
                                  	<option value="http://www.tj.gov.cn/">天津</option>
                                    <option value="http://www.hebei.gov.cn">河北</option>
                                    <option value="http://www.shanxigov.cn/">山西</option>
                                </select>
                            </li>
                            <li>
                            	<select name="news-media" id="news-media">
                                	<option value ="新闻媒体网站" disabled="disabled" selected="selected">新闻媒体网站</option>
                                  	<option value="http://www.news.cn">新华网</option>
                                    <option value="http://www.people.com.cn/">人民网</option>
                                    <option value="http://www.cctv.com/">央视国际</option>
                                    <option value="http://www.cnr.cn/">中央人民广播电台</option>
                                </select>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                	<p>北京市农村合作经济经营管理办公室（北京市农村经济研究中心）主办 </p>
                    <p>北京市城乡经济信息中心技术支持</p>
                    <p>ICP备案编号：京ICP备14052074号-1 京公网安备11010502026407</p>
                </div>        	
            </div>
        </div>
    </div>
    <!--footer结束-->
<script type="text/javascript" src="static/js/webindex.js"></script>
</body>
</html>
