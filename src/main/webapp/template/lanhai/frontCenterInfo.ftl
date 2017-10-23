<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>主页-个人信息</title>
<link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
<link href="${htmlFolder}/css/global.css" rel="stylesheet" type="text/css">
<link href="${htmlFolder}/css/demo.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
<link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
<link href="${htmlFolder}/css/homepage.css" rel="stylesheet" type="text/css">
<link href="${htmlFolder}/css/sys_menu.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="${htmlFolder}/css/usercenter_style.css" />
<style type="text/css">
  .tab_panel{
    display: none;
    visibility: hidden;
  }
  .active{
    display: block;
    visibility: visible;
  }
</style>
</head>

<body>

<!--topnav-->
<div class="topnav fn-clear">
     <div class="topnavwrap">
           <div class=" favoriter fn-left">
               <div><a href="#">收藏我们</a></div>
           </div> 
     </div>
</div>
<!--header-->
<div class="header fn-clear">
   <div class="headerwrap">
       <div class="logo"><img src="${htmlFolder}/images/pic_logo.png"/></div>
      
           <!--  <div class="searchbox">
                <div class="searchform">
                <input type="text" value="请输入搜索关键词" onfocus="if (value =='请输入搜索关键'){value =''}" onblur="if (value ==''){value='请输入搜索关键名'}">
                </div> 
                 <a href="#" class="searchbutton ">搜索</a> 

               </div> 
                 <div class="searchhot">
                     <p><span><a href="#">金银岛</a></span><span><a href="#">海洋气候</a></span><span><a href="#">三亚</a></span><span><a href="#">海洋地图</a></span><span><a href="#">三亚</a></span></p>
                 </div> -->
        
   </div>
</div>
<!--header end-->


<div class="homepage_topWrap fn-clear">
  <div class="homepage_topMain">
      <div class="wrapW3 fn-clear">
          <h1 class="fn-left homepage_name">${currentUser.name}<img src="${htmlFolder}/images/page_name.png"></h1>
           <div class="btn_box fn-right">
               <button class="btn_xuansh fn-right">返回首页</button>
           </div>
       </div>
       <div class="blank_30"></div>
       <div class="wrapW3 white-bg fn-clear">
          <!--Left-->
           <div class="leftWrap fn-left">
            <div class="userInfo">
                <div class="userPic pd-t4"><img src="${currentUser.headpic?default('')}"></div>
                    <h4>${currentUser.name}，您好！</h4>
              </div>
               <div class="navwrapper">

                  <div id="sidebar"><!--注意使用了id-->
                    <div id="sidebar-wrapper">
                        <ul id="main-nav">
                            <li>
                                <a href="#tab_Info" class="nav-top-item"><img src="${htmlFolder}/images/house_3.png"><span>我的主页</span></a>
                                 
                            </li>
                            <li>
                                <a href="#tab_Img"  class="nav-top-item"><img src="${htmlFolder}/images/file_4.png"><span>更改头像</span></a>
                            </li>
                            <li>
                                <a href="#tab_pw"  class="nav-top-item"><img src="${htmlFolder}/images/file_5.png"><span>更改密码</span></a>
                            </li>
                             <li>
                                <a href="./videoPage"  class="nav-top-item"><img src="${htmlFolder}/images/file_5.png"><span>上传视频</span></a>
                            </li>
                             <li>
                                <a href="./audioPage"  class="nav-top-item"><img src="${htmlFolder}/images/file_5.png"><span>上传音乐</span></a>
                            </li>
                             <li>
                                <a href="./novelPage"  class="nav-top-item"><img src="${htmlFolder}/images/file_5.png"><span>上传小说</span></a>
                            </li>
                         </ul>
                    </div>
                </div>
                
                </div>
           </div>
           <!--End-->
           
           <!--Right-->
           <div class="ritWrap fn-left">
              <div class="my_zyCard fn-clear">
                  <span class="ritTit_normal f24 fn-left mg-t3 mg-l4 cRed1">&Xi;&nbsp;个人管理</span>
              </div>
              
              <div id="my_zyCont0" style="display:block;">
              <div class="mg-a4 tab_panel active" id="tab_Info">
                <div class="lineB pd-a3 fn-clear">
                    <h2 class="f22 fn-left">账号基本信息</h2>
                </div>
                <div class="mg-t4">
                    <p class="bgGra2 pd-a3"><img class="black_people" src="${htmlFolder}/images/black-people.png" width="12" height="12" alt=" " />${currentUser.name}，您好！以下是您的账户资料。</p>
                    <div class="blank_20"></div>
                    <div class="changepsd">
                      <form id="basicInfo">
                      <ul>
                        <li>
                          <input type="hidden" name="code" id="userCode" value="${currentUser.code}" />
                          <label for="zhname">账户名称</label>
                          <input type="text" id="zhname" value="${currentUser.loginname}" name="loginname" readonly="readonly" class="input_sign input_width_3 fn-left" />
                        </li>
                        <li>
                          <label for="name">真实姓名</label>
                          <input type="text" id="name" value="${currentUser.name}" name="name" class="input_sign input_width_3 fn-left" />
                        </li>
                        <li>
                          <label for="state">性别</label>
                          <span>
                           <#if userAttr.gender=='1' >
                          <input name="sex" type="radio" value="1" checked="checked" />
                           男
                          <input name="sex" type="radio" value="0" />
                          女
                          </#if>
                         <#if userAttr.gender=='0' >
                          <input name="sex" type="radio" value="1" />
                           男
                          <input name="sex" type="radio" value="0" checked="checked" />
                          女
                         </#if>
                        </span>
                        </li>
                       <li>
                          <label for="tel">手机号码 </label>
                          <input type="text" id="tel" value="${currentUser.mobile!}" name="mobile" class="input_sign input_width_3 fn-left" />
                          
                        </li>
                        <li>
                          <label for="email">Email</label>
                          <input type="text" id="email" value="${currentUser.email!}" name="email" class="input_sign input_width_3 fn-left" />
                          
                        </li>
                      </ul>
                    </form>
                      <button class="btn_submit fn-left" title="保存修改" onclick="updateUserAttr();">保存修改</button>
                    </div>
                  <div class="blank_40"></div>
                </div>
            </div>

      <div class="mg-a4 tab_panel " id="tab_Img">
                <div class="lineB pd-a3 fn-clear">
                    <h2 class="f22 fn-left">更改头像</h2>
                </div>
                <div class="mg-t4">
                    <p class="bgGra2 pd-a3"><img class="black_people" src="images/black-people.png" width="12" height="12" alt=" " />王东东，您好！以下是您的账户资料，如需变更，请及时进行手机验证，以免信息遗漏。</p>
                    <div class="blank_20"></div>
                    <div class="changepsd">
                      <ul>
                        <li>
                          <label for="touxiang">头像</label>
                         <div class="myInfo_tx fn-left">
                         <img src="images/ico_tx.png">
                         <input type="file" id="touxiang" value="rt_hainan" class="input_sign" />
                         </div>
                        </li>
                      
                      </ul>
                      <button class="btn_submit fn-left" title="保存修改">保存修改</button>
                      <button class="btn_cancel fn-left" title="取消">取消</button>
                    </div>
                  <div class="blank_40"></div>
                </div>
            </div>

      <div class="mg-a4 tab_panel" id="tab_pw">
                <div class="lineB pd-a3 fn-clear">
                    <h2 class="f22 fn-left">更改密码</h2>
                </div>
                <div class="mg-t4">
                    <p class="bgGra2 pd-a3"><img class="black_people" src="images/black-people.png" width="12" height="12" alt=" " />王东东，您好！以下是您的账户资料，如需变更，请及时进行手机验证，以免信息遗漏。</p>
                    <div class="blank_20"></div>
                    <div class="changepsd">
                      <ul>
                       <li>
                          <label for="zhname">当前密码</label>
                          <input type="password" id="zhname" value="3333333" class="input_sign input_width_3 fn-left" />
                        </li>
                        <li>
                          <label for="name">新密码</label>
                          <input  type="password" id="password" value="rt_hainan" class="input_sign input_width_3 fn-left" />
                        </li>
                      <li>
                          <label for="name">重复新密码</label>
                          <input  type="password" id="passwordCon" value="rt_hainan" class="input_sign input_width_3 fn-left" />
                        </li>
                      </ul>
                      <button class="btn_submit fn-left" title="保存修改" onclick="changePass();">保存修改</button>
                      <button class="btn_cancel fn-left" title="取消">取消</button>
                    </div>
                  <div class="blank_40"></div>
                </div>
            </div>
              </div>
              </div>
           <!--End-->
       </div>
    </div>
