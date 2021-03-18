<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="renderer" content=webkit>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
  <title>${site.displayName!}</title>
  <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css" />
  <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css" />
  <link rel="stylesheet" href="/html/sn-static209/cdn/css/font.css" />
  <link rel="stylesheet" href="/html/sn-static209/jl/style.css" />
  <link rel="stylesheet" href="/html/sn-static209/cdn/iconFonts/iconfont.css" />
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
            <input type="text" value="" class="serach-text" placeholder="请输入数据资源的名称关键词进行搜索" />
            <button class="arg-btn blue-btn">全站搜索</button>
            <!-- <button class="arg-btn blue-btn">高级筛选</button> -->
          </div>
        </div>
      </div>
      <div class="header-btm">
        <div class="set-nav">
          <div class="setWidth nav-position">
            <ul class="arg-nav clearfix">
              <li class=""><a href="${site.url}">首页</a></li>
              <@channelListDirective siteId=site.id>
                <#list channels as chan>
                  <li class="${(chan.id==own)?string('active','')}"><a href="${chan.url}">${chan.displayName}</a></li>
                </#list>
              </@channelListDirective>
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
    <div class="main-data-reasource">
      <div class="setWidth">
        <div class="setlocation">
          当前页面：特色专题/<span>农情专题</span>
        </div>
        <div class="common-valliage">
          <div class="valliage-info">
            <div id="bjMap1" class="map-wrap" style="height: 650px;"></div>
            <div class="map-filter clearfix">
              <div class="filter-l">
                <div class="filter-dropDown" id="dropdown1">
                  <span>名称模糊查询</span>
                  <ul class="dropdown">
                    <li>1111</li>
                    <li>1222</li>
                    <li>23332</li>
                  </ul>
                </div>
                <div class="filter-dropDown" id="dropdown2">
                  <span>按区查询</span>
                  <ul class="dropdown">
                    <li>反对法</li>
                    <li>十大科技</li>
                    <li>但是大多数</li>
                  </ul>
                </div>
                <div class="filter-dropDown" id="dropdown3">
                  <span>时间查询</span>
                  <ul class="dropdown">
                    <li>999</li>
                    <li>2222</li>
                    <li>大多数都是</li>
                  </ul>
                </div>
              </div>
              <div class="filter-r">
                <ul class="filter-btn" id="filterBtn">
                  <li>框选查询</li>
                  <li>典型案例查询</li>
                  <li>720全景查询</li>
                  <li>网站查询</li>
                  <li>公众号查询</li>
                  <li>网店查询</li>
                </ul>
              </div>
            </div>
            <div class="search-results">
              <h1>查询结果</h1>
              <ul class="search-list" id="searchList">
                <li>
                  <span class="res-nav active"><i class="iconfont icon-weibiaoti--" style="margin-right: 10px;"></i>XXXXXXXXKSJJ</span>
                  <div class="detail-cont">
                    <div class="item">
                      XSJJJDJSJJDKS<span class="year-styles">2020</span>
                      <p><span class="count-styles">203003</span>个</p>
                    </div>
                    <div class="item">
                      ldododosdsJSDSJHJSHD<span class="year-styles">2019</span>
                      <p><span class="count-styles">88393</span>个</p>
                    </div>
                    <div class="item">
                      XSJJJDJSJJDKS<span class="year-styles">2018</span>
                      <p><span class="count-styles">222</span>个</p>
                    </div>
                    <div class="item">
                      iidiisid<span class="year-styles">2017</span>
                      <p><span class="count-styles">222</span>个</p>
                    </div>
                  </div>
                </li>
                <li>
                  <span class="res-nav"><i class="iconfont icon-renyuanfenbu" style="margin-right: 10px;"></i>XXXXXXXXKSJJ</span>
                  <div class="detail-cont">
                    <div class="item">
                      XSJJJDJSJJDKS<span class="year-styles">2020</span>
                      <p><span class="count-styles">203003</span>个</p>
                    </div>
                    <div class="item">
                      ldododosdsJSDSJHJSHD<span class="year-styles">2019</span>
                      <p><span class="count-styles">88393</span>个</p>
                    </div>
                    <div class="item">
                      XSJJJDJSJJDKS<span class="year-styles">2018</span>
                      <p><span class="count-styles">222</span>个</p>
                    </div>
                    <div class="item">
                      iidiisid<span class="year-styles">2017</span>
                      <p><span class="count-styles">222</span>个</p>
                    </div>
                  </div>
                </li>
                <li>
                  <span class="res-nav"><i class="iconfont icon-baohunongyeyongdiguanli" style="margin-right: 10px;"></i>JDIIDIDSIDISDS</span>
                  <div class="detail-cont">
                    <div class="item">
                      XSJJJDJSJJDKS<span class="year-styles">2020</span>
                      <p><span class="count-styles">203003</span>个</p>
                    </div>
                    <div class="item">
                      ldododosdsJSDSJHJSHD<span class="year-styles">2019</span>
                      <p><span class="count-styles">88393</span>个</p>
                    </div>
                    <div class="item">
                      XSJJJDJSJJDKS<span class="year-styles">2018</span>
                      <p><span class="count-styles">222</span>个</p>
                    </div>
                    <div class="item">
                      iidiisid<span class="year-styles">2017</span>
                      <p><span class="count-styles">222</span>个</p>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <#include "/template/sn_new_footer.ftl">
 		<script type="text/javascript" src="/html/sn-static209/cdn/js/topicLayer.js"></script>
      	<script type="text/javascript" src="/html/sn-static209/jl/zhihuixiangcun.js"></script>
      	<script type="text/javascript" src="/html/sn-static209/cdn/js/echarts.min.js"></script>
  </div>
  <script>
    var myChart
    $(document).ready(function () {
      myChart = echarts.init(document.getElementById('bjMap1'))
      $.get('cdn/js/beijing.json', function (geoJson) {
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
          geo: {
            map: 'beijing',
            show: true,
            roam: false,
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
                areaColor: '#439cd2',
                borderColor: '#fff', //线
                shadowColor: '#092f8f', //外发光
              },
              // emphasis: {
              //   areaColor: '#0a2dae', //悬浮区背景
              // },
            },
            regions: [
              //对不同的区块进行着色
              {
                name: '东城区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor: '#5bad6d',
                    borderWidth: 0,
                    borderColor: '#fff',
                    borderWidth:1
                  },
                },
              },
              {
                name: '西城区',
                itemStyle: {
                  normal: {
                    areaColor: '#5bad6d',
                    borderWidth: 0,
                    borderColor: '#fff',
                    borderWidth:1
                  }
                },
                borderWidth: 0,
              },
              {
                name: '朝阳区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor: '#4faf87',
                    borderColor: '#fff',
                  },
                },
              },
              {
                name: '海淀区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor: '#4faf87'
                  },
                },
                borderColor: '#fff',
              },
              {
                name: '石景山区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#5bad6d'
                  },
                },
                borderColor: '#fff'
              },
              {
                name: '丰台区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#5bad6d'
                  },
                },
                borderColor: '#fff'
              },
              {
                name: '通州区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#4eafad'
                  },
                },
                borderColor: '#fff'
              },
              {
                name: '顺义区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#4eafad'
                  },
                },
                borderColor: '#fff'
              },
              {
                name: '平谷区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#4eafad'
                  },
                },
                borderColor: '#fff'
              },
              {
                name: '怀柔区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#2d74d0'
                  },
                },
                borderColor: '#fff'
              },
              {
                name: '密云区', //区块名称
                itemStyle: {
                  normal: {
                    areaColor:'#2d74d0'
                  },
                },
                borderColor: '#fff'
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
                  color: '#333',
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
                    color: '#fff',
                    fontSize: 9,
                  },
                  formatter(value) {
                    return value.data.value[2]
                  },
                },
              },
              itemStyle: {
                normal: {
                  color: '#cde599', //标志颜色
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
      // dropdown效果
      var dropdown1 = new DropDown($('#dropdown1'));
      var dropdown2 = new DropDown($('#dropdown2'));
      var dropdown3 = new DropDown($('#dropdown3'));
      dropdown1.initEvents();
      dropdown2.initEvents();
      dropdown3.initEvents();
      $('#filterBtn li').on('click',function(){
        $('.filter-dropDown').removeClass('active');
        $(this).addClass('hover').siblings().removeClass('hover')
      })
      $('#searchList li span').on('click',function(){
        $(this).addClass('active')
        $(this).siblings('').slideToggle()
        $(this).parent('li').siblings().find('.res-nav').removeClass('active')
        $(this).parent('li').siblings().find('.detail-cont').slideUp()
      })
    })
  </script>
</body>

</html>