<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>后台管理 | 添加问卷管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />
<%@include file="../../includejsps/style.jsp"%>
<%@include file="../../includejsps/plugin-style.jsp"%>
<script type="text/javascript">
$(function(){
	$("#siteForm").get(0).style.top=200+"px";
});
$("#starttime").on("click", function () {
    laydate({
        istime: true,
        format: 'YYYY-MM-DD'
    });
});
$("#endtime").on("click", function () {
    laydate({
        istime: true,
        format: 'YYYY-MM-DD'
    });
});
var parameterIndex = 0;
var $deleteParameter = $("a.deleteParameter");
var $saveParameter = $("a.saveParameter");//添加二级选项
var $optiondeleteParameter = $("a.optiondeleteParameter");//删除二级选项
var parameterIndexs = 0;
//0:单选     1:多选按钮     2:文本框
function radios(operateType){
	//添加单选框参数
	var radioParameters="<div data-row='3+"+parameterIndex+"' class='row'>"
					    +"<div class='col-md-12'>"
		+"			  			<div class='form-group'>"
		+"			  					<label class='control-label col-md-3 timu' >题目<b class='innum"+parameterIndex+"'>"+(parameterIndex+1)+"</b></label>"
		+"             <b>必填</b><input type='checkbox' name='questionTopicList["+parameterIndex+"].ifnecessary' value='1' checked='checked'/>&nbsp&nbsp"
		+"			  				<div class='col-md-4'>"
		+"                              <input type='hidden' name='option"+operateType+"'/>"
		+"                               <input type='hidden' name='questionTopicList["+parameterIndex+"].topicType' value='"+operateType+"'/>"
		+"			  					<input type='text' showicon='false' id='name' name='questionTopicList["+parameterIndex+"].topicName' class='form-control input-large' placeholder=''>"
		+"			  				</div>"
		+"			  				<!-- <div class='col-md-5'> -->"
		if(operateType!=2){
			radioParameters+="<a href='javascript:;' class='saveParameter'  data-addid='"+parameterIndex+"'>添加选项</a>&nbsp&nbsp"
		}
		radioParameters+="<a  data-id='"+parameterIndex+"' class='deleteParameter'>删除</a>"
		radioParameters+="<!-- </div> -->"
		radioParameters+="</div>"
		radioParameters+="</div>"
		radioParameters+="</div>";
	$("#parameters").append(radioParameters);	
		parameterIndex++;
}
$deleteParameter.live("click", function() {
	parameterIndex--;
	var index = $(this).data("id");
	$(this).parent().parent().parent().remove();
	reloadName(index);
}); 
 function reloadName(inx) {
	//文本框里面坐标
    var x = inx;
	//标题序号
	var index = inx + 1;
	var ele = $("input[name='questionTopicList[" + index + "].topicName']");
	ele.attr("name", "questionTopicList[" + x + "].topicName"); 
	var inele = $("b[class='innum" + index + "']");
	inele.attr('class', "innum" + x);
	inele.html(x+1); 
	var dataele = $("a[data-id='" + index + "']");
	dataele.attr("data-id", x);
	var adddataele = $("a[data-addid='" + index + "']");
	var opele = $("input[name='option" + index + "']");
	opele.attr("name", "option" + x );
	
	var opseqele = $("input[name='optionseq" + index + "']");
	opseqele.attr("name", "optionseq" + x );  
	var opelet = $("input[name='optiontt" + index + "']");
	opelet.attr("name", "optiontt" + x );
	
	adddataele.attr("data-addid", x);
	if (index < parameterIndex)
		reloadName(inx + 1); 
 }
 /**添加二级选项相关信息*/
 $saveParameter.live(
	"click",
	function() {
		var addid = $(this).data("addid");
		var optionsParameters="<div data-row='2' class='row'>"
			+"					<div class='col-md-12'>"
			+"						<div class='form-group'>"
			+"							<label class='control-label col-md-4'><font"
			+"								style='font-size: larger; color: red;'></font>选项</label>"
			+"							<div class='col-md-3'>"
			+"								<div class='input-group input-medium'>"
			+"									<input type='text' showicon='false' id='name'"
			+"										name='optiontt"+addid+"' class='form-control sr-only'>"
			+"								</div>"
			+"							</div>"
			+"							<div class='col-md-5'>"
			+"			  						<a href='javascript:void(0);' class='optiondeleteParameter'>删除</a>"
			+"			  					</div>"
			+"						</div>"
			+"					</div>"
			+"				</div>"
		$(this).parent().parent().parent().append(optionsParameters);
		parameterIndexs++;
});
/**删除二级选项*/
$optiondeleteParameter.live("click", function() {
	parameterIndexs--;
	var index = $(this).data("id");
	$(this).parent().parent().remove();
	reloadName(index);
});
//提交表单相关的信息
function saveSubmit() {
	//表单验证的相关信息
	var name=$("#name").val();
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(name==""){
		alert("请输入问卷名称!");
		return false;
	}
	if(starttime==""){
		alert("请输入开始时间!");
		return false;
	}
	if(endtime==""){
		alert("请输入结束时间!");
		return false;
	}
	var startNum = parseInt(starttime.replace(/-/g,''),10);
	var endNum = parseInt(endtime.replace(/-/g,''),10);
	if(startNum > endNum){
		alert("开始时间不能大于结束时间");
		$("#starttime").val("");
		$("#endtime").val("")
		return false;
	}
	var i=0;
	var j=0;
	while(j<parameterIndex){
	var ops  = $("input[name='optiontt"+j+"']"); 
		var wenjuantype=$("input[name='questionTopicList["+j+"].topicType']").val();
	if(wenjuantype!=2&&ops.length==0){
		alert("题目"+(j+1)+"需要添加选项!");
		return false;
	}
	j++;
	}
	for(i;i<ops.length;i++){
		if(ops[i].value==""){
			alert("请输入问卷选项!");
			return false;
		}
	}	
	var wenjuan1=$("input[name='questionTopicList[0].topicName']").val();
	if(typeof(wenjuan1)=='undefined'){
		alert("请输入问卷题目!");
		return false;
	}
	for (var i = 0; i < parameterIndex; i++) {
		var wenjuan1=$("input[name='questionTopicList["+i+"].topicName']").val();
		if(wenjuan1 == ""){
			alert("请输入问卷题目!");
			return false;
		}
	}
	
	//验证通过后方可进行提交表单
	  $.ajax({
		type : "post",
		data : $("#inputForm").serialize(),
		url : "../questionManager/save",
		success : function(result) {
			alert("添加信息成功");
			grid.reload();
			modal.hide();
		},
		error : function() {
			alert("添加信息失败");
		}
	}); 
}

