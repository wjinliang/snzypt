<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<script type="text/javascript">
  function tijiao(){
   	var title=$("#title").val();
  	var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
  	var email=$("#email").val();
  	var weibanju=$('input:radio[name="weibanju"]:checked').val();
  	var type=$('input:checkbox[name="type"]:checked').val();
  	if(title!='' && email!='' && weibanju!=null && type!=null && regEmail.test(email)){
	  		$.ajax({
			type:'post',
			url:'/topiecms/portal/que/save',
			data:$('#questionForm').serialize(),
			success:function(data){
				alert("感谢您提供宝贵的意见!");
				document.getElementById("questionForm").reset(); 
			},
			error:function(){
				alert("表单提交错误");
			}
	 	});
  	}else{
  		alert("请输入相应的信息以及正确的格式");
  	}
  }
</script>
</head>
<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<ul class="interact-list clearfix">
                	<#assign enArr = ["DOWNLOAD","DATA SHARE","SURVEY","FEED BACK"] >
		<@channelListDirective channelId=4>
							<#list channels as chan>
                        
                	<li style="padding-left:0px;"><a href="${chan.url!}">${chan.displayName!}<br>${enArr[chan_index]}</a></li>
			</#list>
			</@channelListDirective>
                </ul>
            </div>
            <div class="row mgt15">
            	<div class="item-title clearfix alter-title">
                     <div class="item-title-partl icon6 pull-left">
                         <span>问卷调查</span>
                     </div>
               </div>
               <div class="option-con">
               		<form action="" method="post" class="style-name" id="questionForm">
                    	<ul>
                        	<li>
                            	<span>需求标题</span>
                            	<input id="title" type="text" name="title"/>
                            </li>
                            <li>
                            	<span>电子邮件</span>
                            	<input id="email" type="email" name="email"/>
                            </li>
                            <li class="clearfix">
                                <span>需求类型</span>
                                <div class="pull-left" style="width:70%;">
                                    <#--
                                    <label for="demond-1"><input type="checkbox" id="demond-1" name="type" value="数据"><i>数据</i></label>
                                    <label for="demond-2"><input type="checkbox" id="demond-2" name="type" value="应用"><i>应用</i></label>
                                    <label for="demond-3"><input type="checkbox" id="demond-3" name="type" value="接口"><i>接口</i></label>
                                    -->
                                    <#list types as type>
                                        <label for="demond-${type_index+1}">
                                        <input type="checkbox" id="demond-${type_index+1}" name="type" value="${type.itemName}">${type.itemName}
                                        </label>
                                    </#list>
                               </div>
                            </li>
                            </br>
                            <li class="clearfix">
                                <span>委办局</span>
				<input id="email" type="email" name="email"/>
                               <!-- <div class="pull-left" style="width:70%; padding-bottom:10px">-->
                                   <#--
                                    <label for="commition-1"><input type="radio" id="commition-1" name="weibanju" value="社会局"><i>社会局</i></label>
                                   <label for="commition-2"> <input type="radio" id="commition-2" name="weibanju" value="金融处"><i>金融处</i></label>
                                    <label for="commition-3"><input type="radio" id="commition-3" name="weibanju" value="城乡发展处"><i>城乡发展处</i></label>
                                    <label for="commition-4"><input type="radio" id="commition-4" name="weibanju" value="经济体制处"><i>经济体制处</i></label>
                                    <label for="commition-5"><input type="radio" id="commition-5" name="weibanju" value="农村经济统计处"><i>农村经济统计处</i></label>
                                    <label for="commition-7"><input type="radio" id="commition-7" name="weibanju" value="北京市城乡经济信息中心"><i>北京市城乡经济信息中心</i></label>
                                    <label for="commition-8"><input type="radio" id="commition-8" name="weibanju" value="资源与区划处"><i>资源与区划处</i></label>
                                  -->
                                  <#--<#list weibanjus as wbj>
                                      <#if wbj_has_next>
                                      <label   for="commition-${wbj_index+1}">
                                  	<input style="" type="radio" id="commition-${wbj_index+1}" name="weibanju" value="${wbj.itemName}">${wbj.itemName}
                                      </label>
                                   <#else>
                                      <label for="commition-${wbj_index+1}">
                                  	<input style="" type="radio" id="commition-${wbj_index+1}" name="weibanju" value="${wbj.itemName}">${wbj.itemName}
                                      </label>
                                      <br>
                                   </#if>
                                  </#list>-->
                               <!-- <div>-->
                                </br>
                            </li>
                            <li>
                                <span>功能描述</span>
                                <textarea id="funDescrip" name="fundes" style="height:190px;"></textarea>
                            </li>
                            <li style="text-align:center; margin-bottom:10px;">
                            	<span>&nbsp;</span>
                            	<button type="button" onclick="tijiao()" style="margin-right:105px">提交</button>
                            </li>
                        </ul>
                    </form>
               </div>
            </div>
        </div>
    </div>
   <#include "/template/sn_footer.ftl">
</body>
</html>
