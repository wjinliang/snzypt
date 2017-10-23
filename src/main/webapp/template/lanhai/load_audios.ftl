                       <style>
                                     .comBtn {
                                      border: 0 none;
                                      margin-right:10px;
                                      padding: 5px;
                                    }
                                    .blue{
                                    background: #016bc1 none repeat scroll 0 0;
                                     color: #ffffff;
                                    }
                      </style>
                       <div class="musicoriginal-pannel">
                             <div class="musicoriginal-title"><h2></h2></div>
                                   <div class="musicoriginal-list">
                                     <ul>
                                    
                                     <#list page.list as cmsAudio>
                                     <li>${cmsAudio.singer}<h4><a href="${cmsAudio.url}" class="name">${cmsAudio.name}</a></h4><font style="left:500px;" >${cmsAudio.count}次播放</font><span style="left:600px;"><em>${cmsAudio.commentCount}次评论</em></span>
                                     <#if cmsAudio.status!=0>
                                        <span style="left:750px;"><button  class="comBtn" type="button" disabled="disabled" onclick="check('${cmsAudio.id}','${page.pageNum}','check');">提交</button><button type="button" class="comBtn blue"  onclick="check('${cmsAudio.id}','${page.pageNum}','delete');">删除</button></span>
                                        <#else>
                                         <span style="left:750px;"><button  type="button" class="comBtn blue"  onclick="check('${cmsAudio.id}','${page.pageNum}','check');">提交</button><button type="button" class="comBtn blue" onclick="check('${cmsAudio.id}','${page.pageNum}','delete');">删除</button></span>
                                     </#if>
                                     </li>
                                      </#list>
                                     
                                     </ul>
                                  </div>
                               </div>                                 
                             </div>
                             <div class="blank_20"></div>
                                <div style="text-align:center">
                                       
                                      第${page.pageNum}/${page.pages}页,共${page.total}条记录。
                                      <a class="page_disable" href="javascript:goTo(${page.firstPage})">首页</a>
                                      <a class="page_disable" href="javascript:goTo(${page.prePage})">上一页</a>
                                      <a href="javascript:goTo(${page.nextPage})">下一页</a>
                                      <a href="javascript:goTo(${page.lastPage})">尾页</a>
                                      
                                </div>
                             