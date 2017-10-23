      <div class="bd">
                                        <ul>
                                   <#list page.list as cmsVideo>
                                     <li>
                                         <div class="videoitem">
                                                 <div class="vidoeitem-img"> 
                                                 <div class="view third-effect">
                                                 <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                                 </div>
                                                <h4>${cmsVideo.name}</h4> 
                                                <#if cmsVideo.status==0>
                                                <p><span><button style="background: #016bc1 none repeat scroll 0 0;border: 0 none;
    color: #ffffff;"  ype="button" onclick="check('${cmsVideo.id}','${page.pageNum}','check');">提交</button></span> <span><button type="button" style="background: #016bc1 none repeat scroll 0 0;border: 0 none;
    color: #ffffff;" onclick="check('${cmsVideo.id}','${page.pageNum}','delete');">删除</button></span></p>
                                                </#if>
                                                  <#if cmsVideo.status!=0>
                                                <p><span><button  type="button" disabled="disabled" onclick="check('${cmsVideo.id}','${page.pageNum}','check');">提交</button></span> <span><button type="button" style="background: #016bc1 none repeat scroll 0 0;border: 0 none;
    color: #ffffff;" onclick="check('${cmsVideo.id}','${page.pageNum}','delete');">删除</button></span></p>
                                                </#if>
                                               <div class="videoitem-user">
                                                <#if cmsVideo.status==0>
                                                  <span>待提交</span>
                                               </#if>
                                               <#if cmsVideo.status==1>
                                                  <span>待审核</span>
                                               </#if>
                                               <#if cmsVideo.status==2>
                                                  <span>通过</span>
                                               </#if>
                                               <#if cmsVideo.status==3>
                                                  <span>驳回</span>
                                               </#if>
                                                </div>
                                         </div>
                                     </li>  
                                     </#list>
                                 </ul>
                                </div>
                              <div class="blank_20"></div>
                                <div style="text-align:center">
                                       
                                      第${page.pageNum}/${page.pages}页,共${page.total}条记录。
                                      <a class="page_disable" href="javascript:goTo(${page.firstPage})">首页</a>
                                      <a class="page_disable" href="javascript:goTo(${page.prePage})">上一页</a>
                                      <a href="javascript:goTo(${page.nextPage})">下一页</a>
                                      <a href="javascript:goTo(${page.lastPage})">尾页</a>
                                      
                                </div>
                                        