<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>主页-个人信息</title>
<link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
<link href="${htmlFolder}/css/global.css" rel="stylesheet" type="text/css">
<link href="css/demo.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="css/indexstyle.css"/>
<link type="text/css" rel="stylesheet" href="css/publicstyle.css"/>
<link href="css/homepage.css" rel="stylesheet" type="text/css">
<link href="css/sys_menu.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/usercenter_style.css" />
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
       <div class="logo"><img src="images/pic_logo.png"/></div>
      
            <div class="searchbox">
                <div class="searchform">
                <input type="text" value="请输入搜索关键词" onfocus="if (value =='请输入搜索关键'){value =''}" onblur="if (value ==''){value='请输入搜索关键名'}">
                </div> 
                 <a href="#" class="searchbutton ">搜索</a> </div> 
                 <div class="searchhot">
                     <p><span><a href="#">金银岛</a></span><span><a href="#">海洋气候</a></span><span><a href="#">三亚</a></span><span><a href="#">海洋地图</a></span><span><a href="#">三亚</a></span></p>
                 </div>
         
        
   </div>
</div>
<!--header end-->


<div class="homepage_topWrap fn-clear">
	<div class="homepage_topMain">
    	<div class="wrapW3 fn-clear">
        	<h1 class="fn-left homepage_name">$<img src="images/page_name.png"></h1>
           <div class="btn_box fn-right">
               <button class="btn_xuansh fn-right">返回首页</button>
           </div>
       </div>
       <div class="blank_30"></div>
       <div class="wrapW3 white-bg fn-clear">
       		<!--Left-->
           <div class="leftWrap fn-left">
           	<div class="userInfo">
            		<div class="userPic pd-t4"><img src="images/ico_touxiang.png"></div>
                    <h4>王东东，您好！</h4>
            	</div>
               <div class="navwrapper">

                  <div id="sidebar"><!--注意使用了id-->
                    <div id="sidebar-wrapper">
                        <ul id="main-nav">
                            <li>
                                <a href="javascript:void(0)"  class="nav-top-item"><img src="images/house_3.png"><span>我的主页</span></a>
                                 
                            </li>
                            <li>
                                <a href="homepage_myInfo_img.html"   class="nav-top-item"><img src="images/file_4.png"><span>更改头像</span></a>
                            </li>
                            <li>
                                <a href="homepage_myInfo_pw.html"   class="nav-top-item"><img src="images/file_5.png"><span>更改密码</span></a>
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
              <div class="mg-a4">
                <div class="lineB pd-a3 fn-clear">
                    <h2 class="f22 fn-left">账号基本信息</h2>
                </div>
                <div class="mg-t4">
                    <p class="bgGra2 pd-a3"><img class="black_people" src="images/black-people.png" width="12" height="12" alt=" " />王东东，您好！以下是您的账户资料，如需变更，请及时进行手机验证，以免信息遗漏。</p>
                    <div class="blank_20"></div>
                    <div class="changepsd">
                      <ul>
                        
                        <li>
                          <label for="zhname">账户名称</label>
                          <input type="text" id="zhname" value="rt_hainan" class="input_sign input_width_3 fn-left" />
                        </li>
                        <li>
                          <label for="name">真实姓名</label>
                          <input type="text" id="name" value="rt_hainan" class="input_sign input_width_3 fn-left" />
                        </li>
                        <li>
                          <label for="state">性别</label>
                          <span>
                          <input name="" type="radio" value="" checked="checked" />
                        男
                        <input name="" type="radio" value="" />
                        女
                        </span>
                        </li>
                       <li>
                          <label for="tel">手机号码 </label>
                          <input type="text" id="tel" value="13141234567" class="input_sign input_width_3 fn-left" />
                          <a class="btn1 fn-left" href="###" title="验证手机">验证手机</a>
                        </li>
                        <li>
                          <label for="email">Email</label>
                          <input type="text" id="email" value="hainan@example.com" class="input_sign input_width_3 fn-left" />
                          <a class="btn1 fn-left" href="###" title="验证邮箱">验证邮箱</a>
                        </li>
                        
                      </ul>
                      <button class="btn_submit fn-left" title="保存修改">保存修改</button>
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
<script type="text/javascript" SRC="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" SRC="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/base.menu.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</html>
