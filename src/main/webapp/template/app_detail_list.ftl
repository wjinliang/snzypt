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
    <div class="mui-content" style="background: #fff;">
        <div class="mui-control-content mui-active" style="background: #fff; padding: 0 15px;">
            <div class="part" style="padding-top: 10px;">
                    <h1 class="detail-tit bg1"></h1>
                    <div class="form">
                        <ul class="village_list">
                            <li><span>行政村</span><span id="villageXZC"></span></li>
                            <li><span>行政村编码 </span><span id="villageCode"></span></li>
                            <li><span>所属乡镇</span><span id="villageXZ"></span></li>
                            <li><span>所属区县</span><span id="villageQX"></span></li>
                            <li><span>总面积</span><span id="villageMJ"></span></li>
                            <li><span>种植面积  </span><span id="villageZZ"></span></li>
                            <li><span>畜牧面积  </span><span id="villageXM"></span></li>
                            <!--<li><span>林业面积</span><span id="villageLY"></span></li>-->
                        </ul>
                    </div>
                </div>
                <div class="part">
                    <div class="village_intro">
                        <h1 class="intro_tit">介绍</h1>
                        <p></p>
                    </div>
                </div>
                <div class="part">
                    <div class="guihua">
                        <h1 class="intro_tit">规划图则</h1>
                        <ul class="gh_list">
                        </ul>
                    </div>
                </div>       
        </div>
    </div>
</body>
<script src="/html/shenong-app/js/jquery-1.12.1.min.js"></script>
<script src="/html/shenong-app/js/mui.min.js"></script>
<script type="text/javascript">
    mui.init();
    mui.plusReady(function(){
      plus.webview.currentWebview().addEventListener("show",function(){
      
	    $(".guihua").hide();
	    $('.gh_list').empty();
	var villageName = localStorage.getItem('villageName');
	var villageCode = localStorage.getItem('villageCode');
	mui.ajax('findVillageInfoByCode', {
                data: {villageCode: villageCode},
                dataType: 'json', //服务器返回json格式数据
                type: 'post', //HTTP请求类型
				async:false,
                timeout: 10000, //超时时间设置为10秒；
                success: function(res) {
                    // var result = eval('(' + data + ')'); //js原生方法解析json字符串为json对象
					var spanStr = '';
					$(".detail-tit").text(villageName);
					$(".village_intro p").text(res.data.xclyJj);
					$("#villageXZC").text(res.data.village.mc);//行政村
					$("#villageCode").text(res.data.village.code);
					$("#villageXZ").text(res.data.village.szXz);//乡镇
					$("#villageQX").text(res.data.village.szQx);//区县
					$("#villageMJ").text(res.data.village.mj+"平方千米");//面积
					//$("#villageLY").text(res.data.village.result+"亩");//林业面积
					$("#villageXM").text(res.data.village.animalMj+"亩");//畜牧面积
					$("#villageZZ").text(res.data.village.plantMj+"亩");//种植面积
				initGuiHua(res.data.village.mc);
					/*var honor = res.data.honor;
					if(honor){
						for(var i = 0; i<honor.length; i++){
							spanStr+="<span>"+honor[i]+"</span>";
						}
					}
					 $(".flower-logo").empty().append(spanStr);*/
					 //TODO 地图定位
                },
                error: function(xhr, type, errorThrown) {
					mui.alert("服务器错误");
                }
            });
         });
      });
    /* 规划图则start*/
	function initGuiHua(name){
		$.ajax({url:"byname",
			data:{name:name},
			type: 'post', //HTTP请求类型
			success:function(res){
				if(res.status==1){
				 var list = res.data;
				  if(list && list.length>0){
					var $tuze = $('.guihua');
					var $downtuze = $('.gh_list');
					for(var i=0;i<list.length;i++){
						var item = list[i];
						if(item.typeId=='1'){
							$tuze.show();	
							$downtuze.append('<li><img src="/resource/countryPic/02/'+item.url+'"></li>');		
						}else if(item.typeId=='2'){
							//$downtuze.append('<div><a href="/resource/countryPic/02/'+item.url+'">'+item.fileName+'</a></div>');
						}
					}
					
				}else{
					
					console.log("没有村庄规划图则");
				}

				}else{
					console.log("规划图片加载失败！");

				}
			}});
	}


/* 规划图则end*/
</script>
</html>