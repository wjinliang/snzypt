<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>北京涉农资源信息平台</title>
<link rel="stylesheet" type="text/css" href="/html/shenong-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/shenong-static/css/layout.css">
<link rel="stylesheet" type="text/css" href="/html/shenong-static/css/jquery.treemenu.css">
<script type="text/javascript" src="/html/shenong-static/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/html/shenong-static/bootstrap/js/bootstrap.min.js"></script>
<style>
.tree {color:#46CFB0; padding-left:0px;}
.tree li,
.tree li > a,
.tree li > span {
    padding: 4px;
    border-radius: 4px;
}
.tree li a {
   color:#59fefa;
    text-decoration: none;
    line-height: 20pt;
    border-radius: 4px;
}
.tree li a:hover {
    background-color: #34BC9D;
    color: #fff;
}
.active {
    background-color: #34495E;
    color: white;
}
.active a {
    color: #fff;
}
.tree li a.active:hover {
    background-color: #34BC9D;
}
</style>
</head>

<body>
	<#include "/template/sn_daohang.ftl">
    <div class="con-wrap bg-img-data" style="padding-bottom:15px;">
    	<div class="container">
        	<div class="row">
                <div class="position-info">
                    <span>您所在的位置：</span>
                   <@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-4 col-lg-4" style="padding-left:0px;">
                	<div class="input-group" style="border:2px solid #213e70;">
                    	<input type="text" class="form-control input-alter" placeholder="请输入关键字搜索">
                        <span class="input-group-btn">
                        	<button class="btn btn-alter" type="button">搜索</button>
                        </span>
                    </div>
                    <div class="mgt15" style="background:rgba(40,64,107,.8); padding:5px; border:1px solid #5882c5;">
                        <div class="date-catalog">
                            <div class="hot-data-title icon-bg4">
                                <span class="blue">数据目录</span>
                                <a href="/html/shenong-static/" class="pull-right"><img src="/html/shenong-static/img/icona3.png" width="66" height="17"></a>
                                <em class="xian"><img src="/html/shenong-static/img/icon13.png" width="250" height="3"></em>
                            </div>
                            <div class="date-catalog-con">
                                <div class="panel-body">
                                    <ul class="catalog-list clearfix">
                                        <li class="pull-left">
                                            <a href="/html/shenong-static/" title="涉农机构" target="_blank">
                                                <img src="/html/shenong-static/img/icon5.png" width="50" height="46" alt="涉农机构">
                                                <p>涉农机构</p>
                                            </a>
                                        </li>
                                        <li class="pull-left">
                                            <a href="/html/shenong-static/" title="休闲农业" target="_blank">
                                                <img src="/html/shenong-static/img/icon6.png" width="39" height="46" alt="休闲农业">
                                                <p>休闲农业</p>
                                            </a>
                                        </li>
                                        <li class="pull-left">
                                            <a href="/html/shenong-static/" title="市场行情" target="_blank">
                                                <img src="/html/shenong-static/img/icon7.png" width="39" height="46" alt="市场行情">
                                                <p>市场行情</p>
                                            </a>
                                        </li>
                                        <li class="pull-left">
                                            <a href="/html/shenong-static/" title="农村经济" target="">
                                                <img src="/html/shenong-static/img/icon8.png" width="55" height="46" alt="农村经济">
                                                <p>农村经济</p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="detail">
                            <div class="detail-title icon-bg5">
                                <span class="blue">详细</span>
                            </div>
                            <div class="detail-con">
                                <div class="panel-body">
                                    <ul class="tree">
                                      <li class="tree-closed"><span class="toggler"></span><a href="/html/shenong-static/javascript:void(0)">北京市2015年种植行业企业信息</a>
                                      	<ul>
                                          <li><a href="/html/shenong-static/#">jQuery</a>
                                            <ul>
                                              <li><a href="/html/shenong-static/#">jQuery</a></li>
                                              <li><a href="/html/shenong-static/#">jQuery UI</a></li>
                                              <li><a href="/html/shenong-static/#">jQuery Mobile</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </li>
                                      <li class="tree-closed"><span class="toggler"></span><a href="/html/shenong-static/javascript:void(0)">北京市2015年种植行业企业信息</a>
                                        <ul>
                                          <li><a href="/html/shenong-static/#">jQuery</a>
                                            <ul>
                                              <li><a href="/html/shenong-static/#">jQuery</a></li>
                                              <li><a href="/html/shenong-static/#">jQuery UI</a></li>
                                              <li><a href="/html/shenong-static/#">jQuery Mobile</a></li>
                                            </ul>
                                          </li>
                                          <li><a href="/html/shenong-static/#">JavaScript</a>
                                            <ul>
                                              <li><a class="active" href="/html/shenong-static/#">AngularJS</a></li>
                                              <li><a href="/html/shenong-static/#">React</a></li>
                                              <li><a href="/html/shenong-static/#">Backbone</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </li>
                                      <li><a href="/html/shenong-static/#about">北京市2015年种植行业企业信息</a>
                                        <ul>
                                          <li><a href="/html/shenong-static/#">Contact</a></li>
                                          <li><a href="/html/shenong-static/#">Blog</a></li>
                                          <li><a href="/html/shenong-static/#">Jobs</a>
                                            <ul>
                                              <li><a href="/html/shenong-static/#jobs1">Job 1</a></li>
                                              <li><a href="/html/shenong-static/#jobs2">Job 2</a></li>
                                              <li><a href="/html/shenong-static/#jobs3">Job 3</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-lg-8" style="padding-right:0px;">
                	<div class="real-map">
                    	<img src="/html/shenong-static/img/map.png" height="550" style="width:100%;">
                    </div>
                </div>
            </div>
        </div>
    </div>
   <#include "/template/sn_footer.ftl">
<script src="/html/shenong-static/js/jquery.treemenu.js"></script> 
<script>
$(function(){
        $(".tree").treemenu({delay:300}).openActive();
    });
</script>
</body>
</html>