</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
	<!-- BEGIN HEADER -->

	<%-- <%@include file="../../includejsps/head.jsp"%> --%>
	<!-- END HEADER -->
	<!-- BEGIN PAGE CONTAINER -->
	<!-- <div class="page-container"> -->
		<!-- END PAGE HEAD -->
		<!-- BEGIN PAGE CONTENT -->
		<!-- <div class="page-content"> -->
		<!-- panel  start -->
		   <div class="panel panel-default">
   			 <div class="panel-body">
   			    <button type="button" class="btn btn-primary" onclick="radios(0)">单选框</button>
   			    <button type="button" class="btn btn-primary" onclick="radios(1)">复选框</button>
   			    <button type="button" class="btn btn-primary" onclick="radios(2)">文本框</button>
   			    <br><br>
   			    <!-- form start -->
   			    <form role="form" class="form-horizontal" id="inputForm" beforeSubmit="option2options">
   			        <!-- 问卷名称 -->
				  	<div data-row="0" class="row">
				  		<div class="col-md-12">
				  			<div class="form-group">
				  					<label class="control-label col-md-3"><font style="font-size: larger;color:red;">*</font>问卷名称</label>
				  				<div class="col-md-9">
				  					<input type="text" showicon="false" id="name" name="name" class="form-control input-large" placeholder="">
				  				</div>
				  			</div>
				  		</div>
				  	</div>
				  	<!-- 开始时间 -->
				<div data-row="1" class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="control-label col-md-3"><font
								style="font-size: larger; color: red;">*</font>开始时间</label>
							<div class="col-md-9">
								<div class="input-group input-medium">
									<input type="text" role="date-input" id="starttime"
										name="starttime" class="form-control" onblur="panduandata(1)"><span role="icon"
										class="input-group-addon"><i class="fa fa-calendar"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 結束时间 -->
				<div data-row="2" class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="control-label col-md-3"><font
								style="font-size: larger; color: red;">*</font>结束时间</label>
							<div class="col-md-9">
								<div class="input-group input-medium">
									<input type="text" role="date-input" id="endtime"
										name="endtime" class="form-control" onblur="panduandata(2)"><span role="icon"
										class="input-group-addon"><i class="fa fa-calendar"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				 <!-- 单选框参数 -->
				 <div id="parameters">
				 
				 </div>
				 <hr>
				 <div class="form-actions" style="text-align:center;">
					 	<button type="reset" class="btn default btn-lg" role="reset">重置</button>&nbsp;
					 	<button type="button" class="btn blue btn-lg" onclick="saveSubmit()">提交</button>&nbsp;
					 	<button type="button" class="btn default btn-lg" data-dismiss="modal">关闭</button>&nbsp;
				</div>
				<!-- <div data-row="3" class="row">
			  		<div class="col-md-12">
			  			<div class="form-group">
			  					<label class="control-label col-md-4"></label>
			  				<div class="col-md-4">
			  					<input type="text" showicon="false" id="name" name="name" class="form-control input-large" placeholder="">
			  				</div>
			  				<div class="col-md-4">
			  					<a href="javascript:void(0);" onclick="delTopics()">删除</a>
			  				</div>
			  			</div>
			  		</div>
			  	</div> -->
			  	<!-- 添加二级选项 -->
			  	<!-- <div data-row="2" class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="control-label col-md-4"><font
								style="font-size: larger; color: red;"></font></label>
							<div class="col-md-3">
								<div class="input-group input-medium">
									<input type="text" showicon="false" id="name"
										name="name" class="form-control sr-only">
								</div>
							</div>
							<div class="col-md-5">
			  						<a href="javascript:void(0);" onclick="delTopics()">删除</a>
			  					</div>
						</div>
					</div>
				</div> -->
			</form>
   			<!-- form end -->
    		</div>
		</div>
		<!-- panel  end -->
		<!-- </div> -->
		<!-- END PAGE CONTENT -->
	<!-- </div> -->
	<!-- END PAGE CONTAINER -->
</body>
<!-- END BODY -->
</html>