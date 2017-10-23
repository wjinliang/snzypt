 <!--相关链接-->
   
   	<div class="jh-link-list text-center fontSize16 clearfix">
               <div class="current col-xs-4 col-md-2">友情链接</div>
               <div class="col-xs-4 col-md-2 jh-link-click" data-src="zybw"><a href="javascript:void(0);">中央部委网站</a><span class="jh-link-list-line">|</span></div>
               <div class="col-xs-4 col-md-2 jh-link-click" data-src="sqs"><a href="javascript:void(0);">省（区市）网站</a><span class="jh-link-list-line hidden-sm hidden-xs">|</span></div>
               <div class="col-xs-4 col-md-2 jh-link-click" data-src="jxs"><a href="javascript:void(0);">江苏省辖市网站</a><span class="jh-link-list-line">|</span></div>
               <div class="col-xs-4 col-md-2 jh-link-click" data-src="hxx"><a href="javascript:void(0);">淮安市辖县区网站</a><span class="jh-link-list-line">|</span></div>
               <div class="col-xs-4 col-md-2 jh-link-click" data-src="bdw"><a href="javascript:void(0);">本地网站 </a> </div>
           </div>
           <div class="jh-link-list1 fontSize16">
               <div class="clearfix" id="zybw">
   	    <@friendlinkDirective siteId=6 type='zybw' >
   		<#list friendlinks as link>
   			<div class="col-xs-4 col-md-3 col-lg-2"><a data-id="${link.id}" href="${ link.link}" target="_blank">${ link.name}</a> </div>
   		</#list>
   	    </@friendlinkDirective >
               </div>
   	    <div class="clearfix" id="sqs">
   	    <@friendlinkDirective siteId=6 type='sqs' >
   		<#list friendlinks as link>
   			<div class="col-xs-4 col-md-3 col-lg-2"><a data-id="${link.id}" href="${ link.link}" target="_blank">${ link.name}</a> </div>
   		</#list>
   	    </@friendlinkDirective >
               </div>
   	    <div class="clearfix" id="jxs">
   	    <@friendlinkDirective siteId=6 type='jxs' >
   		<#list friendlinks as link>
   			<div class="col-xs-4 col-md-3 col-lg-2"><a data-id="${link.id}" href="${ link.link}" target="_blank">${ link.name}</a> </div>
   		</#list>
   	    </@friendlinkDirective >
               </div>
   	    <div class="clearfix" id="hxx">
   	    <@friendlinkDirective siteId=6 type='hxx' >
   		<#list friendlinks as link>
   			<div class="col-xs-4 col-md-3 col-lg-2"><a data-id="${link.id}" href="${ link.link}" target="_blank">${ link.name}</a> </div>
   		</#list>
   	    </@friendlinkDirective >
               </div>
   	    <div class="clearfix" id="bdw">
   	    <@friendlinkDirective siteId=6 type='bdw' >
   		<#list friendlinks as link>
   			<div class="col-xs-4 col-md-3 col-lg-2"><a data-id="${link.id}" href="${ link.link}" target="_blank">${ link.name}</a> </div>
   		</#list>
   	    </@friendlinkDirective >
               </div>
   	 </div>
<script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
  <script type="text/javascript">
     $(function(){
  
          /*添加此JS*/
          $('.jh-link-click').click(function(){
              $('#'+$(this).data('src')).slideToggle('normal').siblings().css('display','none');
          });
      });
  </script>
    
   
  
 