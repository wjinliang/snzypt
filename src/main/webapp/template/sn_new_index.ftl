<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="renderer" content=webkit>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
    <title>${site.displayName!}</title>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css" />
    <link rel="stylesheet" href="/html/sn-static209/jl/style.css?v=1" />
  </head>

  <body>
    <div class="index-wrap">
      <div class="common-header">
        <div class="header-top">
          <div class="setWidth clearfix">
            <div class="header-font">
              <img src="/html/sn-static209/cdn/img/fonticon.png" />
            </div>
            <div class="search-box">
              <input
                type="text"
                value=""
                class="serach-text"
                placeholder="请输入数据资源的名称关键词进行搜索"
              />
              <button class="arg-btn blue-btn">全站搜索</button>
              <!-- <button class="arg-btn blue-btn">高级筛选</button> -->
            </div>
          </div>
        </div>
        <div class="header-btm">
          <div class="set-nav">
            <div class="setWidth nav-position">
              <ul class="arg-nav clearfix">
		<li class="active"><a href="${site.url}">首页</a></li>
		    <@channelListDirective siteId=site.id><#list channels as chan>
			<li  class=""><a href="${chan.url}">${chan.displayName}</a></li>
			</#list></@channelListDirective>
              </ul>
              <span class="shadow"></span>
	      <div class="login-info">
                <span class="nologin">登录</span>
              </div>
              <div class="other-info">
                <span class="userIonfo"></span>
                <span class="systemss">后台管理</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="main-con">
        <div class="main-data-reasource">
          <div class="setWidth">
            <div class="data-source">
              <h1 class="index-tit">数据资源</h1>
              <div class="clearfix pdt76">
                <div class="data-left">
                  <ul class="source-nav">
                    <li>农业生产</li>
                    <li>农业科技</li>
                    <li>市场行情</li>
                    <li>农村改革</li>
                    <li>休闲农业</li>
                  </ul>
                </div>
                <div class="data-center">
                  <div class="data-topic topic1">基础地理</div>
                  <div class="data-topic topic2">涉农机构</div>
                  <div class="data-topic topic3">涉农人员</div>
                  <!--<div class="data-topic topic4">农产品</div>-->
                </div>
                <div class="data-right">
                  <ul class="source-nav">
                    <li>监测预警</li>
                    <li>标准规范</li>
                    <li>智慧乡村</li>
                    <li>舆情资讯</li>
                    <li>质量安全</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="special-topic">
          <div class="setWidth">
            <h1 class="index-tit">特色专题</h1>
            <div class="clearfix pdt76">
              <div class="data-left">
                <ul>
                  <li class="PathInner" id="PathMenu1">
                    <div class="PathMain" onclick="toggleTool_m('PathMenu1');">
                      村情
                    </div>
                    <div class="PathItem PathItem1">
                      <span class="line1 bg1"></span>
                      <a class="link bg1" href="#"> <span>农村总数 </span></a>
                    </div>
                    <div class="PathItem PathItem2">
                      <span class="line2 bg1"></span>
                      <a class="link bg1" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem3">
                      <span class="line3 bg1"></span>
                      <a class="link bg1" href="#"><span>经济收入</span></a>
                    </div>
                    <div class="PathItem PathItem4">
                      <span class="line4 bg1"></span>
                      <a class="link bg1" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem5">
                      <span class="line5 bg1"></span>
                      <a class="link bg1" href="#"><span>经济收入</span></a>
                    </div>
                  </li>
                  <li class="PathInner" id="PathMenu5">
                    <div class="PathMain" onclick="toggleTool_m('PathMenu5');">
                      休闲农业
                    </div>
                    <div class="PathItem PathItem1">
                      <span class="line1 bg6"></span>
                      <a class="link bg6" href="#"><span>农村总数</span></a>
                    </div>
                    <div class="PathItem PathItem2">
                      <span class="line2 bg6"></span>
                      <a class="link bg6" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem3">
                      <span class="line3 bg6"></span>
                      <a class="link bg6" href="#"><span>经济收入</span></a>
                    </div>
                    <div class="PathItem PathItem4">
                      <span class="line4 bg6"></span>
                      <a class="link bg6" href="#"><span>农业用地</span></a>
                    </div>
                  </li>
                  <li class="PathInner" id="PathMenu6">
                    <div class="PathMain" onclick="toggleTool_m('PathMenu6');">
                      统计年鉴
                    </div>
                    <div class="PathItem PathItem1">
                      <span class="line1 bg3"></span>
                      <a class="link bg3" href="#"><span>农村总数</span></a>
                    </div>
                    <div class="PathItem PathItem2">
                      <span class="line2 bg3"></span>
                      <a class="link bg3" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem3">
                      <span class="line3 bg3"></span>
                      <a class="link bg3" href="#"><span>经济收入</span></a>
                    </div>
                  </li>
                </ul>
              </div>
              <div class="data-center" style="position: relative">
                <div id="bjMap" class="map-wrap"></div>
                <div class="ratate">
                  <img src="/html/sn-static209/cdn/img/ratate.png" />
                </div>
                <ul>
                  <li class="circle circle1"><span>50KM</span></li>
                  <li class="circle circle2"><span>30KM</span></li>
                  <li class="circle circle3"><span>15KM</span></li>
                  <li class="circle circle5"></li>
                  <li class="city-center">
                    <span class="circle-text">城市副中心</span
                    ><span class="circle4"></span>
                  </li>
                </ul>
              </div>
              <div class="data-right">
                <ul>
                  <li class="PathInner" id="PathMenu4">
                    <div class="PathMain" onclick="toggleTool_m('PathMenu4');">
                      农情
                    </div>
                    <div class="PathItem PathItem2-1">
                      <span class="line2-1 bg4"></span>
                      <a class="link bg4" href="#"><span> 农村总数</span> </a>
                    </div>
                    <div class="PathItem PathItem2-2">
                      <span class="line2-2 bg4"></span>
                      <a class="link bg4" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem2-3">
                      <span class="line2-3 bg4"></span>
                      <a class="link bg4" href="#"><span>经济收入</span></a>
                    </div>
                    <div class="PathItem PathItem2-4">
                      <span class="line2-4 bg4"></span>
                      <a class="link bg4" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem2-5">
                      <span class="line2-5 bg4"></span>
                      <a class="link bg4" href="#"><span>经济收入</span></a>
                    </div>
                  </li>
                  <li class="PathInner" id="PathMenu2">
                    <div class="PathMain" onclick="toggleTool_m('PathMenu2');">
                      智慧乡村
                    </div>
                    <div class="PathItem PathItem2-1">
                      <span class="line2-1 bg5"></span>
                      <a class="link bg5" href="#"><span>农村总数</span></a>
                    </div>
                    <div class="PathItem PathItem2-2">
                      <span class="line2-2 bg5"></span>
                      <a class="link bg5" href="#"><span>常驻人口</span></a>
                    </div>
                    <div class="PathItem PathItem2-3">
                      <span class="line2-3 bg5"></span>
                      <a class="link bg5" href="#"><span>经济收入</span></a>
                    </div>
                    <div class="PathItem PathItem2-4">
                      <span class="line2-4 bg5"></span>
                      <a class="link bg5" href="#"><span>农业用地</span></a>
                    </div>
                  </li>
                  <li class="PathInner" id="PathMenu5">
                    <div class="PathMain">
                      ...
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
    </div>
    <script src="/html/sn-static209/cdn/js/echarts.min.js"></script>
    <script src="/html/sn-static209/cdn/js/rotateMenu.js"></script>
    <script type="text/javascript">
      var myChart;
	var zNodes = [
	  { id: 1, pId: 0, name: '平台介绍',code:'jieshao',type:'jieshao', iconSkin: 'icon-0' },
	  { id: 2, pId: 0, name: '基础库', code:'jichu',type:'typeParent',open: true, iconSkin: 'icon-1' },
	  { id: 21, pId: 2, name: '基础地理信息',code:'bCIbFy4Y', iconSkin: 'icon-11' },
	  { id: 23, pId: 2, name: '涉农机构信息',code:'a1RtGRtM', iconSkin: 'icon-13' },
	  { id: 24, pId: 2, name: '涉农人员信息',code:'8n5CbiZT', iconSkin: 'icon-14' },
	 // { id: 22, pId: 2, name: '农产品信息',code:'znFoIvFr', iconSkin: 'icon-12' },
	  { id: 3, pId: 0, name: '主题库',code:'zhuti',type:'typeParent', iconSkin: 'icon-2' },
	  { id: 32, pId: 3, name: '标准规范信息',code:'ubQfMxwl', iconSkin: 'icon-28' },
	  { id: 31, pId: 3, name: '农业生产信息',code:'tlEgf4kl', iconSkin: 'icon-210' },
	  { id: 31, pId: 3, name: '农业科技信息',code:'oadjmLpy', iconSkin: 'icon-21' },
	  { id: 32, pId: 3, name: '市场行情信息',code:'c2Ci5cj0', iconSkin: 'icon-22' },
	  { id: 32, pId: 3, name: '质量安全信息',code:'QuHM4Myr', iconSkin: 'icon-25' },
	  { id: 33, pId: 3, name: '休闲农业信息',code:'V5xYUnWp', iconSkin: 'icon-23' },
	  { id: 31, pId: 3, name: '监测预警信息',code:'2jA5V8Qh', iconSkin: 'icon-24' },
	  { id: 33, pId: 3, name: '智慧乡村信息',code:'SB7TABfi', iconSkin: 'icon-29' },
	  { id: 33, pId: 3, name: '农村改革信息',code:'hznuuul3', iconSkin: 'icon-26' },
	  { id: 31, pId: 3, name: '舆情资讯信息',code:'gtTEogrR', iconSkin: 'icon-27' },
	  { id: 33, pId: 3, name: '统计年鉴信息',code:'cL3i8PR4', iconSkin: 'icon-12' },
	]
      $(document).ready(function () {
        //点击事件
	$('.data-topic').bind('click',function(){
	  var text = $(this).text();
	  var parentNodes = zNodes.filter(function (ele) {
            return ele.name.indexOf(text)>=0
          })
	  window.location.href = "/${application}/portal/channel/sjzylb/41_1.htm?param="+parentNodes[0].code;
	})
	$('.source-nav li').bind('click',function(){
	  var text = $(this).text();
	  var parentNodes = zNodes.filter(function (ele) {
            return ele.name.indexOf(text)>=0
          })
	  window.location.href = "/${application}/portal/channel/sjzylb/41_1.htm?param="+parentNodes[0].code;
	})

        myChart = echarts.init(document.getElementById('bjMap'))
        $.get('/html/sn-static209/cdn/js/beijing.json', function (geoJson) {
          echarts.registerMap('beijing', geoJson, {})
          var geoCoordMap = {
            海淀区: [116.150316, 40.096074],
            朝阳区: [116.486409, 40.054489],
            东城区: [116.418757, 39.897544],
            西城区: [116.366794, 39.935309],
            房山区: [115.709157, 39.735535],
            大兴区: [116.338033, 39.568908],
            通州区: [116.758603, 39.702486],
            昌平区: [116.235906, 40.328085],
            顺义区: [116.823525, 40.208936],
            丰台区: [116.160968, 39.793642],
            石景山区: [116.139445, 39.954601],
            怀柔区: [116.637122, 40.724272],
            平谷区: [117.112335, 40.244783],
            延庆区: [115.985006, 40.465325],
            密云区: [116.943352, 40.577362],
            门头沟区: [115.605381, 39.967183],
          }
          //数据信息
          var data = [
            { name: '海淀区', value: 199 },
            { name: '朝阳区', value: 42 },
            { name: '东城区', value: 102 },
            { name: '西城区', value: 81 },
            { name: '房山区', value: 47 },
            { name: '大兴区', value: 67 },
            { name: '通州区', value: 82 },
            { name: '昌平区', value: 123 },
            { name: '顺义区', value: 24 },
            { name: '丰台区', value: 92 },
            { name: '石景山区', value: 67 },
            { name: '怀柔区', value: 82 },
            { name: '平谷区', value: 123 },
            { name: '延庆区', value: 24 },
            { name: '密云区', value: 92 },
            { name: '门头沟区', value: 24 },
          ]
          var convertData = function (data) {
            var res = []
            for (var i = 0; i < data.length; i++) {
              var geoCoord = geoCoordMap[data[i].name]
              if (geoCoord) {
                res.push({
                  name: data[i].name,
                  value: geoCoord.concat(data[i].value),
                })
              }
            }
            return res
          }
          var option = {
            // visualMap: {
            //   show: false,
            //   min: 0,
            //   max: 500,
            //   left: 'left',
            //   top: 'bottom',
            //   text: ['高', '低'], // 文本，默认为数值文本
            //   calculable: true,
            //   seriesIndex: [1],
            //   inRange: {},
            // },
            geo: {
              map: 'beijing',
              show: true,
              roam: false,
              // center: [115.985006, 40.465325],
              zoom: 1.2, //当前视角缩放比例
              label: {
                normal: {
                  show: false,
                },
                emphasis: {
                  show: false,
                },
              },
              itemStyle: {
                normal: {
                  areaColor: '#fff',
                  borderColor: '#0c2d7a', //线
                  shadowColor: '#092f8f', //外发光
                  // shadowBlur: 10,
                },
                emphasis: {
                  areaColor: '#0a2dae', //悬浮区背景
                },
              },
              regions: [
                //对不同的区块进行着色
                {
                  name: '东城区', //区块名称
                  itemStyle: {
                    normal: {
                      areaColor: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0,
                            color: '#e94d45', // 0% 处的颜色
                          },
                          {
                            offset: 1,
                            color: '#fd8506', // 100% 处的颜色
                          },
                        ],
                        global: false, // 缺省为 false
                      },
                      borderWidth: 0,
                    },
                    borderColor: '#fc810a',
                  },
                },
                {
                  name: '西城区',
                  itemStyle: {
                    normal: {
                      areaColor: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0,
                            color: '#e94d45', // 0% 处的颜色
                          },
                          {
                            offset: 1,
                            color: '#fd8506', // 100% 处的颜色
                          },
                        ],
                        global: false, // 缺省为 false
                      },
                      borderColor: '#fc810a',
                    },
                  },
                  borderWidth: 0,
                },
                {
                  name: '朝阳区', //区块名称
                  itemStyle: {
                    normal: {
                      areaColor: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0,
                            color: '#f0b779', // 0% 处的颜色
                          },
                          {
                            offset: 1,
                            color: '#e79d95', // 100% 处的颜色
                          },
                        ],
                        global: false, // 缺省为 false
                      },
                    },
                  },
                },
                {
                  name: '海淀区', //区块名称
                  itemStyle: {
                    normal: {
                      areaColor: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0,
                            color: '#f0b779', // 0% 处的颜色
                          },
                          {
                            offset: 1,
                            color: '#e79d95', // 100% 处的颜色
                          },
                        ],
                        global: false, // 缺省为 false
                      },
                    },
                  },
                },
                {
                  name: '石景山区', //区块名称
                  itemStyle: {
                    normal: {
                      areaColor: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0,
                            color: '#f0b779', // 0% 处的颜色
                          },
                          {
                            offset: 1,
                            color: '#e79d95', // 100% 处的颜色
                          },
                        ],
                        global: false, // 缺省为 false
                      },
                    },
                  },
                },
                {
                  name: '丰台区', //区块名称
                  itemStyle: {
                    normal: {
                      areaColor: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0,
                            color: '#f0b779', // 0% 处的颜色
                          },
                          {
                            offset: 1,
                            color: '#e79d95', // 100% 处的颜色
                          },
                        ],
                        global: false, // 缺省为 false
                      },
                    },
                  },
                },
              ],
            },
            series: [
              {
                symbolSize: 5,
                label: {
                  normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: true,
                  },
                  emphasis: {
                    show: true,
                  },
                },
                itemStyle: {
                  normal: {
                    color: '#0c2d7a',
                  },
                },
                name: 'light',
                type: 'scatter',
                coordinateSystem: 'geo',
                data: convertData(data),
              },
              {
                type: 'map',
                map: 'beijing',
                geoIndex: 0,
                aspectScale: 0.75, //长宽比
                showLegendSymbol: false, // 存在legend时显示
                label: {
                  normal: {
                    show: false,
                  },
                  emphasis: {
                    show: false,
                    textStyle: {
                      color: '#0c2d7a',
                    },
                  },
                },
                roam: false,
                itemStyle: {
                  normal: {
                    areaColor: '#031525',
                    borderColor: '#FFFFFF',
                  },
                  emphasis: {
                    areaColor: '#2B91B7',
                  },
                },
                animation: false,
                data: data,
              },
              {
                name: 'Top 5',
                type: 'scatter',
                coordinateSystem: 'geo',
                symbol: 'pin',
                symbolSize: [50, 50],
                label: {
                  normal: {
                    show: true,
                    textStyle: {
                      color: '#D8BC37',
                      fontSize: 9,
                    },
                    formatter(value) {
                      // return value.data.value[2]
                      return ""
                    },
                  },
                },
                itemStyle: {
                  normal: {
                    color: '#D8BC37', //标志颜色
                  },
                },
                data: convertData(data),
                showEffectOn: 'render',
                rippleEffect: {
                  brushType: 'stroke',
                },
                hoverAnimation: true,
                zlevel: 1,
              },
            ],
          }
          myChart.setOption(option)
        })
      })
    </script>
  </body>
</html>
