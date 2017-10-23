
                                  <html>
                                  <head>
                                  <meta charset="utf-8" />
                                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0,minimum-scale=1.0, user-scalabele=no"/>
                                  <title>【蓝海】信息网</title>
                                                                 
                                     <!--ckplayer-->
                                  <link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/global.css" /><!--全局样式-->
                                  <link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/main.css" />
                                  <link href="${htmlFolder}/plugins/jkplayer/skin/pink.flag/css/jplayer.pink.flag.min.css" rel="stylesheet" type="text/css" />
                                  <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                                  <script type="text/javascript" src="${htmlFolder}/plugins/jkplayer/jplayer/jquery.jplayer.min.js"></script>
                                  <script src="${htmlFolder}${htmlMobileFolder}/js/retina.js"></script><!--适应2倍屏-->  
                                  <style>
                                  img{
                                    height: auto!important;
                                    max-width: 100%;
                                  }
                                  .marginDiv{
                                    margin:10px 10px;
                                    font-size: 1.5rem;
                                  }
                                  </style>
                                 </head>
                                  <body>
                                   <div class="bookrightwrap">
                                         <div class="bookrecom">
                                            <div class="book-main marginDiv">
                                              <img src="${cmsNovel.imageUrl}" />
                                             <@novelDirective novelId=own>             
                                        		  <h4>分类：${cmsNovel.type?default('')}</h4>
                                              <h3>书名：${cmsNovel.name}</h3>
                                              <span>作者：${cmsNovel.author}</span>
                                         		  <p>更新时间：${cmsNovel.updateTime?string("yyyy-MM-dd HH:mm:ss")}</p>
                                          		<h5>简介</h5>
                                          		<span>${cmsNovel.introduce?default('')}</span>
                                              <div class="marginDiv">
                                              <#list files as file>
                                         		      <a href="${file.attachmentUrl}" >${file.attachmentName}-下载</a>
                                              </#list>  
                                              </div>  
                                              </@novelDirective>  
                                         </div> 
                                      </div>
                                   </div>
                               </body>
                           </html>