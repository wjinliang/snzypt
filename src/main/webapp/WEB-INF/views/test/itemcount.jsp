<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>村情</title>
<script src="<%=basePath%>assets/global/plugins/echart/echarts.js"
	type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
	<script type="text/javascript">  
        $(function () {  
            $.ajax({    //初始化选择框
                type: "post",  
                contentType: "application/json",  
                url: "<%=basePath%>portal/ajax/findAllCounty",  
                data: "{}",  
                success: function (result) {  
                	if(result.msg=='success'){
	                    var stroption = '';  
	                    for (var i = 0; i < result.data.length; i++) {  
	                        stroption += '<option value=' + result.data[i].code + '>';  
	                        stroption += result.data[i].mc;  
	                        stroption += '</option>';  
	                    }  
	                    $('#qx').append(stroption);  
                	}else{
                		alert("无结果集");
                	}
                }  
            })  
  
            $('#qx').change(function () {  //选择区县进行异步查询其下的乡镇
            	var qx=$(this).val();
	                $('#xz option:gt(0)').remove();  
	                $('#cz option:gt(0)').remove();  
	                $.ajax({  
	                    type: "post",  
	                    contentType: "application/json",  
	                    url: "<%=basePath%>portal/ajax/findTownByQxCode?qxCode="+qx,  
	                    success: function (result) {  
	                    	if(result.msg=='success'){
		                        var strqx = '';  
		                        for (var i = 0; i < result.data.length; i++) {  
		                            strqx += '<option value=' + result.data[i].code + '>';  
		                            strqx += result.data[i].mc;  
		                            strqx += '</option>';  
		                        }  
		                        $('#xz').append(strqx);  
	                    	}else{
	                    		
	                    	}
	                    }  
               		 });  
            })  
  
            $('#xz').change(function () { //选择乡镇进行其下的村子查询
            	var xz=$(this).val();
            	if(xz==null){
            		return;
            	}
                $('#cz option:gt(0)').remove();  
                $.ajax({  
                    type: "post",  
                    contentType: "application/json",  
                    url: "<%=basePath%>portal/ajax/findVillageByXzCode?xzCode="+xz,  
                    success: function (result) {
                    	if(result.msg=='success'){
	                        var strvillage = '';  
	                        for (var i = 0; i < result.data.length; i++) {  
	                            strvillage += '<option value=' + result.data[i].code + '>';  
	                            strvillage += result.data[i].mc;  
	                            strvillage += '</option>';  
	                        }  
	                        $('#cz').append(strvillage);  
                    	}else{}
                    }  
                }) ; 
            })  
        })  
    </script>  
</head>
<body>
               区县<select id="qx">  
          <option >--请选择区县--</option>  
        </select>
                
               乡镇 <select id="xz">  
           <option>--请选择乡镇--</option>  
        </select>
                村子<select id="cz" onchange="init();">  
              <option>--请选择村子--</option>  
         </select>  
<input type="text" name="xczMc"><input type="button" onclick="findVillageByName();" value="查询">

<fieldset>
<legend>村情</legend>
<fieldset>
<legend>种植生产</legend> 
<a  onclick="findItemInfoInVillage('MpJbxx');" target="_bank">苗圃基地：<span id="MpJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('GyJbxx');" target="_bank">果园基地：<span id="GyJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('HhjdJbxx');" target="_bank">花卉基地：<span id="HhjdJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('SnqyJbxx');" target="_bank">涉农企业：<span id="SnqyJbxx"></span></a><br>
</fieldset>
<fieldset>
<legend>畜牧水产</legend>
<a  onclick="findItemInfoInVillage('XqlzcJbxx');" target="_bank">畜禽良种场：<span id="XqlzcJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('DanjiJbxx');" target="_bank">蛋鸡养殖场：<span id="DanjiJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('NainiuJbxx');" target="_bank">奶牛养殖场：<span id="NainiuJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('ScyzcJbxx');" target="_bank">水产养殖场：<span id="ScyzcJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('TzqyJbxx');" target="_bank">屠宰企业：<span id="TzqyJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('SyjyqyJbxx');" target="_bank">兽医经营企业：<span id="SyjyqyJbxx"></span></a><br>
</fieldset>

