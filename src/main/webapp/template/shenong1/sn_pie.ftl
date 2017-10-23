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
$( window ).resize(function() {
	
		chart1.redraw();
		chart1.reflow();
		
	});
	
	chart1 = new Highcharts.Chart({
		chart: {
            renderTo: 'container',
	    plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
         },
        title: {
        	
            text: '农机服务组织分布对比'
        },
        
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: '农机服务组织',
            colorByPoint: true,
            data: [{
                name: '大兴区',
                y: 143
            }, {
                name: '通州区',
                y: 53
            }, {
                name: '朝阳区',
                y: 0
            }, {
                name: '平谷区',
                y: 9
            }, {
                name: '顺义区',
                y: 834
            }, {
                name: '昌平区',
                y: 803
            }, {
                name: '密云县',
                y: 57
            }, {
                name: '怀柔区',
                y:317
            }, {
                name: '延庆县',
                y: 83
            }, {
                name: '房山区',
                y: 1394
            }, {
                name: '丰台区',
                y: 15
            }, {
                name: '门头沟区',
                y: 200
            }, {
                name: '石景山区',
                y: 0
            }, {
                name: '海淀区',
                y: 160
            }]
        }]
    });

</script>
</body>
</html>
