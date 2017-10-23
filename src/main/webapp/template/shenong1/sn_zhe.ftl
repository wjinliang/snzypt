<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>北京涉农资源信息平台</title>
<link rel="stylesheet" type="text/css" href="/html/shenong-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/shenong-static/css/layout.css">
<script type="text/javascript" src="/html/shenong-static/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/html/shenong-static/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<#include "/template/sn_daohang.ftl">
    <div class="con-wrap bg-img-data" style="padding-bottom:15px;">
    	<div class="container">
        	<div class="row">
                <div class="position-info">
                    <span>您所在的位置：</span>
                    <@currentLocationDirective contentId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                </div>
		    </div>
		    <div class="row">
			<div class="col-md-12" style="padding-left:0px;">
				<div id="container">
				</div>
			</div>
	</div>
    </div>
    <#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/shenong-static/js/highcharts.js"></script>
<script type="text/javascript">
var chart1;
$(function () {
	
	$( window ).resize(function() {
	
		chart1.redraw();
		chart1.reflow();
		
	});
	
	chart1 = new Highcharts.Chart({
		chart: {
            renderTo: 'container'
         },
        title: {
        	
            text: '数据统计'
        },
        xAxis: {
            categories: ['大兴区', '通州区', '朝阳区', '平谷区','顺义区','昌平区','密云县','怀柔区','延庆县','房山区','丰台区','门头沟区','石景山区','海淀区']
        },
        yAxis: {
            title: {
                text: '组织(个)'
            },
        },
        tooltip: {
        
            valueSuffix: '个'
        },
        series: [
		{
            type: 'line',
            name: '超市',
            data: [36,69,154,2,60,40,19,15,4,8,125,19,45,203]
        },
		
		{
            type: 'line',
            name: '农加工企业',
            data: [17,29,11,9,25,21,0,26,0,13,5,0,0,3]
        }]
    });
	var num = false;
	$('#button').click(function(){
	var types = "column";
	if(num){types='line';}else{types='column';}
		for(var i=0;i<chart1.series.length;i++) {
            var serie = chart1.series[i];
            serie.update({
			    type:types
            });
        }
		num = !num;
    });
});

</script>
</body>
</html>
