<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/jquery.treemenu.css">
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
.active {
    background-color: #0e82d9;
    color:#fff;
}
.active a {
    color: #fff;
}
.tree li a.active:hover {
    background-color: #34BC9D;
}
/*树结构样式设置结束*/
</style>
	<!--[if lt IE 10]> 
    <link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/ie8Css.css">
	<style>
		.head-bottom{background:url(/html/sn-static/static/image/navbanner.png) no-repeat;}
	</style>
	<![endif]-->
</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper" id="wrapper">
    	<div class="container">
        	<div class="row">
                <div class="item-title clearfix">
                    <div class="item-title-partl icon7 pull-left">
                        <span>数据资源</span>
                    </div>
                    <label class="pull-right" style="margin-top:8px;">
                    	<input type="text" id="seachkeyword" value="${param!}" placeholder="关键词搜索" style="width:250px; font-size:12px; padding:2px;">
                        <button type="button" value="" class="b-btn fontSize12" style="padding:2px 10px 2px 25px; background:url(/html/sn-static/static/image/searchicon.png) no-repeat left 10px center;" onclick="searchTable()">资源搜索</button>
                    </label>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-3 col-lg-3" style="padding-left:0px;">
                	<div class="tree-title">数据目录</div>
                    <div class="tree-con">
                        <div class="panel-body" id="dataSourceTree" style="padding-top:0px;">
                        	
                         </div>
                     </div>
                </div>
                <div class="col-md-9 col-lg-9" style="padding-left:0px;">
                	<div class="data-resource1-right">
                    	<div class="data_reduction">
                        	<h3 class="four-database-tit">整合情况</h3>
                            <div class="data_reductionCon">
                            	<ul>
                                <!--<li class="firstOne">
                                    	<h3 style="color:#1c8fe5; margin:0px; font-size:14px;">整合部门</h3>
                                        <div class="clearfix data_part">
                                        	<div> 北京市城乡经济信息中心 </div>
                                            <div> 北京市农村经济统计处  </div>
                                            <div> 北京市旅游发展委员会 </div>
                                            <div> 北京市规划和国土资源管理委员会 </div>
                                        </div>
                                    </li>-->
                                    <li>
                                    	<h3 style="color:#1c8fe5; margin:0px; font-size:14px;">数据来源</h3>
                                        <div class="clearfix data_part1">
					<@dictItemListDirective  code="C07">
					
						<#list items as item>
							 <div>${item.itemName!}</div>
						</#list>
                                        	</@dictItemListDirective>
                                        </div>
                                    </li>
                                    <li>
                                    	<h3 style="color:#1c8fe5; margin:0px; font-size:14px;">数据总量</h3>
                                        <div class="clearfix data_part">
                                        	 <@sysDataCountDirective>
					    <div>${record.fullCount}条</div>
					    </@sysDataCountDirective>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="four-database">
                        	<h3 class="four-database-tit">四大基础库</h3>
							<#assign baseStoreArr = ["bCIbFy4Y","8n5CbiZT","a1RtGRtM","znFoIvFr"] >
							<#assign colorArr = ["green","bluea","oringea","red"] >
                        	<ul class="four-database clearfix">
							<#list baseStoreArr as bs>
								<@dataResourceRecordDirective id=bs>
                            	<li>
				<a href="/${application!}/portal/data/grid/${bs}_1.htm">
								<div class="info-left ${colorArr[bs_index]}">${record.title!}</div>
                                    <div class="info-right">
                                    	<p>
                                        	<span>数据资源数</span>
                                            <span id="data-numa1">${record.tableCount!}</span>
                                            <span>个</span>
                                        </p>
                                        <p>
                                        	<span>数据量</span>
                                            <span id="data-numa2">${record.dataCount!}</span>
                                            <span>条</span>
                                        </p>
                                    </div>
                                </li></a>
								</@dataResourceRecordDirective>
                               </#list>
                            </ul>	
                    	</div>
                        <div class="ten-database">
                        	<h3 class="four-database-tit">十大主题库</h3>	
                            <ul class="ten-database clearfix" id="ten-database">
							<#assign zhutiStoreArr = ["gtTEogrR","ubQfMxwl","SB7TABfi","tlEgf4kl","c2Ci5cj0","QuHM4Myr","2jA5V8Qh","hznuuul3","oadjmLpy","V5xYUnWp"] >
						<#list zhutiStoreArr as zs>
							<@dataResourceRecordDirective id=zs>
                            	
								<li >
								<a href="/${application!}/portal/data/grid/${zs}_1.htm">
                                	<div class="lipart">
                                    	<img src="/html/sn-static/static/image/resourceaa${zs_index}.png" width="100%" height="84">
                                        <div class="ten-hover">${record.title!}</div>
                                        <div class="ten-show">
                                        	
                                        	<p>
                                                <span>数据资源数</span>
                                                <span id="data-numa${zs_index}">${record.tableCount!}</span>
                                                <span>个</span>
                                        	</p>
                                            <p>
                                                <span>数据量</span>
                                                <span id="data-numa${zs_index}">${record.dataCount!}</span>
                                                <span>条</span>
                                        	</p>	
                                        </div>
                                    </div>
				    </a>
                                </li>
				</@dataResourceRecordDirective>
                               </#list>
                               
                            </ul>
                        </div>
                    </div>
                </div>
             </div>
        </div>
    </div>
    <!--footer开始-->
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
			
			$("#dataSourceTree").append($root);
		}
		var currentTable = "${currentTable!}";
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
			return $('<li data-pid="'+data.pId+'" title="'+title+'"><a class="'+active+'" href="/${application!}/portal/data/grid/'+data.id+'_1.htm">'+data.gridName+count+'</a><ul id="tree_'+data.id+'"><ul><li>');
		}
		function searchTable(){
		var word = $("#seachkeyword").val();
		var url = "/${application!}/portal/data/grid/search_1.htm"+"?param="+word;
		window.location.href=url;
	}
    </script>
    <script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
</body>
</html>
