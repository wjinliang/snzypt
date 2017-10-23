<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<script type="text/javascript">
	
  function tijiao(){
  var selected=true;
  var kvName = {};
	 $('.necessary').each(function () {
	  if (kvName[this.name]) return true;
		  if(this.type=='text'){
			  var tex=$('[name="' + this.name + '"]').val();
			  var input= /^[\s]*$/;
			  if(tex.length==0){
			  	alert("答案不能为空 ");
			  	this.focus();
			   	selected=false;
			  }else if(input.test(tex)){
			   	alert("答案不能只有空格");
			   	this.focus();
			   	selected=false;
			   }
		  }else{
			   if ($('[name="' + this.name + '"]:checked').length == 0) {
		 	 		alert("带*的为必填项");
		 	 		this.focus();
		 	 		selected=false;
		 	 		return false;
		 	  }
		 	    kvName[this.name] = true;
			  }
	 	 
	 });
	 if(selected){
	 	$.ajax({
		type:'post',
		url:'/topiecms/questionManager/ajax/tijiaoAnswer',
		data:$('#questionAnswerForm').serialize(),
		success:function(data){
			alert("感谢您提供宝贵的意见!");
			document.getElementById("questionAnswerForm").reset(); 
		},
		error:function(){
			alert("表单提交错误");
		}
 	});
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
               		<form action="" method="post" class="style-name" id="questionAnswerForm">
               		  <#--问卷管理id-->
               		  <input type="hidden" name="questionNameId" value="${questionNameId}">
               		    <ul>
	               			<#--开始遍历相关的topics信息 0:单选  1:多选 2:文本框-->
	               			<#list topicList as questionnaireTopic>
	               			   <#if questionnaireTopic.topicType=="0">
	               			   		<li class="clearfix">
	               			   		    <#--主题相关的Id-->
	               			   		    <input type="hidden" name="answereList[${questionnaireTopic_index}].topicId" value="${questionnaireTopic.topicId}">
                                		<#if questionnaireTopic.ifnecessary=="1"> 
                                		<span><font color="red">*</font>${questionnaireTopic_index+1}.${questionnaireTopic.topicName}</span>
                                		<div class="pull-left" style="width:70%;margin-left:20px;">
		                                    <#list questionnaireTopic.options as option>
		                                        <#if (option_index+1)!=6>
                                      				<label   for="commition-${option_index+1}">
                                  					    <input style="margin-left:-20px" type="radio" id="commition-${option_index+1}" name="answereList[${questionnaireTopic_index}].optionId" value="${option.optionId}" class="necessary">${option.optionName}
                                     			    </label>
                                   				</#if>
			                                   <#if (option_index+1)==6>
			                                      <label for="commition-${option_index+1}">
			                                  		<input style="margin-left:-20px" type="radio" id="commition-${option_index+1}" name="answereList[${questionnaireTopic_index}].optionId" value="${option.optionId}" class="necessary">${option.optionName}
			                                      </label>
			                                      <br>
			                                   </#if>
		                                    </#list>
                              			 </div>
                              			 <#else>
                              			 <span>${questionnaireTopic_index+1}.${questionnaireTopic.topicName}</span>
                                		<div class="pull-left" style="width:70%;margin-left:20px;">
		                                    <#list questionnaireTopic.options as option>
		                                        <#if (option_index+1)!=6>
                                      				<label   for="commition-${option_index+1}">
                                  					    <input style="margin-left:-20px" type="radio" id="commition-${option_index+1}" name="answereList[${questionnaireTopic_index}].optionId" value="${option.optionId}">${option.optionName}
                                     			    </label>
                                   				</#if>
			                                   <#if (option_index+1)==6>
			                                      <label for="commition-${option_index+1}">
			                                  		<input style="margin-left:-20px" type="radio" id="commition-${option_index+1}" name="answereList[${questionnaireTopic_index}].optionId" value="${option.optionId}">${option.optionName}
			                                      </label>
			                                      <br>
			                                   </#if>
		                                    </#list>
                              			 </div>
                           			 </#if>
                           			 </li>
                           			 
                           	   </#if>
	               			   <#if questionnaireTopic.topicType=="1">
	               			        <li class="clearfix">
	               			            <input type="hidden" name="answereList[${questionnaireTopic_index}].topicId" value="${questionnaireTopic.topicId}">
                                		<#if questionnaireTopic.ifnecessary=="1"> 
                                		<span><font color="red">*</font>${questionnaireTopic_index+1}.${questionnaireTopic.topicName}</span>
                                		<div class="pull-left" style="width:70%;">
		                                    <#list questionnaireTopic.options as option>
		                                        <label for="demond-${option_index+1}">
		                                        <input type="checkbox" id="demond-${option_index+1}" name="answereList[${questionnaireTopic_index}].optionId" value="${option.optionId}" class="necessary">${option.optionName}
		                                        </label>
		                                    </#list>
                              			 </div>
                              			 <#else>
                              			 <span>${questionnaireTopic_index+1}.${questionnaireTopic.topicName}</span>
                                		<div class="pull-left" style="width:70%;">
		                                    <#list questionnaireTopic.options as option>
		                                        <label for="demond-${option_index+1}">
		                                        <input type="checkbox" id="demond-${option_index+1}" name="answereList[${questionnaireTopic_index}].optionId" value="${option.optionId}" >${option.optionName}
		                                        </label>
		                                    </#list>
                              			 </div>
                              			 </#if>
                           			 </li>
                           	   </#if>
	               			   <#if questionnaireTopic.topicType=="2">
	               			       <li>
	               			            <input type="hidden" name="answereList[${questionnaireTopic_index}].topicId" value="${questionnaireTopic.topicId}">
                            			<#if questionnaireTopic.ifnecessary=="1">
                            			<span> <font color="red">*</font>${questionnaireTopic_index+1}.${questionnaireTopic.topicName}</span>
                            				<input id="title" type="text" name="answereList[${questionnaireTopic_index}].optionId" class="necessary"/>
                            				<#else>
                            				<span>${questionnaireTopic_index+1}.${questionnaireTopic.topicName}</span>
                            				<input id="title" type="text" name="answereList[${questionnaireTopic_index}].optionId"/>
                            			</#if>
                            		</li>
	               			   </#if>
	               			</#list>
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
