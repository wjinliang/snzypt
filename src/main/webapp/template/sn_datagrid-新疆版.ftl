<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/jquery.treemenu.css">

<style>
.container{
    width: 1200px;
}
.panel{border-radius: 0 !important;}
.panel-group .panel{border-radius: 0 !important;}
.panel-group .panel+.panel{margin-top: 0 !important;}
.pagination{margin-bottom: 0 !important;}
.pagination>li>a, .pagination>li>span{cursor: pointer;}
</style>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/layout1.css">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/mytree.css">
<style type="text/css">
/*树结构样式设置开始*/
.tree {color:#46CFB0; padding-left:0px;}
.tree li,
.tree li > a,
.tree li > span {
    padding: 4px;
    border-radius: 4px;
}
.tree li a {
    color:#000;
    text-decoration: none;
    line-height: 20pt;
    border-radius: 4px;
}
.tree li a:hover {
    background-color: #0e82d9;
    color: #fff;
}
.tree .active {
    background-color: #0e82d9;
    color:#fff;
}
.tree .active a {
    color: #fff;
}
.tree li a.active:hover {
    background-color: #34BC9D;
}
/*树结构样式设置结束*/
/*数据采集中*/
.datagather{
	position: relative;
    top: 95px;
    display: inline-block;
    letter-spacing: -10px;
    margin-top: 0px;
    margin-bottom: 10px;
    line-height: 128px;
    font-size: 100px;
    font-weight: 300;
    color: #E6E6E6;
    text-align: right;
	}
#dataSourceTree{
	padding:8px;
	padding-right:0;
}
.treemenu{
	padding-left: 8px;
}
</style>
</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
	<div class="row">
                <div class="col-md-4 col-xs-4">
                    <div class="catalog-aside">
                            <ul class="mtree easy" id="myTree">
                            </ul>  
                    </div>
                </div>
                <div class="col-md-8 col-xs-8" style="padding-left:0px;">
                    <div class="catalog-detail">
                        <div class="catalog-detail-head panel-body">
                            <div class="catalog-head-top clearfix">
                                    <div class="pull-left select-panel">
				    <input type="text" value="" class="text-style" id="searchKeyGov" style="font-size:13px;" placeholder="在结果中搜索">
				    <span class="serch-icon" id="searchBtnGov">
				    <img src="/html/sn-static/static/image/icon04.png" width="17" height="17"></span></div>
                                    <div class="pull-left select-panel1">
                                        <div class="clearfix">
                                            <div class="select downPanel pull-left">
                                                <span class="placeholder">共享属性</span>
                                                <ul>
                                                    <li>有条件共享</li>
                                                    <li>无条件共享</li>
                                                </ul>
                                            </div>
                                            <div class="select downPanel pull-left">
                                                    <span class="placeholder">开放属性</span>
                                                    <ul>
                                                        <li>可对社会开放</li>
                                                        <li>不可对社会开放</li>
                                                        <li>部分可对社会开放</li>
                                                    </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-left">
                                        <span id="btn" class="new-btn">查询</span>
                                    </div>
                            </div>
                            <div class="catalog-head-btm mgt15">
                                <ul class="catalog-head-nav clearfix">
                                    <li class="active">全部</li>
                                    <li>库表</li>
                                    <li>文件</li>
                                    <li>接口</li>
                                    <li>未挂资源</li>
                                </ul>
                            </div>
                        </div>
                        <div class="catalog-detail-list">
                            <div class="detail-page-list">
                                <div class="panel-body head-top">
                                    <div class="clearfix">
                                        <div class="item-lf item-md-7">共10000条目录</div>
                                        <div class="item-lf item-md-3"><span>申请量</span><span>访问量</span><span>更新时间</span></div>
                                    </div>
                                </div>
                                <ul id="detailPageList"></ul>
                            </div>
                            <div style="text-align:center;"><ul id="pageButton"></ul></div>
                        </div>
                    </div>
                </div>
            </div>  

        	<div class="row">
                <div class="item-title clearfix">
                    <div class="item-title-partl icon7 pull-left">
                        <span>数据资源</span>
                    </div>
                    <label class="pull-right">
                    	<input type="text" id="seachkeyword" value="${param!}" placeholder="关键词搜索">
                        <button type="button" value="" class="b-btn fontSize12" onclick="searchTable()">搜索</button>
                    </label>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-3 col-lg-3" style="padding-left:0px;">
                	<div class="tree-title">数据目录1</div>
                    <div class="tree-con">
                        <div class="panel-body" id="dataSourceTree" style="padding-top:0px;">
                        	
                         </div>
                     </div>
                </div>
                <div class="col-md-9 col-lg-9">
                	<div class="interact-item" style="background:#fafafa;;min-height:300px;">
                    	<div class="interact-item-con">
			<div class="abstracts">
                            	<h4><#if typeId!="search">【${table.gridName!}】<#else>【查询结果】</#if></h4>
