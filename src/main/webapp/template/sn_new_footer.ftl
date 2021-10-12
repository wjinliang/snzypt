
      <div class="common-footer">
        <p>北京市农业农村局主办</p>
        <p>北京市城乡经济信息中心承办</p>
        <p>太极计算机股份有限公司/北京超图软件股份有限公司技术支持</p>
      </div>
    <script src="/html/sn-static209/cdn/js/jquery-3.4.1.min.js"></script>
    <script src="/html/sn-static209/cdn/layer/layer.js"></script>
    <script src="/html/sn-static209/jl/login.js"></script>
      <script src="/html/sn-static209/cdn/js/coco-modal.min.js"></script>
      <script>
          // 给全局搜索绑定事件。
          window.onload = function (ev) {
              var input = document.querySelector("body > div.index-wrap > div.common-header > div.header-top > div > div.search-box > input");
              var button = document.querySelector("body > div.index-wrap > div.common-header > div.header-top > div > div.search-box > button");
              button.addEventListener("click", function (e) {
                  $.get("/topiecms/portal/search/globalSearch?param=" + input.value, function (data) {
                      console.log(data);
                      if (data.status === 0) {
                          coco.alert("没有找到结果。");
                      } else if (data.status === 1) {
                          var div = document.createElement("div");
                          div.style.height = "1280px";
                          var h2 = document.createElement("h3");
                          h2.style.textAlign = 'center';
                          h2.style.color = '#3e8ee5';
                          h2.innerText = "总共找到 " + data.data.length + " 条数据";
                          div.append(h2);

                          var heard = document.createElement("div");
                          heard.style.cssText = "font-family: 'Microsoft YaHei', SimSun, '\\5b8b\\4f53', sans-serif;margin: 0;background: #e9f2f8;padding: 12px 0;color: #333;font-size: 0;margin-top: 15px;";
                          heard.innerHTML =
                              "<span style='\
                          color: #333;\
                          padding: 0;\
                          margin: 0;\
                          display: inline-block;\
                          font-size: 18px;\
                          text-align: left;\
                          margin-left: 30px;\
                          width: 45%;'>资源名称</span>\"<span style='\
                          color: #333;\
                          padding: 0;\
                          margin: 0;\
                          display: inline-block;\
                          font-size: 18px;\
                          text-align: left;\
                          margin-left: 30px;\
                          width: 45%;'>系统名称</span>";
                          div.append(heard);
                          var res = data.data;

                          // 列表ul
                          var ul = document.createElement("ul");
                          ul.style.cssText = "height: 320px; font-family: 'Microsoft YaHei', SimSun, '\\5b8b\\4f53', sans-serif; padding: 0; margin: 0;";

                          for (var key in res) {
                              var pId = res[key].pId;
                              var id = res[key].id;
                              var origin = res[key].origin;
                              var gridName = res[key].gridName;
                              var param = pId + "_" + id;
                              var li = document.createElement("li");
                              li.style.cssText = "font-family: 'Microsoft YaHei', SimSun, '\\5b8b\\4f53', sans-serif;\
                              list-style: none;\
                              margin: 0;\
                              font-size: 0;\
                              color: " + (parseInt(key) % 2 === 0 ? "#ffffff" : "#dedede") + "\
                              padding: 12px 0;";
                              li.innerHTML =
                                  '<span style="list-style: none;\
                              color: #666666;\
                              padding: 0;\
                              margin: 0;\
                              display: inline-block;\
                              font-size: 18px;\
                              overflow: hidden;\
                              text-overflow:ellipsis;\
                              white-space: nowrap;\
                              text-align: left;\
                              margin-left: 30px;\
                              width: 45%;"><a href="/topiecms/portal/channel/sjzyxq/42_1.htm?param='+ param +'" class="fontSize16 pText1">' + gridName + '</a></span>\
                                  <span style="list-style: none;\
                              color: #666666;\
                              padding: 0;\
                              margin: 0;\
                              display: inline-block;\
                              font-size: 18px;\
                              text-align: left;\
                              margin-left: 30px;\
                              width: 45%;">'+ ((origin == null) ? '无' : origin) +'</span>';
                              ul.append(li);
                          }

                          div.append(ul);
                          coco({
                              header: false,
                              fullScreen: false,
                              cancelButton: false,
                              okText: '关闭',
                              buttonColor: '#e7a71e',
                              html: div.innerHTML,
                              width: '1280px',
                              hooks: {
                                  open(cc) {},
                              },
                          }).onClose((ok, cc, done) => {
                              done();
                          });
                      } else {
                          coco.alert("没有找到结果。");
                      }
                  });
              })
          }
      </script>