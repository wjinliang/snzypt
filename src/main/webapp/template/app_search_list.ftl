<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>搜索</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
        <link rel="stylesheet" href="/html/shenong-app/css/mui.css">
        <link rel="stylesheet" href="/html/shenong-app/css/layout.css">
	</head>
<body>
    <div class="mui-content">
        <div class="index">
            <div class="search">
                <input type="search" id="searchInput" class="mui-input-clear" placeholder="输入乡村名称检索基本情况">
                <span class="serach-icon" id="searchTap"></span>
            </div>
            <div class="search-result">
				<ul id="searchList" class="search-list"></ul>
				<!--<div class="delete-btn"><span id="deleteBtn">删除历史记录</span></div>-->
			</div>
        </div>
    </div>
</body>
<script src="/html/shenong-app/js/jquery-1.12.1.min.js"></script>
<script src="/html/shenong-app/js/mui.min.js"></script>
<script type="text/javascript">
    mui.init();
    document.getElementById("searchInput").focus();
	mui.plusReady(function() {
		document.getElementById("searchInput").addEventListener('input', function(){
			var value = document.getElementById("searchInput").value;
			searchHistory(value);
			var ulNode = document.getElementById("searchList");
			ulNode.addEventListener('tap', function(ev){
				var event = ev||window.event;
				var target = ev.target || ev.srcElement;
				if(target.nodeName.toLowerCase() == 'li'){
					var liValue = target.getAttribute("data-value");
					var liName = target.innerHTML;
					//document.getElementById("searchInput").value = liName;
					var view = plus.webview.currentWebview().opener();
					//传递参数
					mui.fire(view, 'getLocation', {
						inputVal: liValue,
						inputName: liName
					});
					mui.back();
				}
			})
		});
		/*document.getElementById('searchTap').addEventListener('tap', function(){
			var value = document.getElementById("searchInput").value;
			var view = plus.webview.currentWebview().opener();
			//传递参数
			mui.fire(view, 'getLocation', {
				inputVal: value,
			});
			mui.back();
		})*/
		/*document.getElementById('deleteBtn').addEventListener('tap', function(){
			document.getElementById("searchInput").value = '';
			$("#searchList").empty();
		})*/
	})
	/*
	* 返回体格式: {
		success: true,
		data: [{},{}]
		}
	*/
	function searchHistory(search_value){
		var len=20;  //设定存储的历史记录个数
		mui.ajax('/${application}/portal/app/getVillage', {
		    data: {name: search_value},
		    dataType: 'json', //服务器返回json格式数据
		    type: 'post', //HTTP请求类型
			async:false,
		    timeout: 10000, //超时时间设置为10秒；
		    success: function(res) {
			$("#searchList").empty();
			insertToHistoryList(res.data);
		    },
		    error: function(xhr, type, errorThrown) {
			mui.alert("服务器错误");
		    }
		});
	}
	/*将搜索结果插入到历史记录中*/
	function insertToHistoryList(list){
		$("#searchList").show();
		for(var i = 0; i < list.length; ++i) {
			var search_name =list[i].mc;
			if(search_name != null){
				var str = '<li data-value="'+list[i].code+'">'+list[i].mc+'</li>';
			}else{
				var str = '';
		    }
			$(str).appendTo($("#searchList"));
		}
	}
</script>
</html>