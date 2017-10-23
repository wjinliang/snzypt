<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
    String realPath = request.getSession().getServletContext().getRealPath(""); 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>欢迎来到北京涉农平台</title>
<link rel="stylesheet" type="text/css" href="/html/sn-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/layout.css">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/canvasbg.css">
<script type="text/javascript" src="/html/sn-static/static/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="/html/sn-static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/html/sn-static/static/js/vector.js"></script>
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
                        <span><img src="/html/sn-static/static/image/logo.png"></span>
                        <ul class="nav nav-pills alter-nav">
                            <li><a href="">首页</a></li>
                            <li><a href="">数据资源</a></li>
                            <li class="active"><a href="">数据专题</a></li>
                            <li><a href="">地图服务</a></li>
                            <li><a href="">互动交流</a></li>
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
            	<div class="col-md-4 col-lg-4">
                	<div class="dataSubjt-left">
                    	<img src="/html/sn-static/static/image/sjzt1.png" width="100%" height="170">
                        <div class="serveSubjt-con mgt15">
                        	<h3><a href="" target="_blank">乡村信息服务专题</a></h3>
                            <p class="pText">村情综合信息服务以提供全市村情综合信息服务为主，所有以村为单位的相关信息都通过该途径进行展示并给用户提供相关数据服务。</p>
                        </div>	
                    </div>
                </div>
                <div class="col-md-8 col-lg-8">
                	<div class="dataSubjt-right">
                    	<ul class="dataSubjt-right-top clearfix">
                        	<li>
                            	<div class="panel-body">
                                    <p>农村总数</p>
                                    <div style="text-align:center;">
                                        <i class="ico1">&nbsp;</i>
                                        <span class="num" id="num1">120000</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>常驻人口</p>
                                    <div style="text-align:center;">
                                        <i class="ico2">&nbsp;</i>
                                        <span class="num" id="num2">2000000</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>经济收入</p>
                                    <div style="text-align:center;">
                                        <i class="ico3">&nbsp;</i>
                                        <span class="num" id="num3">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农业用地</p>
                                    <div style="text-align:center;">
                                        <i class="ico4">&nbsp;</i>
                                        <span class="num" id="num4">66666666</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>涉农企业</p>
                                    <div style="text-align:center;">
                                        <i class="ico5">&nbsp;</i>
                                        <span class="num" id="num5">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                        </ul>
                        <ul class="dataSubjt-right-bottom clearfix">
                        	<li>
                            	<div class="panel-body">
                                	<i class="ico01">&nbsp;</i>
                                    <a href="" target="_blank">基本信息</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico02">&nbsp;</i>
                                    <a href="" target="_blank">种植生产</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico03">&nbsp;</i>
                                    <a href="" target="_blank">自然资源</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico04">&nbsp;</i>
                                    <a href="" target="_blank">畜牧养殖</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico05">&nbsp;</i>
                                    <a href="" target="_blank">村务信息</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico06">&nbsp;</i>
                                    <a href="" target="_blank">市场资源</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico07">&nbsp;</i>
                                    <a href="" target="_blank">农业科技</a>	
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="border-gray mgt15"></div>
            <div class="row mgt15">
            	<div class="col-md-4 col-lg-4">
                	<div class="dataSubjt-left">
                    	<img src="/html/sn-static/static/image/sjzt2.png" width="100%" height="170">
                        <div class="serveSubjt-con mgt15">
                        	<h3><a href="" target="_blank">农业生产布局专题</a></h3>
                            <p class="pText">村情综合信息服务以提供全市村情综合信息服务为主，所有以村为单位的相关信息都通过该途径进行展示并给用户提供相关数据服务。</p>
                        </div>	
                    </div>
                </div>
                <div class="col-md-8 col-lg-8">
                	<div class="dataSubjt-right">
                    	<ul class="dataSubjt-right-top clearfix">
                        	<li>
                            	<div class="panel-body">
                                    <p>设施农业面积</p>
                                    <div style="text-align:center;">
                                        <i class="ico21">&nbsp;</i>
                                        <span class="num" id="num021">120000</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>大田种植面积</p>
                                    <div style="text-align:center;">
                                        <i class="ico22">&nbsp;</i>
                                        <span class="num" id="num022">2000000</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农产品总产量</p>
                                    <div style="text-align:center;">
                                        <i class="ico23">&nbsp;</i>
                                        <span class="num" id="num023">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农产品净值</p>
                                    <div style="text-align:center;">
                                        <i class="ico24">&nbsp;</i>
                                        <span class="num" id="num024">66666666</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农产品成本</p>
                                    <div style="text-align:center;">
                                        <i class="ico25">&nbsp;</i>
                                        <span class="num" id="num025">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农业劳动生产率</p>
                                    <div style="text-align:center;">
                                        <i class="ico26">&nbsp;</i>
                                        <span class="num" id="num026">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                        </ul>
                        <ul class="dataSubjt-right-bottom clearfix">
                        	<li>
                            	<div class="panel-body">
                                	<i class="ico11">&nbsp;</i>
                                    <a href="" target="_blank">生产分布地图</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico12">&nbsp;</i>
                                    <a href="" target="_blank">设施环境监控</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico13">&nbsp;</i>
                                    <a href="" target="_blank">视频环境监控</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico14">&nbsp;</i>
                                    <a href="" target="_blank">生产布局统计</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico15">&nbsp;</i>
                                    <a href="" target="_blank">农业生产模型</a>	
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="border-gray mgt15"></div>
            <div class="row mgt15">
            	<div class="col-md-4 col-lg-4">
                	<div class="dataSubjt-left">
                    	<img src="/html/sn-static/static/image/sjzt3.png" width="100%" height="170">
                        <div class="serveSubjt-con mgt15">
                        	<h3><a href="" target="_blank">休闲农业及乡村旅游专题</a></h3>
                            <p class="pText">村情综合信息服务以提供全市村情综合信息服务为主，所有以村为单位的相关信息都通过该途径进行展示并给用户提供相关数据服务。</p>
                        </div>	
                    </div>
                </div>
                <div class="col-md-8 col-lg-8">
                	<div class="dataSubjt-right">
                    	<ul class="dataSubjt-right-top clearfix">
                        	<li>
                            	<div class="panel-body">
                                    <p>农业园区数目</p>
                                    <div style="text-align:center;">
                                        <i class="ico31">&nbsp;</i>
                                        <span class="num" id="num021">120000</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>休闲农业经营主体数</p>
                                    <div style="text-align:center;">
                                        <i class="ico32">&nbsp;</i>
                                        <span class="num" id="num022">2000000</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>名优特农产品数</p>
                                    <div style="text-align:center;">
                                        <i class="ico33">&nbsp;</i>
                                        <span class="num" id="num023">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>旅游产品种类</p>
                                    <div style="text-align:center;">
                                        <i class="ico34">&nbsp;</i>
                                        <span class="num" id="num024">66666666</span>
                                        <span>万亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>旅游产品数目</p>
                                    <div style="text-align:center;">
                                        <i class="ico35">&nbsp;</i>
                                        <span class="num" id="num025">66666666</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                        </ul>
                        <ul class="dataSubjt-right-bottom clearfix">
                        	<li>
                            	<div class="panel-body">
                                	<i class="ico011">&nbsp;</i>
                                    <a href="" target="_blank">观光采摘旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico012">&nbsp;</i>
                                    <a href="" target="_blank">休闲度假旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico013">&nbsp;</i>
                                    <a href="" target="_blank">节庆文化旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico014">&nbsp;</i>
                                    <a href="" target="_blank">体验民俗旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico015">&nbsp;</i>
                                    <a href="" target="_blank">名优特产旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico016">&nbsp;</i>
                                    <a href="" target="_blank">科普教育旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico017">&nbsp;</i>
                                    <a href="" target="_blank">特色农业园区</a>	
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>	
            </div>
        </div>
    </div>
	<!--footer开始-->
    <div class="footer mgt15">
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
    <!--右侧浮动框-->
    <div>
        <script language="JavaScript" type="text/javascript"> 
            lastScrollY511=0; 
            function lastScrollY512(){  
                var diffY513; 
                    if (document.documentElement && document.documentElement.scrollTop) 
                        diffY513 = document.documentElement.scrollTop; 
                    else if (document.body) 
                            diffY513 = document.body.scrollTop; 
                        else{}
                        
                        percent5=.1*(diffY513-lastScrollY511);  
                        if(percent5>0)
                            percent5=Math.ceil(percent5);  
                        else 
                            percent5=Math.floor(percent5);  
                            document.getElementById("loveright").style.top=parseInt(document.getElementById ("loveright").style.top)+percent5+"px"; 
                            lastScrollY511=lastScrollY511+percent5;  
                        //alert(lastScrollY511); 
                            } 
                        suspendcode12="<div id=\"loveright\" style='z-index: 99;right:30px;position:absolute;TOP:300px;'><a href=\'\' target=\'_blank\'><img style='' border=0 src=/html/sn-static/static/image/abar.png></a></div>" 
                        document.write(suspendcode12);    
                        window.setInterval("lastScrollY512()",1); 
        </script>
    </div>
</body>
</html>
