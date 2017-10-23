<!DOCTYPE html>
  <html>
  <head lang="en">
      <#include "/template/jh-meta.ftl">
      <title>${site.displayName!}</title>
      <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
      <script src="/html/jinhu-static/js/respond.min.js"></script>
      <![endif]-->
      <style>
 	.panel_l{margin-bottom:0px; background-color:#fff;border:1px solid transparent;
 		border-radius:4px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.05);
 		box-shadow:0 1px 1px rgba(0,0,0,0.05)} 
 	.panel_l{
 	    border-radius: 0;
 	    border-color: #d3d3d3;
 	}
 	#lead_pad2, #lead_pad3, #lead_pad4{display:none;}
 
 	.clear{overflow:hidden; height:0px; clear:both;}
      </style>
  </head>
  <body>
  <#include "/template/jh-head.ftl">
  <#include "/template/jh-daohang.ftl">
  <div class="container bg-white">
  <#include "/template/jh-current.ftl">
      <div class="jh-main">
          <div class="row">
              <div class="col-md-4">
                  <div class="fontSize18 pd3 color-green">领导之窗</div>
 
 		<div class="panel_l panel-default panel1">
                     <div class="panel-heading panel1-t" id="lead1"><a href="javascript:void(0)" class="panel1-ton fontSize18">县&nbsp;&nbsp;&nbsp;&nbsp;委</a></div>
                     <ul class="fontSize12 zwgk-ld-list" id="lead_pad1">
                          <@leaderListDirective pageNum=1 pageSize=20 org="县委">
                          <#list leaders as leader>
                          <li class="<#--${(leader_index==0)?string('active','')}-->"><a href="javascript:void(0)" onclick="toSelf('${leader.id}');"><span class="fontSize14 zwgk-ld-span">${leader.name}</span>${leader.occupation}</a></li>
                          </#list>
                          </@leaderListDirective>
                          
                      </ul>
                  </div>
 		 <div class="panel_l panel-default panel1">
                     <div class="panel-heading panel1-t" id="lead4"><a href="javascript:void(0)" class="panel1-ton fontSize18">县人大</a></div>
                     <ul class="fontSize12 zwgk-ld-list" id="lead_pad4">
                          <@leaderListDirective pageNum=1 pageSize=20 org="县人大">
                          <#list leaders as leader>
                          <li class="<#--${(leader_index==0)?string('active','')}-->"><a href="javascript:void(0)" onclick="toSelf('${leader.id}');"><span class="fontSize14 zwgk-ld-span">${leader.name}</span>${leader.occupation}</a></li>
                          </#list>
                          </@leaderListDirective>
                          
                      </ul>
                  </div>
 		 <div class="panel_l panel-default panel1">
                     <div class="panel-heading panel1-t" id="lead2"><a href="javascript:void(0)" class="panel1-ton fontSize18">县政府</a></div>
                     <ul class="fontSize12 zwgk-ld-list" id="lead_pad2">
                          <@leaderListDirective pageNum=1 pageSize=20 org="县政府">
                          <#list leaders as leader>
                          <li class="<#--${(leader_index==0)?string('active','')}-->"><a href="javascript:void(0)" onclick="toSelf('${leader.id}');"><span class="fontSize14 zwgk-ld-span">${leader.name}</span>${leader.occupation}</a></li>
                          </#list>
                          </@leaderListDirective>
                          
                      </ul>
                  </div>
 		 <div class="panel_l panel-default panel1">
                     <div class="panel-heading panel1-t" id="lead3"><a href="javascript:void(0)" class="panel1-ton fontSize18" >县政协</a></div>
                     <ul class="fontSize12 zwgk-ld-list" id="lead_pad3">
                          <@leaderListDirective pageNum=1 pageSize=20 org="县政协">
                          <#list leaders as leader>
                          <li class="<#--${(leader_index==0)?string('active','')}-->"><a href="javascript:void(0)" onclick="toSelf('${leader.id}');"><span class="fontSize14 zwgk-ld-span">${leader.name}</span>${leader.occupation}</a></li>
                          </#list>
                          </@leaderListDirective>
                          
                      </ul>
                  </div>
              </div>
              <div class="col-md-8" id="leader">
                  
              </div>
          </div>
      </div>
         
     <#include "/template/jh-links.ftl">
  </div>
   <#include "/template/jh-footer.ftl">
  <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
  <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
  <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
  <script type="text/javascript">
  function toSelf(id)
     {
         $("#leader").load("../../leader/leaderfront?id="+id);
     }
     $(function () {
         $('input, textarea').placeholder();
         var lead1 = $("#lead1");
	var lead_pad1 = $("#lead_pad1");
	var lead2 = $("#lead2");
	var lead_pad2 = $("#lead_pad2");
	var lead3 = $("#lead3");
	var lead_pad3 = $("#lead_pad3");
	var lead4 = $("#lead4");
	var lead_pad4 = $("#lead_pad4");
	
		lead1.click(function(){
			if(lead_pad1.css("display")=="none"){
				lead_pad1.show();
				lead_pad1.find("a:eq(0)").trigger("click");
				}
				else{
					lead_pad1.hide();
					}
					lead_pad2.hide();
					lead_pad3.hide();
					lead_pad4.hide();
			})
	
	
		lead2.click(function(){
			if(lead_pad2.css("display")=="none"){
				lead_pad2.show();
				lead_pad2.find("a:eq(0)").trigger("click");
				}
				else{
					lead_pad2.hide();
					}
					lead_pad1.hide();
					lead_pad3.hide();
					lead_pad4.hide();
			})
			
			lead3.click(function(){
			if(lead_pad3.css("display")=="none"){
				lead_pad3.show();
				lead_pad3.find("a:eq(0)").trigger("click");
				}
				else{
					lead_pad3.hide();
					}
					lead_pad2.hide();
					lead_pad1.hide();
					lead_pad4.hide();
			})
			lead4.click(function(){
			if(lead_pad4.css("display")=="none"){
				lead_pad4.show();
				lead_pad4.find("a:eq(0)").trigger("click");
				}
				else{
					lead_pad4.hide();
					}
					lead_pad2.hide();
					lead_pad3.hide();
					lead_pad1.hide();
			})
          $("#leader").load("../../leader/leaderfront?id=${param!}");
    });
     
 </script>
      
  </body>
  </html>
  
 