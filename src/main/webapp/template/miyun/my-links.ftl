<div class="frend-link">
                	<div class="gray">
                		<span class="blue">友情链接</span>
                	</div>
                    <div class="panel-body">
		    <div id="demo">
                            <table>
                                <tbody>
                                    <tr>
                                        <td id="demo1">
                                            <table>
                                                <tbody>
                                                    <tr>
						     <@friendlinkDirective siteId=1 pageSize=100 >
							<#list friendlinks as link>
							<td><a href="${ link.link}"><img src="${ link.logo!}" width="167" height="83" style="border: solid 1px #ccc; margin-right: 2px;"><p>${ link.name}</p></a></td>
							</#list>
						    </@friendlinkDirective >
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td id="demo2"></td>
                                    </tr>
                                </tbody>
                            </table>
    			</div>
                    </div>
                </div>