<!--                                <p><#if typeId!="search">${table.info!}</#if></p>-->
                            </div>
					<@tableListDirective type=0  pId=typeId pageNum=pageNum pageSize=16 gridName=param>
				<#if (tables?size==0)>
						<div class="datagather">
								<#if typeId!="search">数 据 采 集 中...<#else>未 找 到 数 据</#if>
							</div>
				<#else>
				<div class="interact-con-list">
				<table style="width:100%;">
                                	<thead>
                                    	<tr>
                                        	<td align="center">标题</td>
                                            <td align="center">所属分类</td>
                                            <!--<td align="center">所属部门</td>-->
                                            <td align="center">数据来源</td>
                                            <td align="center">数据量</td> 
                                            <!--<td align="center">采集时间</td>-->
                                        </tr>
                                    </thead>
                                    <tbody>
				    <#list tables as t>
                                    	<tr>
                                         	<td align="center"><a href="/${application!}/portal/data/info/${t.id!}.htm" class="fontSize16 pText1">${t.gridName!}</a></td>
                                            <td align="center"><span id="depart1">${t.pTypeName!}</span></td>
<!--					    <td align="center"><span id="depart1">${t.org!}</span></td>-->
                                            <td align="center"><span id="source1">${t.origin!}</span></td>
                                            <td align="center"><span id="data-count1">${t.dataCount!}</span></td>
                                            <!--<td align="center"><span id="update-time1">${t.dataTime!}</span></td>-->
                                        </tr>
					</#list>
					</tbody>
					</table>
			    </div>
						${pagination!}
						</#if>
							</@tableListDirective>
                        </div>
                    </div>
                </div>	
            </div>
        </div>
    </div>
    <#include "/template/sn_footer.ftl">
    <script type="text/javascript" src="/html/sn-static/static/js/jquery.treemenu.js"></script>
	<script type="text/javascript">
   $(function(){
			mytree(zNodes);
            $(".tree").treemenu({delay:300}).openActive();
        });
	<@tableListDirective type=1 >
		var zNodes = ${tablesStr!};
	</@tableListDirective>

		function mytree(list){
			var $root = $('<ul class="tree"><ul>');
			for(var i=0;i<list.length;i++){
				$root.append(toli(list[i]));
			}
			$root.children().each(function(i,ele){
				var pid = $(ele).data("pid");
				var parent = $root.find("#tree_"+pid);
				if(parent.length>0){
					parent.append($("<p>").append($(this).clone()).html());
					$(ele).remove();
				}
				
			})
			$root.find("ul").each(function(i,ele){
				if($(ele).find("li").length==1){
					$(ele).remove();
				}
			});
			$("#dataSourceTree").append($root);
		}
		var currentTable = "${tableId!}";
		function toli(data){
			var active="";
			if(data.id==currentTable){
				active = "active";
			}
			var count = "";
			var title ="";
			if(!data.pId){
				count ="<m style='font-size:12px;'>("+data.dataCount+")</m>";
			}//else{
				title='共'+data.dataCount+'条数据';
			//}
			return $('<li data-pid="'+data.pId+'" title="'+title+'"><a class="'+active+'" href="/${application!}/portal/data/grid/'+data.id+'_1.htm" >'+data.gridName+count+'</a><ul id="tree_'+data.id+'" ><ul><li>');
		}
	function searchTable(){
		var word = $("#seachkeyword").val();
		var url = "/${application!}/portal/data/grid/search_1.htm"+"?param="+word;
		window.location.href=url;
	}
    </script>
    <script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/html/sn-static/static/js/bootstrap-paginator.js" type="text/javascript"></script>
<!-- 引用mockjs，调后台接口时，此段代码需要注释或删除 -->
<script src="http://mockjs.com/dist/mock.js"></script>
<script type="text/javascript">
    // 主题资源数据模拟
    Mock.mock('/themeResInfo/list','post',{
        "success|2-4":false,
        "themeData|19":[
        {
            'name': '@ctitle(4,6)',
            'catalogCount|0-1000': 0,
            'resCount|0-1000': 0
        }],
        "departData|6":[
            {
                'name': '@ctitle(4,6)',
                'catalogCount|0-1000': 0,
                'resCount|0-1000': 0
            }
        ],
        "regionData|13":[
            {
                'name': '@ctitle(4,6)',
                'catalogCount|0-1000': 0,
                'resCount|0-1000': 0
            }
        ]
    })
    Mock.mock('/themeResDetail/list','post',{
        "success":true,
        'total':100,
        "data|10":[
            {
                'name':'@ctitle(4,15)',
                'accessCount|0-1000':0,
                'applyCount|0-1000':0,
                'shareAttribute':'@ctitle(4,5)',
                'OpenAttribute':'@ctitle(4,8)',
                'kubiao|3-5':true,
                'file|2-6':false,
                'interface|5-11':true,
                'sources':'新疆电子顶顶顶',
                'resProvide':'新疆电子顶顶顶',
                'updateTime':'2019-10-09'
            }
        ]
    })
</script>
<script type="text/javascript" src="/html/sn-static/static/js/mytree.js"></script>
<script type="text/javascript" src="/html/sn-static/static/js/goverInfoRes.js"></script>
  
</body>
</html>
