<div class="fontSize18 new-list2-t">部门主要负责人</div>
                           <table class="table table1 text-center table-bordered-none">
                               <thead>
                               <tr>
                                   <th>部门</th>
                                   <th>职务</th>
                                   <th>姓名</th>
                               </tr>
                               </thead>
                               <tbody>
                                <#list orgs as org>
                               <tr>
                                   <td>${org.name!}</td>
                                   <td>${org.orgDuty!}</td>
                                   <td>${org.orgPerson!}</td>
                               </tr>
                               </#list>
                               </tbody>
                           </table>
                           <div class="text-right new-page">
                               <span class="new-page-pd"><span class="color-green">${pageNum}/${totalPage}</span>&nbsp;页</span>
                               <span class="new-page-pd">共&nbsp;<span class="color-green">${total}</span>&nbsp;条记录</span>
                               <button class="btn btn-link" onclick="turnPage('1')">首页</button>
                               <button class="btn btn-link" onclick="turnPage('${prePage}')">上一页</button>
                               <button class="btn btn-link" onclick="turnPage('${nextPage}')">下一页</button>
                               <button class="btn btn-link" onclick="turnPage('${totalPage}')">尾页</button>
                           </div>
                           <script>
                           function turnPage(pageNum)
                           {
                            $("#orgContent").load("../../org/orgList?pageNum="+pageNum);
                           }

                           </script>