<fieldset>
<legend>市场资源</legend>
<a  onclick="findItemInfoInVillage('CsJbxx');" target="_bank">超市：<span id="CsJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('NfscJbxx');" target="_bank">农副市场：<span id="NfscJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('JyscJbxx');" target="_bank">经营市场:<span id="JyscJbxx"></span></a><br>
</fieldset>

<fieldset>
<legend>农业科技</legend>
<span id="JyscJbxx"></span>
<a  onclick="findItemInfoInVillage('KjsfhJbxx');" target="_bank">科技示范户：<span id="KjsfhJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('KjsfyqJbxx');" target="_bank">科技示范园区：<span id="KjsfyqJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('WlwsdjsJbxx');" target="_bank">物联网示范点：<span id="WlwsdjsJbxx"></span></a><br>
<a  onclick="findItemInfoInVillage('"NyjstgzJbxx"');" target="_bank">农业技术推广站<span id="NyjstgzJbxx"></span></a><br>
</fieldset>

<fieldset>
<legend>村情基本信息</legend>
行政村编码：<span id="code"></span><br>
所属区县：<span id="szQx"></span><br>
耕地面积：<span id="area"></span><br>
常住人口：<span id=""></span><br>
经济总收入：<span id=""></span><br>

</fieldset>
</fieldset>
<div id="show"></div>
	<script type="text/javascript">
	var villageCode="";
	
	function ShowDialog(url) {  //活动窗口，传入url以小窗口展示
		  var iWidth=600; //窗口宽度
		  var iHeight=480;//窗口高度
		  var iTop=(window.screen.height-iHeight)/2;
		  var iLeft=(window.screen.width-iWidth)/2;
		  window.open(url,"Detail","Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
		 }
	function init(){ //1、初始化页面 2、选择框村情查询（整个页面的查询）
		villageCode=$("#cz").val();
		selectSearch(villageCode); 
	}
	function selectSearch(villageCode){  //村情查询（整个页面）
	if(villageCode==null){
			return false;
		}
		tipItems='${tipItems}';
		items=tipItems.split(",");
		
		for(var i=0;i<items.length;i++){
			 findItemCountInVillage(villageCode,items[i],items[i]); 
		}
		findVillage
		InfoByCode(villageCode);
	}
	
	function findItemCountInVillage(villageCode,tipItem,itemId) {  //查询村中的各个项目的数量. villageCode:村子编码   tipItem:项目名  itemId:项目在页面的id
		$.ajax({
			type : "POST",
			dataType : "json",
			data:"villageCode=" + villageCode + "&tipItem=" + tipItem,
			url : "<%=basePath%>portal/ajax/findItemCountInVillage",
			success : function(data) {
				if(data.msg=="success")
					$("#"+itemId).text(data.data.value);
			},
		   error :function(e){
			   alert("请求错误");
		   }
		});
	}
	function findItemInfoInVillage(tipItem) {  //查询村中的项目详情   tipItem：项目名
		ShowDialog("<%=basePath%>portal/view/findItemInfoInVillage?villageCode="+villageCode+"&tipItem="+tipItem);
	}
	function findVillageInfoByCode(villageCode) {  //通过村子编码查询村子详情
		$.ajax({
			type : "POST",
			dataType : "json",
			data:"villageCode=" + villageCode,
			url : "<%=basePath%>portal/findVillageInfoByCode",
			success : function(data) {
				if(data.msg=="success"){
					$("#code").text(data.data.code);
					$("#szQx").text(data.data.szQx);
					$("#area").text(data.data.mj);
			}
			},
		   error :function(e){
			   alert("请求错误");
		   }
		});
	}
	
	function findVillageByName() {  //通过村子名模糊查询村子列表
		var villageName=$("input[name='xczMc']").val();
	if($.trim(villageName)==null||villageName==""){
		alert("请输入查询村名");
	}else{
		ShowDialog("<%=basePath%>portal/view/findVillageByName?villageName="+villageName);
	}
	}
	</script>
</body>
</html>