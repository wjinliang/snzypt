<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>北京涉农资源信息平台</title>
<link rel="stylesheet" type="text/css" href="/html/shenong-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/shenong-static/css/layout.css">
<script type="text/javascript" src="/html/shenong-static/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
<!--首先得从后台取得数据-->
	function show_num(n){
	var it = $(".t_num i");
	var len = String(n).length;
	for(var i=0;i<len;i++){
		if(it.length<=i){
			$(".t_num").append("<i></i>");
		}
		var num=String(n).charAt(i);
		var y = -parseInt(num)*30;
		var obj = $(".t_num i").eq(i);
		obj.animate({
			backgroundPosition :'(0 '+String(y)+'px)' 
			}, 'slow','swing',function(){}
		);
	}
	$("#cur_num").val(n);
}
show_num(5);
</script>
</head>

<body>
	<#include "/template/sn_daohang.ftl">
    <div class="con-wrap">
    	<div class="container">
        	<div class="row">
            	<div class="data-integration">
                	<p class="mgt20">
                    	<span class="on blue">涉农数据整合情况</span>
                        <span id="todayTime" class="blue"></span>
                    </p>
                    <script type="text/javascript">
						function currentDate(){
							var date = new Date();
							var day;
							var seperator1 = "年";
							var seperator2 = "月";
							var seperator3 = "日";
							var month = date.getMonth() + 1;
							var strDate = date.getDate();
							var strDay = date.getDay();
							switch(strDay){
								case 0:
									day = "星期天";
									break;
								case 1:
									day = "星期一";
									break;
								case 2:
									day = "星期二";
									break;
								case 3:
									day = "星期三";
									break;
								case 4:
									day = "星期四";
									break;
								case 5:
									day = "星期五";
									break;
								case 6:
									day = "星期六";
									break;
								}
							if (month >= 1 && month <= 9) {
								month = "0" + month;
							}
							if (strDate >= 0 && strDate <= 9) {
								strDate = "0" + strDate;
							}
							var currentdate = "  " + date.getFullYear() + seperator1 + month + seperator2 + strDate
									 + seperator3 + "  " + day;
							 var currenttime = document.getElementById("todayTime");
							 currenttime.innerHTML = currentdate;
						}
						//setTimeout("currentDate()",1000); 
						currentDate();
					</script>
                    <div class="integration-con clearfix">
                    	<div class="col-md-4">
                        	<div class="part1">
                            	<p>
                                	<span class="blue">对接系统数：</span>
                                    <span class="a-num1 num">3</span>
                                </p>
                                <p>
                                	<span class="blue">部门数：</span>
                                    <span class="a-num2 num">12</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4">
                        	<div class="part1">
                            	<p>
                                	<span class="blue">数据目录数：</span>
                                    <span class="a-num3 num"><@directoryNumberDirective type=1 >
					${directoryNumber}
				    </@directoryNumberDirective></span>
                                </p>
                                <p>
                                	<span class="blue">数据专题数：</span>
                                    <span class="a-num4 num">1</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4">
                        	<div class="part1">
                            	<p>
                                	<span class="blue">数据条数：</span>
                                    <span class="a-num5 num">1,765,677</span>
                                </p>
                                <p>
                                	<span class="blue">数据增量：</span>
                                    <span class="a-num6 num">0</span>
                                </p>
                            </div>
                        </div>
                        <em class="l-icon-bg"><img src="/html/shenong-static/img/icon4.png" width="76" height="76"></em>
                        <em class="r-icon-bg"><img src="/html/shenong-static/img/icon3.png" width="90" height="81"></em>
                    </div>
                </div>
            </div>
            <div class="row mgt40">
            	<div class="col-md-8" style="padding-left:0px">
                	<div class="hot-data-title icon-bg1">
                    	<span class="blue">热门数据</span>
                        <a href="" class="pull-right"><img src="/html/shenong-static/img/icona3.png" width="66" height="17"></a>
                        <em class="xian"><img src="/html/shenong-static/img/icon13.png" width="600" height="3"></em>
                    </div>
                    <div class="hot-data-con mgt20">
                    	<ul class="hot-data-list clearfix">
                        	<li class="new-active">
                            	<div>
                            	<a href="/html/shenong/rmsj/content/807.html"><img src="/html/shenong-static/img/chart1.png" style="width:100%;" height="218"></a>
                                <p>柱状图统计分布情况</p>
                                </div>
                            </li>
                            <li>
                            	<div>
                            	<a href="/html/shenong/rmsj/content/808.html"><img src="/html/shenong-static/img/chart2.png" style="width:100%;" height="218"></a>
                                <p>折线图统计分析</p>
                                </div>
                            </li>
                            <li>
                            	<div>
                            	<a href="/html/shenong/rmsj/content/810.html"><img src="/html/shenong-static/img/chart3.png" style="width:100%;" height="218"></a>
                                <p>农机服务组织分布统计</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                	<div class="hot-data-title icon-bg2">
			<@channelDirective channelId=5>
                    	<span class="blue">${channel.displayName!}</span>
                        <a href="${channel.url!}" class="pull-right"><img src="/html/shenong-static/img/icona3.png" width="66" height="17"></a>
			</@channelDirective>
                        <em class="xian"><img src="/html/shenong-static/img/icon13.png" width="250" height="3"></em>
                    </div>
                    <div class="real-time-info mgt20">
                    	<ul>
			<@contentListDirective channelId=5 pageSize=6 titleLeft=16>
			<#list contents as cont>
                        	<li><a title="${cont.title}" href="${cont.url}" target="_blank" class="clearfix">
                            	
                                <span>${cont.shortTitle}</span>
                                <span class="pull-right">${cont.publishDate?string('yyyy-MM-dd')}</span>
                            	</a>
                            </li>
			    </#list>
			    </@contentListDirective>
                           
                        </ul>
                    </div>
                </div>	
            </div>
            <div class="row">
            	<div class="hot-data-title icon-bg3">
                    <span class="blue">热门专题</span>
                    <a href="" class="pull-right"><img src="/html/shenong-static/img/icona3.png" width="66" height="17"></a>
                    <em class="xian"><!--<img src="/html/shenong-static/img/icon13.png" width="800" height="3">--></em>
                 </div>
                 <div class="hot-topic">
                 	<div class="panel-body">
                    	<!--<p class="arrow this_year_arrow_left"></p>
                        <p class="arrow this_year_arrow_right"></p>-->
                    	<div class="img-box">
                        	<div id="demo">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td id="demo1">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img1.png" class="img-circle" width="130" height="127"><p>种子备案</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img2.png" class="img-circle" width="130" height="127"><p>蔬菜备案</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/imga1.png" class="img-circle" width="130" height="127"><p>农机补贴</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/imga2.png" class="img-circle" width="130" height="127"><p>现代化农业基地</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/imga3.png" class="img-circle" width="130" height="127"><p>测图配方</p></a></td><!--
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img1.png" class="img-circle" width="130" height="127"><p>种子备案</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img1.png" class="img-circle" width="130" height="127"><p>种子备案</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img1.png" class="img-circle" width="130" height="127"><p>种子备案</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img1.png" class="img-circle" width="130" height="127"><p>种子备案</p></a></td>
                                                            <td><a href="/html/shenong/sjzt/content/806.html"><img src="/html/shenong-static/img/img1.png" class="img-circle" width="130" height="127"><p>种子备案</p></a></td>-->
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td id="demo2"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>	
    </div>
    <#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/shenong-static/js/qiehuan.js"></script>
<script type="text/javascript">
	var MyMar;
	var dir=1;
	var speed=20;    //设置滚动速度
	var demo = document.getElementById('demo');
	var demo1 = document.getElementById('demo1');
	var demo2 = document.getElementById('demo2');
	demo2.innerHTML=demo1.innerHTML;  //复制demo1到demo2
	function Marquee(){
		if(dir>0 && (demo2.offsetWidth-demo.scrollLeft)<=0){ //dir>0  dome2.offsetWidth-dome.scrollLeft<=0  向左方向滚动时候  当滚动至dome1与dome2交界时
			demo.scrollLeft=0;
		}
		if(dir<0 &&(demo.scrollLeft<=0)){
			demo.scrollLeft=demo2.offsetWidth;
		} 
		demo.scrollLeft+=dir;
		demo.onmouseover=function(){
							clearTimeout(MyMar);
						}
		demo.onmouseout=function(){
							MyMar=setTimeout(Marquee,speed);
						}
		MyMar = setTimeout(Marquee,speed);
	}
	function left(){
		if (dir=-1)dir=1;
	}
	function right(){
		if (dir=1)dir=-1;
	}
	Marquee();
</script>
</body>
</html>
