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
  <script>
    var iserver = "http://localhsot:8090";
    //var iserver = "http://47.96.75.177:8090";
    iserver = "http://mxbt.pro:8090";
    var mapUrl = iserver + "/iserver/services/map-beijing/rest/maps/beijing10261";
    var mapDataUrl = iserver + '/iserver/services/data-beijing/rest/data';
  </script>
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
    <div id="_mapdiv"></div>
    <div class="main-data-reasource">
      <div class="setWidth">
        <div class="common-valliage">
          <div class="setlocation">
            <div id="pathText">当前页面：特色专题/<span>智慧乡村</span></div>
          </div>
          <div class="valliage-info">
            <div id="bjMap1" class="map-wrap" style="height: 650px;"></div>
            <div class="map-filter clearfix" style="width: 98%; margin: 0 15px;">
              <div class="filter-l" style="width: 40%;">
                <div class="filter-dropDown" id="dropdown2">
                  <span>按区查询</span>
                  <ul class="dropdown">
                    <li>大兴区</li>
                    <li>通州区</li>
                    <li>朝阳区</li>
                    <li>密云县</li>
                    <li>顺义区</li>
                    <li>平谷区</li>
                    <li>昌平区</li>
                    <li>怀柔区</li>
                    <li>房山区</li>
                    <li>丰台区</li>
                    <li>门头沟区</li>
                    <li>石景山区</li>
                    <li>海淀区</li>
                    <li>延庆县</li>
                  </ul>
                </div>
                <div class="filter-dropDown" id="dropdown3">
                  <span>选择乡镇</span>
                  <ul class="dropdown">

                  </ul>
                </div>
                <div class="filter-dropDown" id="dropdown4">
                  <span>选择村庄</span>
                  <ul class="dropdown">

                  </ul>
                </div>
                <div class="filter-dropDown" id="dropdown5">
                  <span>时间查询</span>
                  <ul class="dropdown">
                    <li>2017</li>
                    <li>2018</li>
                    <li>2019</li>
                    <li>2020</li>
                  </ul>
                </div>
              </div>
              <div class="filter-r" style="width: 58%;">
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
            <div class="search-results" style="margin-right: 20px;">
              <h1>查询结果</h1>
              <ul class="search-list" id="searchList">
                等待查询
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <#include "/template/sn_new_footer.ftl">
 		<script type="text/javascript" src="/html/sn-static209/cdn/js/topicLayer.js"></script>

        <script src="/html/sn-static209/cdn/js/coco-modal.min.js"></script>
      	<script type="text/javascript" src="/html/sn-static209/cdn/js/echarts.min.js"></script>
    <script type="text/javascript" include="widgets.alert" src="/html/sn-static209/cdn/js/include-web.js"></script>
    <script type="text/javascript" exclude="iclient-classic" include="nanoscroller,infoWindow,MapToImg"
            src="/html/sn-static209/cdn/classic/include-classic.js"></script>
  </div>
  <script>
    var myChart
    $(document).ready(function () {
      /*myChart = echarts.init(document.getElementById('bjMap1'))
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
      })*/
      // dropdown效果
      var dropdown5 = new DropDown($('#dropdown5'));
      // var dropdown2 = new DropDown($('#dropdown2'));
      // var dropdown3 = new DropDown($('#dropdown3'));
      dropdown5.initEvents();
      // dropdown2.initEvents();
      // dropdown3.initEvents();
      // 初始化map的大小 & 一些样式的微调。
      var mapDiv = document.getElementById("_mapdiv");
      var nongQingContentDiv = document.getElementsByClassName("main-data-reasource")[0];
      mapDiv.style.position = 'absolute';
      mapDiv.style.top = getComputedStyle(nongQingContentDiv, null).top;
      mapDiv.style.height = getComputedStyle(nongQingContentDiv, null).height;
      mapDiv.style.width = getComputedStyle(nongQingContentDiv, null).width;
      mapDiv.style.zIndex = 0;

      window.onresize = () => {
        mapDiv.style.top = getComputedStyle(nongQingContentDiv, null).top;
        mapDiv.style.height = getComputedStyle(nongQingContentDiv, null).height;
        mapDiv.style.width = getComputedStyle(nongQingContentDiv, null).width;
      };

      var commonValliage = document.querySelectorAll(".common-valliage");

      commonValliage.forEach(item => {
        item.style.background = "none";
      })

      var pathText = document.getElementById("pathText");
      pathText.style.width = "300px";
      pathText.style.padding = "10px 10px";
      pathText.style.borderRadius = "10px";
      pathText.style.background = 'rgba(255, 255, 255, 0.9)';

      var map;
      var initMap = function () {
        this.map = new SuperMap.Map("_mapdiv", {
          controls: [
            new SuperMap.Control.Navigation(),
            new SuperMap.Control.Zoom({div: $("#rightBottom")[0]}),
            new SuperMap.Control.MousePosition(),
            new SuperMap.Control.OverviewMap()
          ], allOverlays: true
        });

        map = this.map;
        //设置地图最小缩放级别为7级
        this.map.events.register("zoomend", this, function (e) {
          if (this.map.getZoom() < 7)
          {
            //map.zoomTo(17);
            this.map.setCenter(new SuperMap.LonLat(116.36503293755, 39.953585745484), 9);
          }
        });
        // $("#rightBottom").attr("style", "");

        layer = new SuperMap.Layer.TiledDynamicRESTLayer("World", mapUrl, null, {
          maxResolution: "auto",
          useCanvas: false
        });
        layer.events.on({
          "layerInitialized": () => {
            this.map.addLayers([layer]);
            this.map.setCenter(new SuperMap.LonLat(116.36503293755, 39.953585745484), 9);
            //区划矢量图层
            var qu_Layer = new SuperMap.Layer.Vector("qu_Layer");
            this.map.addLayers([qu_Layer]);


            var queryResult = new SuperMap.Layer.Vector("queryResult");
            this.map.addLayers([queryResult]);


            var featurePop;
            var callbacks = {
              click: (currentFeature) => {
                closeInfoWin();
                var x = (currentFeature.geometry.bounds.bottom + currentFeature.geometry.bounds.top) / 2
                var y = (currentFeature.geometry.bounds.left + currentFeature.geometry.bounds.right) / 2
                featurePop = new SuperMap.InfoWindow(
                        "feature",
                        "属性"
                );
                featurePop.hide();
                featurePop.titleBox = true;
                featurePop.contentSize = new SuperMap.Size(300, 200);
                featurePop.render();
                //featurePop.show(null, feature);
                featurePop.show(null, currentFeature);
                var lonLat = new SuperMap.LonLat(y, x);
                featurePop.setLonLat(lonLat, { x: 0, y: 0 });
                this.map.addPopup(featurePop)
              }
            };
            function closeInfoWin() {
              if (featurePop) {
                try {
                  featurePop.hide();
                  featurePop.destroy();
                }
                catch (e) {
                }
              }
            }
            this.selectFeature = new SuperMap.Control.SelectFeature([qu_Layer,queryResult],
                    {
                      callbacks: callbacks
                    });
            this.map.addControl(this.selectFeature);
            this.selectFeature.activate();

            //	this.shuxing();

          }
        });
        // 禁用拖拽
        for (var i = 0; i< this.map.controls.length; i++) {
          this.map.controls[i].deactivate();
        }
      }
      initMap();
    })
  </script>
  <script type="text/javascript" src="/html/sn-static209/jl/zhihuixiangcun.js"></script>
</body>

</html>