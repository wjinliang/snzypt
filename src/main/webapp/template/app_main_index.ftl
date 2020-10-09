<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
        <link rel="stylesheet" href="/html/shenong-app/css/mui.css">
        <link rel="stylesheet" href="/html/shenong-app/css/layout.css">
	</head>

	<body>
	  <div class="mui-content" style="margin:100px 50px ;background-color:#2c76c791;">
		<h1>欢迎使用农委OA <span class="mui-badge mui-badge-danger">1</span></h1>
		<h2>欢迎使用农委OA<span class="mui-badge mui-badge-success">2</span></h2>
		<h3>欢迎使用农委OA<span class="mui-badge mui-badge-warning">3</span></h3>
		<h3><a href="/html/shenong-app/dist/addressMatchService.html">地图</a></h3>
		<h4><a id="indexapp" style="color:blue;">村情APP</a></h4>
	  <div>
	</body>
<script src="/html/shenong-app/js/jquery-1.12.1.min.js"></script>
	<script src="/html/shenong-app/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init();
	mui.plusReady(function() {
		
		document.getElementById("indexapp").addEventListener("tap", function(){
			window.location.href = "app_index.htm";
		})
	})
    </script>

</html>