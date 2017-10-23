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
<link rel="stylesheet" type="text/css" href="/html/sn-static/web/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/sn-static/web/static/css/layout.css">
<link rel="stylesheet" type="text/css" href="/html/sn-static/web/static/css/canvasbg.css">
<script type="text/javascript" src="/html/sn-static/web/static/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="/html/sn-static/web/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/html/sn-static/web/static/js/vector.js"></script>
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

<script type="text/javascript">    
        $(function () {  
            $.ajax({    //初始化选择框
                type: "post",  
                contentType: "application/json",  
                url: "<%=basePath%>portal/ajax/findAllCounty",  
                data: "{}",  
                success: function (result) {  
                	if(result.msg=='success'){
	                    var stroption = '';  
	                    for (var i = 0; i < result.data.length; i++) {  
	                        stroption += '<option value=' + result.data[i].code + '>';  
	                        stroption += result.data[i].mc;  
	                        stroption += '</option>';  
	                    }  
	                    $('#bj-region').append(stroption);  
                	}else{
                		alert("无结果集");
                	}
                }  
            })  
  
            $('#bj-region').change(function () {  //选择区县进行异步查询其下的乡镇
            	var qx=$(this).val();
	                $('#bj-town option:gt(0)').remove();  
	                $('#villages option:gt(0)').remove();  
	                $.ajax({  
	                    type: "post",  
	                    contentType: "application/json",  
	                    url: "<%=basePath%>portal/ajax/findTownByQxCode?qxCode="+qx,  
	                    success: function (result) {  
	                    	if(result.msg=='success'){
		                        var strqx = '';  
		                        for (var i = 0; i < result.data.length; i++) {  
		                            strqx += '<option value=' + result.data[i].code + '>';  
		                            strqx += result.data[i].mc;  
		                            strqx += '</option>';  
		                        }  
		                        $('#bj-town').append(strqx);  
	                    	}else{
	                    		
	                    	}
	                    }  
               		 });  
            })  
  
            $('#bj-town').change(function () { //选择乡镇进行其下的村子查询
            	var xz=$(this).val();
            	if(xz==null){
            		return false;
            	}
                $('#villages option:gt(0)').remove();  
                $.ajax({  
                    type: "post",  
                    contentType: "application/json",  
                    url: "<%=basePath%>portal/ajax/findVillageByXzCode?xzCode="+xz,  
                    success: function (result) {
                    	if(result.msg=='success'){
	                        var strvillage = '';  
	                        for (var i = 0; i < result.data.length; i++) {  
	                            strvillage += '<option value=' + result.data[i].code + '>';  
	                            strvillage += result.data[i].mc;  
	                            strvillage += '</option>';  
	                        }  
	                        $('#villages').append(strvillage);  
                    	}else{}
                    }  
                }) ; 
            })  
        })  
    </script> 
    <script type="text/javascript">
	var villageCode="";
	function ShowDialog(url) {  //活动窗口，传入url以小窗口展示
		  var iWidth=600; //窗口宽度
		  var iHeight=480;//窗口高度
		  var iTop=(window.screen.height-iHeight)/2;
		  var iLeft=(window.screen.width-iWidth)/2;
		  window.open(url,"Detail","toolbar=no,menubar=no,Scrollbars=no, Resizable=no,Location=no, Status=no,Direction=no,Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
		 }
	function init(){ //1、初始化页面 2、选择框村情查询（整个页面的查询）
		villageCode=$("#villages").val();
		selectSearch(villageCode); 
	}
	function selectSearch(villageCode){  //村情查询（整个页面）
	if(villageCode==null){
			return false;
		}
		tipItems='${tipItems}';
		items=tipItems.split(",");
		
		for(var i=0;i<items.length;i++){
			 findItemCountInVillage(villageCode,items[i],items[i]); 
		}
		findVillageInfoByCode(villageCode);
	}
	
	function findItemCountInVillage(villageCode,tipItem,itemId) {  //查询村中的各个项目的数量. villageCode:村子编码   tipItem:项目名  itemId:项目在页面的id
		$.ajax({
			type : "POST",
			dataType : "json",
			data:"villageCode=" + villageCode + "&tipItem=" + tipItem,
			url : "<%=basePath%>portal/ajax/findItemCountInVillage",
			success : function(data) {
				if(data.msg=="success")
					$("."+itemId).text(data.data.value);
			},
		   error :function(e){
			   alert("请求错误");
		   }
		});
	}
	function findItemInfoInVillage(tipItem) {  //查询村中的项目详情   tipItem：项目名
		ShowDialog("<%=basePath%>portal/view/findItemInfoInVillage?villageCode="+villageCode+"&tipItem="+tipItem);
	}
	function findVillageInfoByCode(villageCode) {  //通过村子编码查询村子详情
		$.ajax({
			type : "POST",
			dataType : "json",
			data:"villageCode=" + villageCode,
			url : "<%=basePath%>portal/findVillageInfoByCode",
			success : function(data) {
				if(data.msg=="success"){
					$(".villagename").text(data.data.szXzC);
					$("#village_num").text(data.data.code);
					$("#region-num").text(data.data.szQx);
					$("#area_num").text(data.data.mj);
			}
			},
		   error :function(e){
			   alert("请求错误");
		   }
		});
	}
	
	function findVillageByName() {  //通过村子名模糊查询村子列表
		var villageName=$("input[name='xczMc']").val();
	if($.trim(villageName)==null||villageName==""){
		alert("请输入查询村名");
	}else{
		ShowDialog("<%=basePath%>portal/view/findVillageByName?villageName="+villageName);
	}
	}
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
                        <span><img src="/html/sn-static/web/static/image/logo.png"></span>
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
            	<ul class="resource-infoList">
                	<li>
                    	<label>
                            <span>区县：</span>
                            <select name="bj-region" id="bj-region" class="alter-sel"><option>--请选择区县--</option></select>
                        </label>	
                    </li>
                    <li>
                    	<label>
                            <span>乡镇：</span>
                             <select name="bj-town" id="bj-town" class="alter-sel"><option>--请选择乡镇--</option></select>
                        </label>	
                    </li>
                    <li>
                    	<label>
                            <span>行政村：</span>
                            <select name="bj-villages" id="villages" class="alter-sel" onchange="init();"><option>--请选择村子--</option> </select> 
                        </label>	
                    </li>
                    <li>
                    	<label>
                        	<input type="text" name="xczMc" value="" placeholder="关键词搜索">
                            <button type="button" value="" onclick="findVillageByName();" class="b-btn fontSize12">搜索</button>
                        </label>
                    </li>
                </ul>
            </div>
            <div class="row mgt10">
            	<div class="col-md-3 col-lg-3">
                	<div class="resource-left">
                        <ul>
                            <li class="villagename">东沙屯村</li>
                            <li class="mgt10">
                            <a href="" target="_blank">自然资源</a></li>
                            <li class="mgt10"><a href="" target="_blank">相关资讯</a></li>
                            <li class="mgt10"><a href="" target="_blank">村务信息</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9 col-lg-9">
                	<div class="resource-right">
                    	<div class="col-md-4">
                        	<div class="resource-con">
                            	<p>基本信息</p>
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <span>行政村编码:</span>
                                            <span class="add-num" id="village_num"></span>
                                        </li>
                                        <li>
                                            <span>所属区县:</span>
                                            <span class="add-num" id="region-num"></span>
                                        </li>
                                        <li>
                                            <span>总面积:</span>
                                            <span class="add-num" id="area_num"></span>
                                        </li>
                                        <li>
                                            <span>耕地面积:</span>
                                            <span class="add-num" id="plough_num"></span>
                                        </li>
                                        <li>
                                            <span>常住人口:</span>
                                            <span class="add-num" id="population_num"></span>
                                        </li>
                                        <li>
                                            <span>经济总收入:</span>
                                            <span class="add-num" id="economy_num"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                        	<div class="resource-con">
                            	<p>种植生产</p>
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <span>苗圃基地:</span>
                                            <span class="add-num MpJbxx" id="garden1_base_num" data-toggle="modal" data-target="#myModal1">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);"  onclick="findItemInfoInVillage('MpJbxx');" data-toggle="modal" data-target="#myModal1"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                        </li>
                                        <li>
                                            <span>果园基地:</span>
                                            <span class="add-num GyJbxx" id="garden2_base_num" data-toggle="modal" data-target="#myModal2">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('GyJbxx');" data-toggle="modal" data-target="#myModal2"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                        </li>
                                        <li>
                                            <span>花卉基地:</span>
                                            <span class="add-num HhjdJbxx" id="garden3_base_num" data-toggle="modal" data-target="#myModal3">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('HhjdJbxx');" data-toggle="modal" data-target="#myModal3"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                        <li>
                                            <span>观光果园:</span>
                                            <span class="add-num GggyJbxx" id="garden4_base_num" data-toggle="modal" data-target="#myModal4">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);"  onclick="findItemInfoInVillage('GggyJbxx');" data-toggle="modal" data-target="#myModal4"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                        </li>
                                        <li>
                                            <span>国有林场:</span>
                                            <span class="add-num" id="tree_base_num" data-toggle="modal" data-target="#myModal5">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal5"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>涉农企业:</span>
                                            <span class="add-num SnqyJbxx" id="farm_base_num" data-toggle="modal" data-target="#myModal6">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('SnqyJbxx');" data-toggle="modal" data-target="#myModal6"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                        	<div class="resource-con">
                            	<p>畜牧水产</p>
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <span>畜禽良种场：</span>
                                            <span class="add-num XqlzcJbxx" id="beast1_num" data-toggle="modal" data-target="#myModal7">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('XqlzcJbxx');" data-toggle="modal" data-target="#myModal7"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>蛋鸡养殖场:</span>
                                            <span class="add-num DanjiJbxx" id="beast2_num" data-toggle="modal" data-target="#myModal8">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('DanjiJbxx');" data-toggle="modal" data-target="#myModal8"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                        <li>
                                            <span>奶牛养殖场:</span>
                                            <span class="add-num NainiuJbxx" id="beast3_num" data-toggle="modal" data-target="#myModal9">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('NainiuJbxx');" data-toggle="modal" data-target="#myModal9"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                        <li>
                                            <span>水产养殖场:</span>
                                            <span class="add-num ScyzcJbxx" id="beast4_num" data-toggle="modal" data-target="#myModal10">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('ScyzcJbxx');" data-toggle="modal" data-target="#myModal10"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>屠宰企业:</span>
                                            <span class="add-num TzqyJbxx" id="beast5_num" data-toggle="modal" data-target="#myModal11">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('TzqyJbxx');" data-toggle="modal" data-target="#myModal11"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>兽医经营企业:</span>
                                            <span class="add-num SyjyqyJbxx" id="beast6_num" data-toggle="modal" data-target="#myModal12">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('SyjyqyJbxx');" data-toggle="modal" data-target="#myModal12"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mgt15">
                        	<div class="resource-con">
                            	<p>市场资源</p>
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <span>百货超市：</span>
                                            <span class="add-num CsJbxx" id="superM1_num" data-toggle="modal" data-target="#myModal13">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('CsJbxx');" data-toggle="modal" data-target="#myModal13"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>农副市场:</span>
                                            <span class="add-num NfscJbxx" id="superM2_num" data-toggle="modal" data-target="#myModal14">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('NfscJbxx');" data-toggle="modal" data-target="#myModal14"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>经营市场:</span>
                                            <span class="add-num JyscJbxx" id="superM3_num" data-toggle="modal" data-target="#myModal15">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('JyscJbxx');" data-toggle="modal" data-target="#myModal15"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mgt15">
                        	<div class="resource-con">
                            	<p>农业科技</p>
                                <div class="panel-body">
                                    <ul>
                                        <li>
                                            <span>科技示范户：</span>
                                            <span class="add-num KjsfhJbxx" id="tecnology1_num" data-toggle="modal" data-target="#myModal16">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('KjsfhJbxx');" data-toggle="modal" data-target="#myModal16"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                           
                                        </li>
                                        <li>
                                            <span>科技示范园区:</span>
                                            <span class="add-num KjsfyqJbxx" id="tecnology2_num" data-toggle="modal" data-target="#myModal17">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('KjsfyqJbxx');" data-toggle="modal" data-target="#myModal17"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                        <li>
                                            <span>物联网示范点:</span>
                                            <span class="add-num WlwsdjsJbxx" id="tecnology3_num" data-toggle="modal" data-target="#myModal18">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('WlwsdjsJbxx');" data-toggle="modal" data-target="#myModal18"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                            
                                        </li>
                                        <li>
                                            <span>农业技术推广站:</span>
                                            <span class="add-num NyjstgzJbxx" id="tecnology4_num" data-toggle="modal" data-target="#myModal19">0</span>
                                            <span class="un">个</span>
                                            <a href="javascript:void(0);" onclick="findItemInfoInVillage('NyjstgzJbxx');" data-toggle="modal" data-target="#myModal19"><img src="/html/sn-static/web/static/image/resource12.png" width="15" height="15"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>	
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
</body>
</html>
