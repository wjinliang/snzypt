<!DOCTYPE html>
  <html>
  <head lang="en">
       <#include "/template/jh-meta.ftl">
      <title>${site.displayName!}-投票结果</title>
      <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
      <script src="/html/jinhu-static/js/respond.min.js"></script>
      <![endif]-->
  </head>
  <body>
  <#include "/template/jh-head.ftl">
  <#include "/template/jh-daohang.ftl">
  <div class="container bg-white">
      <div class="jh-main">
          <div class="panel panel-default panel2">
              <div class="panel-heading panel2-t panel2-t1 fontSize18">网上调查</div>
              <div class="panel-body">
                  <div class="jh-article-title fontSize22 text-center color-green pdTop1em2"><span>${cmsVote.title!}${(cmsVote.checkType=="radio")?string('(单选)','(多选)')}</span></div>
                  <div class="jh-article-info text-center">
                      <span>共有&nbsp;&nbsp;&nbsp;&nbsp;${voteTimes!}&nbsp;&nbsp;&nbsp;&nbsp;人投票</span>
                  </div>
                  <div class="pd6 row">
                      <div class="col-lg-offset-2 col-lg-8 col-md-offset-1 col-md-10">
                          <table class="table table-bordered table-hover table1">
                              <thead>
                              <tr>
                                  <th class="color-green">选项</th>
                                  <th class="text-center color-green">百分百</th>
                                  <th class="text-center color-green">得票数</th>
                              </tr>
                              </thead>
                              <tbody>
  			    <#list options as option>
  			    <tr>
                                  <td>${option.option!}</td>
                                  <td class="text-center">${option.filed1!}</td>
                                  <td class="text-center">${option.clickTimes!}</td>
                              </tr>
  
  			    </#list>
                          
                              </tbody>
                          </table>
                          <div class="pdTop1em2 text-center">
                              
                              <a class="btn btn-default btn-download" href="javascript:closewin();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <#include "/template/jh-footer.ftl">
  <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
  <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
  <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
  <script type="text/javascript">
      $(function () {
          $('input, textarea').placeholder();
          $('#navTab1 a').click(function (e) {
              e.preventDefault();
              $(this).tab('show');
          });
          $('#navTab2 a').click(function (e) {
              e.preventDefault();
              $(this).tab('show');
          });
          $('#navTab3 a').click(function (e) {
              e.preventDefault();
              $(this).tab('show');
          });
      });
      function closewin(){   
            var browserName=navigator.appName;   
            if (browserName=="Netscape") {   
                var opened=window.open('about:blank','_self');  
                opened.opener=null;  
                opened.close();  
            } else if(browserName=="Microsoft Internet Explorer") {   
                window.opener=null;  
                window.open('','_self');   
                window.close();   
            }  
        }  
  </script>
  </body>
  </html>
  
 