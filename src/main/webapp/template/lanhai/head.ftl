<!--topnav-->
                                                  <div class="topnav fn-clear">
                                                       <div class="topnavwrap">
                                                            <div class="topnav-user fn-right">
                                                                 <div id="loginOut" style="display:none" class="log">
                                                                      <a href="${htmlFolder}/login.html">登录</a>&nbsp;&nbsp;&nbsp;<a href="${htmlFolder}/register.html">注册</a>
                                                                </div>
                                                                <div id="loginIn">
                                                                      
                                                                </div>
                                                         </div >
                                                             <div class=" favoriter fn-left">
                                                                 <div><a href="#">收藏我们</a></div>
                                                             </div> 
                                                       </div>
                                                  </div>
                                                  <!--header-->
                                                  <div class="header fn-clear">
                                                     <div class="headerwrap">
                                                         <div class="logo"><img src="${htmlFolder}/images/pic_logo.png"/></div>
                                                        <div class="searchbox">
                           <div class="searchform">
                           <input type="text" id="searchText" placeholder ='请输入搜索关键名' />
                           </div> 
                            <a href="javascript:void(0)" id="searchBtn" onclick="searchText(this);" class="searchbutton ">搜索</a> </div> 
                            <div class="searchhot">
                                
                            </div>
                    
                                                        
                                                            
                                                           
                                                          
                                                     </div>
                                                  </div>
        <script>
          function searchText(btn)
          {
             window.location.href=basePath+"/portal/search.htm?text="+document.getElementById("searchText").value;
          }
        </script>  
                                                  <!--header end-->
                                       
                                      
                                     
                                    
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 