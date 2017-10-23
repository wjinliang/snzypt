<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<script type="text/javascript">
  function tijiao(){
  var title=$("#title").val();
  var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
  var email=$("#email").val();
  var tel=$("#tel").val();
  if(title!=''&&email!=''&&tel!=''&&regEmail.test(email)){
  		$.ajax({
		type:'post',
		url:'/topiecms/portal/feedBack/save',
		data:$('#feedBackForm').serialize(),
		success:function(data){
			alert("感谢您提供宝贵的意见!");
			document.getElementById("feedBackForm").reset(); 
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
			</#list></@channelListDirective>
                </ul>
            </div>
            <div class="row mgt15">
            	<div class="item-title clearfix alter-title">
                     <div class="item-title-partl icon5 pull-left">
                         <span>意见反馈</span>
                     </div>
               </div>
               <div class="option-con">
               		<form action="" method="post" class="style-name" id="feedBackForm">
                    	<ul>
                        	<li>
                            	<span>标题:</span>
                            	<input id="title" type="text" name="title"/>	
                            </li>
                            <li>
                            	<span>功能描述:</span>
                            	<textarea id="funDescrip" name="funcdesc" style="height:190px;"></textarea>
                            </li>
                            <li>
                            	<span>电子邮件</span>
                            	<input id="email" type="email" name="email"/>
                            </li>
                            <li>
                            	<span>联系方式</span>
                            	<input id="tel" type="text" name="tel"/>
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
<script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
</body>
</html>
