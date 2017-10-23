<!--小说内容-->
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
                          <div class="musicradio-box fn-clear">
                           <div class="musicoriginal-pannel">
                             <div class="musicoriginal-title"><h2></h2></div>
                                   <div class="musicoriginal-list">
                                     <ul>
                                    
                                     <#list page.list as cmsNovel>
                                        <li style="width:1000px;background:url('${htmlFolder}/images/novel_icon.png') no-repeat scroll 2px 10px;"><a style="left:150px;" href="${cmsNovel.url}" class="name">${cmsNovel.name}</a><h4>${cmsNovel.author}</h4><font style="left:350px;">${cmsNovel.count}次播放</font><span style="left:460px"><em>${cmsNovel.commentCount}次评论</em></span><font style="left:540px;">${cmsNovel.createTime?string("yyyy-MM-dd")}</font>

                                          <#if cmsNovel.status!='0'>
                                        <span style="left:750px;"><button  class="comBtn" type="button" disabled="disabled" onclick="check('${cmsNovel.id}','${page.pageNum}','check');">提交</button><button type="button" class="comBtn blue"  onclick="check('${cmsNovel.id}','${page.pageNum}','delete');">删除</button></span>
                                        <#else>
                                         <span style="left:750px;"><button  type="button" class="comBtn blue"  onclick="check('${cmsNovel.id}','${page.pageNum}','check');">提交</button><button type="button" class="comBtn blue" onclick="check('${cmsNovel.id}','${page.pageNum}','delete');">删除</button></span>
                                     </#if>
                                        </li>
                                      </#list>
                                    
                                     </ul>
                                  </div>
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