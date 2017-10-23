<!DOCTYPE html>
                                   <html>
                                   <head>
                                   <meta charset="utf-8" />
                                  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
                                   <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                   <title>【蓝海】信息网</title>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                                 
                                 <link href="${htmlFolder}/css/demo.css" rel="stylesheet" type="text/css">
                                 <link href="${htmlFolder}/css/homepage.css" rel="stylesheet" type="text/css">
                                 <link href="${htmlFolder}/css/sys_menu.css" rel="stylesheet" type="text/css" />
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/usercenter_style.css" />
                                  <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                                      <!--ckplayer-->
                                  
                                    <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                                   
                                   <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                                   
                                   <script>
                                        $(document).ready(function(){
                                              $("#content").load("./novelContent");   
                                        });
                                        function goTo(num)
                                        {
                                           $("#content").load("./novelContent",{pageNum:num});   
                                        }
                                        function check(id,pageNum,type)
                                        {
                                                $.ajax({
                                                  url:"./checkOrDelete",
                                                  data:{id:id,type:type,channelType:"7"},
                                                  type:"post",
                                                  success:function(data)
                                                  {
                                                    alert(data.msg);
                                                     goTo(pageNum);   
                                                  }
                                                })
                                        }

                                   </script>
                                   </head>
                                   
                                   <body>
                            <#include "/template/head.ftl"/>       
                         <!--nav end-->
                       <div class="videochannel-floor fn-clear">
                          <div class="videosortpannel" style="height:660px;padding-top:5px;">
                            <div style="text-align:center"><a href="./uploadPage?channelType=7" style="width:200px;height:80px;line-height: 50px;padding: 4px 20px;background: #016bc1 none repeat scroll 0 0;color: #ffffff;">我要上传</a></div>
                                     <div class="slidevideo" id="content">
                                    
                                      </div>  
                                   </div>
                              </div>
                           </body>
                                   
                                   <!-- Main end-->
                                   <div class="blank_20"></div>
                                   <!--!footer-->
                                   <#include "/template/foot.ftl" />
                                   <!--!footer end-->
        
                                   
                                   
                                   
                                   
                                   <!--[if lte IE 8]>
                                   <script src="/js/ieBetter.js"></script>
                                   <![endif]-->
                                   
                                   
                                   <!--                       Javascripts 注意不要改变顺序                      -->
                                   
           
                                 
                                
                                  
                                   
                                   </html>
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 