</div>

<div class="blank_30"></div>

<!--页脚-->
<!--!footer-->
<div class="footer">
  <div class="footerwrap">
    <div class="linklist">
        <a href="###">关于我们</a>  |  <a href="###">联系我们</a>   |<a href="###">  友情链接 </a> |<a href="###">  客服热线：400-898-9898</a> </div>
        <div class="copyright">
    <p><span>海洋信息网  版权声明 </span>  <span>京ICP备093817344号</span>  <span>京ICP证B2-21366号</span>   <span>  北京市公安局海淀分局备案编号：21341345699 </span>       </p>
</div>
  </div>
</div>
<!--!footer end-->
</body>
<!--    Javascripts请不要改变调用顺序       -->
<script type="text/javascript" src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${htmlFolder}/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="${htmlFolder}/js/base.menu.js"></script>
<script type="text/javascript" src="${htmlFolder}/js/public.js"></script>
<script type="text/javascript" src="${htmlFolder}/js/login.js"></script>
<script type="text/javascript">
  jQuery(document).ready(function(){
    $("a.nav-top-item").click(function(){
      $("#my_zyCont0 .tab_panel").removeClass("active"); //Remove any "active" class
      var activeTab = $(this).attr("href"); //Find the rel attribute value to identify the active tab + content  
      $(activeTab).addClass("active");
      return false;  
    });
  });
  function updateUserAttr()
  {
     $.ajax({
      url:basePath+"/api/front/updateUser",
      type:"post",
      data:$("#basicInfo").serialize(),
      success:function(data)
      {
        alert(data.msg);
      }
     })
  }
  
  function changePass()
  {
     $.ajax({
      url:basePath+"/api/front/changePassword",
      type:"post",
      data:{password:$("#passwordCon").val(),code:$("#userCode").val()},
      success:function(data)
      {
        alert(data.msg);
      }
     })
  }
</script>
</html>
