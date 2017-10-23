<div class="detailtag">
                 <h3>评论</h3>
                 <div  style="margin-left:40px;">
                      <div style="width:80%">
                        <textarea style="width:100%" id="commentText" name="commentText" rows="8"></textarea>  
                      </div>
                      <div style="text-align:right;width:80%;margin-top:10px;margin-bottom:10px;">
                      <button id="commentBtn" class="loginbtn" type="button">评论</button>
                      </div>
                  </div>
       <div id="commentContent">         
        <div class="comment">
        <ul>
     
        </ul>
      </div>
     <div id="commentPage" style="text-align:center"> </div>
     </div>
     </div>
              <script>
              var contentId = "${own}";
              
              function toDate(num)
              {
                 var now = new Date(num);
                 var   year=now.getFullYear();     
                  var   month=now.getMonth()+1;     
                  var   day=now.getDate();     
                  var   hour=now.getHours();     
                  var   minute=now.getMinutes();     
                  var   second=now.getSeconds();    
                  console.log(hour,minute,second); 
                  return   year+"-"+month+"-"+day+"   "+(hour>10?hour:'0'+hour)+":"+(minute>10?minute:'0'+minute)+":"+second;
              }
    
              function comment()
              {
              
                   $.ajax({
                        url:basePath+"/api/cms/postComment",
                        data:{commentText:$("#commentText").val(),contentId:contentId,channelType:'0'},
                        type:"post",
                        success:function(result)
                        {
                          alert(result.msg);
                          goToComment(1);
                        }
                   });
              }
              $("#commentBtn").click(function(){
                  comment();
              })
     
              function goToComment(pageNum)
              {
                  $.ajax({
                       url:basePath+"/api/cms/comment/list",
                       type:"post",
                       data:{channelType:"0",contentId:contentId,pageNum:pageNum},
                       success:function(data)
                       {
                           var html="";
                           var comment=data.list;
                           for(var i in comment)
                           {
                              html=html +'<li>'+
                                    '<span class="fn-right">'+toDate(comment[i].commentTime) +'</span>'+
                                    '<span>'+comment[i].commentUserName+'</span>'+
                                    '<p>'+comment[i].commentText+ '</p>'+
                                    '</li>';
                           }
     
                           $("#commentContent").find('ul').first().html(html); 
                           var pageHtml =  '共'+data.total+'条记录'+'&nbsp;&nbsp;'+data.pageNum+'/'+data.pages+'页&nbsp;&nbsp;'+ 
                                           '<a href="javascript:goToComment(1);" >首页</a>&nbsp;'+
                                           '<a href="javascript:goToComment('+data.prePage+');" >上一页</a>&nbsp;'+
                                           '<a href="javascript:goToComment('+data.nextPage+');" >下一页</a>&nbsp;'+
                                           '<a href="javascript:goToComment('+data.lastPage+');">尾页</a>';
                          $("#commentPage").html(pageHtml);
     
                       }
                  });             
              }
              goToComment(1);
              </script>
             
              
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 