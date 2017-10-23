<!--footer开始-->
    <div class="footer" id="footer">
        <div class="container">
            <div class="row">
            	<div class="footer-top">
                	<div class="bg-gray clearfix">
                    	<span>友情链接&nbsp;LINKS</span>	
                    	<ul class="footer-list">
                        	<li>
                            	<select name="country" id="country"   onchange="onchangeop(this);">
                                	<option value ="#" disabled="disabled" selected="selected">国家部委网站</option>
				<@friendlinkDirective siteId=1 type="C0301" >
					<#list friendlinks as link>
						<option value ="${ link.link}" >${ link.name}</option>
					</#list>
				</@friendlinkDirective >
                                </select>
                            </li>
                            <li>
                            	<select name="capital" id="capital"  onchange="onchangeop(this);">
                                	<option value ="#" disabled="disabled" selected="selected">全国省会城市网站</option>
                                  	<@friendlinkDirective siteId=1 type="C0302" >
					<#list friendlinks as link>
						<option value ="${ link.link}" >${ link.name}</option>
					</#list>
					</@friendlinkDirective >
                                </select>
                            </li>
                            <li>
                            	<select name="province-gover" id="province-gover"  onchange="onchangeop(this);">
                                	<option value ="#" disabled="disabled" selected="selected">市政府及厅局网站</option>
                                  	<@friendlinkDirective siteId=1 type="C0303" >
					<#list friendlinks as link>
						<option value ="${ link.link}" >${ link.name}</option>
					</#list>
					</@friendlinkDirective >
                                </select>
                            </li>
                            <li>
                            	<select name="local-city" id="local-city"  onchange="onchangeop(this);">
                                	<option value ="#" disabled="disabled" selected="selected">本市各区政府网站</option>
                                  	<@friendlinkDirective siteId=1 type="C0304" >
					<#list friendlinks as link>
						<option value ="${ link.link}" >${ link.name}</option>
					</#list>
					</@friendlinkDirective >
                                </select>
                            </li>
                            <li>
                            	<select name="news-media" id="news-media"  onchange="onchangeop(this);">
                                	<option value ="#" disabled="disabled" selected="selected">新闻媒体网站</option>
                                  	<@friendlinkDirective siteId=1 type="C0305" >
					<#list friendlinks as link>
						<option value ="${ link.link}" >${ link.name}</option>
					</#list>
					</@friendlinkDirective >
                                </select>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                	<!--<p>北京市农村合作经济经营管理办公室（北京市农村经济研究中心）主办 </p>-->
			
			<p>&nbsp;</p>
                    <p>北京市城乡经济信息中心技术支持</p>
                    <!--<p>ICP备案编号：京ICP 京公网安备</p>-->
                </div>        	
            </div>
        </div>
    </div>
    <!--footer结束-->
<script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>