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
		<header class="mui-bar mui-bar-nav">
            <h1 class="mui-title">基本信息</h1>
		</header>
        <nav class="mui-bar mui-bar-tab nav-btm" style="background: #fff; border-top:1px solid #ebebeb;">
            <a class="mui-tab-item mui-active" id="0">
                <span class="mui-icon mui-icon-infos"></span>
                <span class="mui-tab-label">基本信息</span>
            </a>
            <a class="mui-tab-item" id="1">
                <span class="mui-icon mui-icon-abstract"></span>
                <span class="mui-tab-label">概况</span>
            </a>
            <a class="mui-tab-item" id="2">
                <span class="mui-icon mui-icon-agricultrue"></span>
                <span class="mui-tab-label">农业生产</span>
            </a>
            <a class="mui-tab-item" id="3">
                <span class="mui-icon mui-icon-trip"></span>
                <span class="mui-tab-label">休闲旅游</span>
            </a>
            <a class="mui-tab-item" id="4">
                <span class="mui-icon mui-icon-tech"></span>
                <span class="mui-tab-label">农业科技</span>
            </a>
        </nav>
	</body>
	<script src="/html/shenong-app/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init();
			mui.plusReady(function() {
				// 获得头部标题
				 var tittle=document.querySelector('.mui-title');
				//设置默认打开首页显示的子页序号
				var Index = 0;
				//把子页面路径写在数组里面
				var subpages = ['main.htm', 'detail_info.htm', 'detail_shengchan.htm', 'detail_lvyou.htm', 'detail_keji.htm'];
				//获取当前页面所属的Webview窗口对象
				var self = plus.webview.currentWebview();
				for(var i = 0; i < 5; i++) {
					
					//创建webview子页
					var sub = plus.webview.create(
						subpages[i], //子页url
						subpages[i], //子页id
						{
							top: '44px',
							bottom: '44px',
							scrollIndicator: "none", //隐藏滚动条
						}
					);
					//如果不是我们设置的子页就隐藏
					if(i != Index) {
						sub.hide()
					}
					//将webview对象填充到窗口
					self.append(sub)
				}
 
				//当前激活选项
				var activeTab = subpages[Index]
				var targetTab;
				mui('.mui-bar-tab').on('tap', 'a', function(e) {
					//获取子页面的id
					var j = this.getAttribute('id')
					targetTab = subpages[j]
					if(activeTab == targetTab) {
						return
					}
					tittle.innerHTML=this.querySelector('.mui-tab-label').innerHTML;
					//显示目标选项卡
					plus.webview.show(targetTab)
					targetTab.realod();
					//隐藏当前选项卡
					plus.webview.hide(activeTab)
					//更改当前活跃选项卡
					activeTab = targetTab
				})
			})
    </script>

</html>