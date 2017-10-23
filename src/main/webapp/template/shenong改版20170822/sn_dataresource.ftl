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
#dataSourceTree{
	padding:8px;
	padding-right:0;
}
.treemenu{
	padding-left: 8px;
}
/*树结构样式设置结束*/
</style>
</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container" >
            <div class="row">
                <div class="item-title clearfix">
                    <!--<div class="item-title-partl icon7 pull-left">
                        <span>数据资源</span>
                    </div>-->
                   <!-- <label class="pull-right">
                    	<input type="text" value="" placeholder="关键词搜索">
                        <button type="button" value="" class="b-btn fontSize12">搜索</button>
                    </label>-->
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
                    	<div class="four-database">
                        	<h3 class="four-database-tit">四大基础库</h3>
                        	<ul class="four-database clearfix">

		    <#assign baseStoreArr = ["bCIbFy4Y","8n5CbiZT","a1RtGRtM","znFoIvFr"] >
		    
		    <#assign colorArr = ["green","bluea","oringea","red"] >

				<#list baseStoreArr as bs>
								<@dataResourceRecordDirective id=bs>
                            	<li>
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
                                </li>
								</@dataResourceRecordDirective>
                               </#list>

                            </ul>	
                    	</div>
                        <div class="ten-database">
                        	<h3 class="four-database-tit">十大主题库</h3>	
                            <ul class="ten-database clearfix" id="ten-database" style="overflow:hidden;">
							
						<#assign zhutiStoreArr = ["gtTEogrR","ubQfMxwl","SB7TABfi","tlEgf4kl","c2Ci5cj0","QuHM4Myr","2jA5V8Qh","hznuuul3","oadjmLpy","V5xYUnWp"] >
						<#list zhutiStoreArr as zs>
							<@dataResourceRecordDirective id=zs>
                            	<li class="mgt15">
                                	<div class="lipart">
                                    	<img src="/html/sn-static/static/image/resourceaa${zs_index}.png" width="100%" height="84">
                                        <div class="ten-hover">${record.title!}</div>
                                        <div class="ten-show">
                                        	<p>${record.title!}</p>
                                        	<p>
                                                <span>数据资源数</span>
                                                <span id="data-numa1">${record.tableCount!}</span>
                                                <span>个</span>
                                        	</p>
                                            <p>
                                                <span>数据量</span>
                                                <span id="data-numa1">${record.dataCount!}</span>
                                                <span>条</span>
                                        	</p>	
                                        </div>
                                    </div>
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
			return $('<li data-pid="'+data.pId+'" title="'+title+'"><a class="'+active+'" href="${application!}/portal/data/grid/'+data.id+'_1.htm">'+data.gridName+count+'</a><ul id="tree_'+data.id+'"><ul><li>');
		}
    </script>
    <script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
</body>
</html>
