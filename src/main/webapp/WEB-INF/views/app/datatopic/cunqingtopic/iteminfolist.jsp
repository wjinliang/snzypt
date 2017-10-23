<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目详情</title>
<link rel="stylesheet" type="text/css"
	href="/html/sn-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/html/sn-static/static/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="/html/sn-static/static/css/canvasbg.css">
<script type="text/javascript"
	src="/html/sn-static/static/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript"
	src="/html/sn-static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/html/sn-static/static/js/vector.js"></script>
 -->
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

ul li {
	list-style: none;
}

body {
	font-family: "微软雅黑";
}

.modal-header {
	min-height: 16px;
	padding: 15px;
	border-bottom: 1px solid #e5e5e5;
}

.modal-header h4 {
	color: #3399cc;
}

.modal-body {
	padding: 15px;
}

.part1 h4 {
	color: #ff6600;
	font-size: 16px;
	margin-bottom: 10px;
}

.model .part1 table td {
	border: 1px solid #B3B3B3;
	padding: 5px;
}

.model .part1 table td:nth-child(2) {
	color: #999;
}

.part1 {
	padding: 10px;
}
</style>
<!-- </head> -->
<body>
	<div class="model">
		<c:choose>
			<c:when test="${not empty  itemsMpJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>苗圃基地</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${itemsMpJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.mpMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.mpMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积：</span></td>
									<td><span>${item.zdMj }亩</span></td>
								</tr>
								<tr>
									<td width="150"><span>苗木总数：</span></td>
									<td><span>${item.zpmmZsl }柱</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsCsJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>百货超市</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${itemsCsJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.dzCqdw }</h4>
							<table border="1" width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>企业类型：</span></td>
									<td><span>${item.qyLx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册资本：</span></td>
									<td><span>${item.zcZb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营行业：</span></td>
									<td><span>${item.jyHy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>营业面积：</span></td>
									<td><span>${item.yyMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>法人：</span></td>
									<td><span>${item.csFr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册号：</span></td>
									<td><span>${item.csZch}</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册全号：</span></td>
									<td><span>${item.csZcqh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>企业标识码：</span></td>
									<td><span>${item.qyBsm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>档案号：</span></td>
									<td><span>${item.qyDah }</span></td>
								</tr>
								<tr>
									<td width="150"><span>筹建证号：</span></td>
									<td><span>${item.cjZh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>副本号：</span></td>
									<td><span>${item.yeFbs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>定位标志：</span></td>
									<td><span>${item.dwBz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>迁出方：</span></td>
									<td><span>${item.csQcf }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营范围：</span></td>
									<td><span>${item.jyFw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营场所：</span></td>
									<td><span>${item.jyCs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>成立日期：</span></td>
									<td><span><fmt:formatDate value="${item.clRq }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>核准日期：</span></td>
									<td><span><fmt:formatDate value="${item.hzRq }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>营业起始日期：</span></td>
									<td><span><fmt:formatDate value="${item.yeQssj }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>营业截止日期：</span></td>
									<td><span><fmt:formatDate value="${item.yeZzsj }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>变更次数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.bgCs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>备注说明：</span></td>
									<td><span>${item.bzSm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>从业人数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.cyRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>外地人数：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.wdRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>下岗人数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.xgRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>隶属单位：</span></td>
									<td><span>${item.lsDw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>申请人：</span></td>
									<td><span>${item.qySqr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>审批机关：</span></td>
									<td><span>${item.spJg }</span></td>
								</tr>
								<tr>
									<td width="150"><span>审批日期：</span></td>
									<td><span><fmt:formatDate value="${item.spRq }" pattern="yyyy年MM月dd日" /></span></span></td>
								</tr>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.qyYb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.csDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址产权单位：</span></td>
									<td><span>${item.dzCqdw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址使用期限(年)：</span></td>
									<td><span>${item.dzSyqx }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsGyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>果园基地</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsGyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人：</span></td>
									<td><span>${item.fzr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>果品种类：</span></td>
									<td><span>${item.gpZl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>认证情况：</span></td>
									<td><span>${item.rzQk }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否标准化基地：</span></td>
									<td><span>${item.sfBzhjd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否标准化基地：</span></td>
									<td><span>${item.sfGgczy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsHhjdJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>花卉基地</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsHhjdJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.hhjdMc}</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建站时间：</span></td>
									<td><span><fmt:formatDate value="${item.jzSj }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>鲜切花类年生产能力(万枝)：</span></td>
									<td><span>${item.xqhlHscnl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>观赏苗木类年生产能力(万株)：</span></td>
									<td><span>${item.gxmmlNscnl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>带动农户数量(户)：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.nDdnhs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>是否标准化基地：</span></td>
									<td><span>${item.sfBzhjd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsGggyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>观光果园</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsGggyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.szXzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.gyDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>产量(万斤)：</span></td>
									<td><span>${item.gyCl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>面积(亩)：</span></td>
									<td><span>${item.gyMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营范围：</span></td>
									<td><span>${item.jyFw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>统计年度：</span></td>
									<td><span>${item.tjNd }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsGylcJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>国有林场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsGylcJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.lcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>林场名称：</span></td>
									<td><span>${item.lcMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>林场类型：</span></td>
									<td><span>${item.lcLx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>在职职工数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.zzZgs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>退休职工数：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.txZgs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>经营总面积(亩)：</span></td>
									<td><span>${item.jyZmj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>商品林面积(亩)：</span></td>
									<td><span>${item.splMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>公益林面积(亩)：</span></td>
									<td><span>${item.gylMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>重点公益林面积(亩)：</span></td>
									<td><span>${item.zdgylMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>林业用地总面积(亩)：</span></td>
									<td><span>${item.lyydZmj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>有林地面积(亩))：</span></td>
									<td><span>${item.yldMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>活立木总蓄积量(立方米)：</span></td>
									<td><span>${item.hlmZxjl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>统计年度：</span></td>
									<td><span>${item.tjNd }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsSsnyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>设施农业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsSsnyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.cVillage }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.cAddr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>类型：</span></td>
									<td><span>${item.cEstablis }</span></td>
								</tr>
								<tr>
									<td width="150"><span>墙结构：</span></td>
									<td><span>${item.cWallstru }</span></td>
								</tr>
								<tr>
									<td width="150"><span>框架类型：</span></td>
									<td><span>${item.cFramtype }</span></td>
								</tr>
								<tr>
									<td width="150"><span>作物：</span></td>
									<td><span>${item.cPlantcro }</span></td>
								</tr>
								<tr>
									<td width="150"><span>年建立数量：</span></td>
									<td><span>${item.nEstablis }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsLtqyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>龙头企业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsLtqyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.szXzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>企业法人：</span></td>
									<td><span>${item.qyFr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>企业性质：</span></td>
									<td><span>${item.qyXz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>企业级别：</span></td>
									<td><span>${item.qyJb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>职能部门负责人姓名：</span></td>
									<td><span>${item.znbmFzrxm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>职能部门负责人电话：</span></td>
									<td><span>${item.znbmFzrdh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>报表联系人姓名：</span></td>
									<td><span>${item.bblxrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>报表联系人电话：</span></td>
									<td><span>${item.bblxrDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>总经理：</span></td>
									<td><span>${item.qyZjj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.qyDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.qyYb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电话：</span></td>
									<td><span>${item.qyDh }</span></td>
								</tr>
									<tr>
									<td width="150"><span>传真：</span></td>
									<td><span>${item.qyCz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>企业邮箱：</span></td>
									<td><span>${item.qyYx }</span></td>
								</tr>
									<tr>
									<td width="150"><span>企业网址：</span></td>
									<td><span>${item.qyWz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>统计年度：</span></td>
									<td><span>${item.tjNd }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsZzSpbaseinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>种植(三品)基地</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsZzSpbaseinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.szXzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人：</span></td>
									<td><span>${item.fzr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>已获认证情况：</span></td>
									<td><span>${item.yhrzQk }</span></td>
								</tr>
								<tr>
									<td width="150"><span>标准化基地情况：</span></td>
									<td><span>${item.bzhjdQk }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否观光采摘园：</span></td>
									<td><span>${item.sfQgczy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>nrJj：</span></td>
									<td><span>${item.nrJj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>备注：</span></td>
									<td><span>${item.bz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>qtRz：</span></td>
									<td><span>${item.qtRz }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsSnqyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>涉农企业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsSnqyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							 <table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								 <tr>
									<td width="150"><span>企业名称：</span></td>
									<td><span>${item.qyMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册资金(万元)：</span></td>
									<td><span>${item.zcZj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr> 
							</table> 
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsTsNcpJbxxinfolist||not empty  itemsCmsYcypShierinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>特色农产品</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsTsNcpJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							 <table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>区县名称：</span></td>
									<td><span>${item.qxMc }</span></td>
								</tr>
								 <tr>
									<td width="150"><span>所在乡镇：</span></td>
									<td><span>${item.xzMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色产品：</span></td>
									<td><span>${item.tscpMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr> 
							</table> 
						</div>
					</c:forEach>
					<c:forEach items="${itemsCmsYcypShierinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${item.title }</h4>
							 <table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>简介：</span></td>
									<td><span>${item.subTitle }</span></td>
								</tr>
								 
							</table> 
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsYzcJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsYzcJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
<!-- 								<tr> -->
<!-- 									<td width="150"><span>对象简介：</span></td> -->
<%-- 									<td><span>${item.yzcYb }</span></td> --%>
<!-- 								</tr> -->
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsXqlzcJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>畜禽良种场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsXqlzcJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.szXzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>代次：</span></td>
									<td><span>${item.yzcDc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>动物种类：</span></td>
									<td><span>${item.dwPz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>数量级单位：</span></td>
									<td><span>${item.slDw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营范围：</span></td>
									<td><span>${item.jyFw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>存栏量：</span></td>
									<td><span>${item.dwCll }</span></td>
								</tr>
								<tr>
									<td width="150"><span>法人：</span></td>
									<td><span>${item.frDb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.yzcYb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.yzcDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>统计年度：</span></td>
									<td><span>${item.tjNd }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsYangyzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>羊养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsYangyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
						<c:when test="${not empty  itemsYayzcbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>鸭养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsYayzcbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsSczsqyyzJbxxinfolist}">
			<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4>水产追溯企业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsSczsqyyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.qyPp }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>主要产品：</span></td>
									<td><span>${item.zyCp }</span></td>
								</tr>
								<tr>
									<td width="150"><span>预计产量(万斤)：</span></td>
									<td><span>${item.yjCl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>追溯方式：</span></td>
									<td><span>${item.zsFs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>销售地区：</span></td>
									<td><span>${item.xsDq }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系人：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.qyYb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.qyDz }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsDwwsfysJbxxinfolist}">
			<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4>动物卫生防疫所</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsDwwsfysJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.dwMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>所属级别：</span></td>
									<td><span>${item.ssJb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsDwzldwJbxxinfolist}">
			<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4>动物诊疗单位</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsDwzldwJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.dwMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
		<c:when test="${not empty  itemsSlqyyzJbxxinfolist}">
			<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4>饲料企业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsSlqyyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.szXzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>组织机构代码：</span></td>
									<td><span>${item.zzjjDm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>通讯地址：</span></td>
									<td><span>${item.txDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系人姓名：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>生产能力：</span></td>
									<td><span>${item.scNl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>产品类别：</span></td>
									<td><span>${item.cpLb }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
					<c:when test="${not empty  itemsXmjgJbxxinfolist}">
			<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4>畜牧相关机构</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsXmjgJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.mc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>机构类别：</span></td>
									<td><span>${item.jgLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>传真号码：</span></td>
									<td><span>${item.czHm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>备注：</span></td>
									<td><span>${item.bzNr }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsDanjiJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>蛋鸡养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsDanjiJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>YZ_GM：</span></td>
									<td><span>${item.yzGm }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsRoujiyzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>肉鸡养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsRoujiyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>YZ_GM：</span></td>
									<td><span>${item.yzGm }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsRouniuyzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>肉牛养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsRouniuyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsShengzhuJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>生猪养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsShengzhuJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsTsyzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>特色养殖养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsTsyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsNainiuJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>奶牛养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNainiuJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>基地地址：</span></td>
									<td><span>${item.jdDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>养殖场类别：</span></td>
									<td><span>${item.yzcLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsScyzcJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>水产养殖场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsScyzcJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.yzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lzDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsTzqyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>屠宰企业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsTzqyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.qyMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsSyjyqyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>兽医经营企业</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsSyjyqyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.qyMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsNfscJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>农副市场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNfscJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.nfscZh }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>市场名称：</span></td>
									<td><span>${item.gsmc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>字号：</span></td>
									<td><span>${item.nfscZh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营行业：</span></td>
									<td><span>${item.jyHy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>行业类别：</span></td>
									<td><span>${item.hyDl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>企业类别：</span></td>
									<td><span>${item.qyLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册资本：</span></td>
									<td><span>${item.zcZb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>营业面积：</span></td>
									<td><span>${item.yyMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特殊类型：</span></td>
									<td><span>${item.tsLx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册号：</span></td>
									<td><span>${item.nfscZch }</span></td>
								</tr>
								<tr>
									<td width="150"><span>注册全号：</span></td>
									<td><span>${item.nfscZcqh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>档案号：</span></td>
									<td><span>${item.qyDah }</span></td>
								</tr>
								<tr>
									<td width="150"><span>筹建证号：</span></td>
									<td><span>${item.cjZh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>副本号：</span></td>
									<td><span>${item.yeFbs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>定位标志：</span></td>
									<td><span>${item.dwBz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>迁入标记：</span></td>
									<td><span>${item.qrBj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>迁入日期：</span></td>
									<td><span><fmt:formatDate value="${item.qrRq }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>迁出方：</span></td>
									<td><span>${item.nfscQcf }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营范围：</span></td>
									<td><span>${item.jyFw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经营场所：</span></td>
									<td><span>${item.jyCs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>成立日期：</span></td>
									<td><span><fmt:formatDate value="${item.clRq }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>核准日期：</span></td>
									<td><span><fmt:formatDate value="${item.hzRq }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>营业起始日期：</span></td>
									<td><span><fmt:formatDate value="${item.yeQssj }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>营业截止日期：</span></td>
									<td><span><fmt:formatDate value="${item.yeZzsj }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>变更次数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.bgCs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>备案次数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.baCs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>从业人数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.cyRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>外地人数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.wdRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>下岗人数：</span></td>
									<td><span>
									<fmt:formatNumber type="number" value="${item.xgRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>隶属单位：</span></td>
									<td><span>${item.lsDw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>申请人：</span></td>
									<td><span>${item.qySqr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>审批机关：</span></td>
									<td><span>${item.spJg }</span></td>
								</tr>
								<tr>
									<td width="150"><span>审批日期：</span></td>
									<td><span><fmt:formatDate value="${item.spRq }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.qyYb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.nfscDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址产权单位：</span></td>
									<td><span>${item.nfscCqdw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地址使用期限(年)：</span></td>
									<td><span>${item.nfscSyqx }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsKjsfhJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>科技示范户</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsKjsfhJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>负责人：</span></td>
									<td><span>${item.fzrName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>性别：</span></td>
									<td><span>${item.xb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>出生日期：</span></td>
									<td><span>${item.cRq }</span></td>
								</tr>
								<tr>
									<td width="150"><span>学历：</span></td>
									<td><span>${item.xl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>示范技术：</span></td>
									<td><span>${item.sfJs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsKjsfyqJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>科技示范园区</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsKjsfyqJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>占地面积(亩)：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsWlwsdjsJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>物联网示范点</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsWlwsdjsJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.szXzc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>法人：</span></td>
									<td><span>${item.dwFr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系人：</span></td>
									<td><span>${item.lxrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>面积：</span></td>
									<td><span>${item.zdMj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设年度：</span></td>
									<td><span>${item.jsNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>基本概况：</span></td>
									<td><span>${item.jbGk }</span></td>
								</tr>
								<tr>
									<td width="150"><span>视频URL：</span></td>
									<td><span>${item.spUrl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>**URL：</span></td>
									<td><span>${item.yzUrl }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsNykjAnyzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>爱农驿站</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNykjAnyzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.ytDw }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>人员数量：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.rySl }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>服务对象：</span></td>
									<td><span><fmt:formatDate pattern="yyyy年MM月dd日" value="${item.fwDx }" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>建站时间：</span></td>
									<td><span>${item.jzSj}</span></td>
								</tr>
							
								<tr>
									<td width="150"><span>服务时间：</span></td>
									<td><span>${item.fwSj}</span></td>
								</tr>
									<tr>
									<td width="150"><span>联系人：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>手机(移动电话)：</span></td>
									<td><span>${item.ydDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电子邮件：</span></td>
									<td><span>${item.dzYj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
				<c:when test="${not empty  itemsNykjYcjyzdJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>远程教育站点</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNykjYcjyzdJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>人员数量：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.rySl }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>培训规模：</span></td>
									<td><span>${item.pxGm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建站时间：</span></td>
									<td><span><fmt:formatDate pattern="yyyy年MM月dd日" value="${item.jzSj}" /></span></td>
								</tr>
							
								<tr>
									<td width="150"><span>服务时间：</span></td>
									<td><span>${item.fwSj }</span></td>
								</tr>
									<tr>
									<td width="150"><span>联系人：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>手机(移动电话)：</span></td>
									<td><span>${item.ydDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电子邮件：</span></td>
									<td><span>${item.dzYj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsNykjSzjyJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>数字家园</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNykjSzjyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.ytDw }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>人员数量：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.rySl }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>服务对象：</span></td>
									<td><span>${item.fwDx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>服务内容：</span></td>
									<td><span>${item.fwNw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建站时间：</span></td>
									<td><span><fmt:formatDate pattern="yyyy年MM月dd日" value="${item.jzSj}" /></span></td>
								</tr>
							
								<tr>
									<td width="150"><span>服务时间：</span></td>
									<td><span>${item.fwSj }</span></td>
								</tr>
									<tr>
									<td width="150"><span>联系人：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>手机(移动电话)：</span></td>
									<td><span>${item.ydDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电子邮件：</span></td>
									<td><span>${item.dzYj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsNykjTjxxJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>田间学校</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNykjSzjyJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.jbDw }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>田间学校类型：</span></td>
									<td><span>${item.tjxxLx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>合计授课时间(小时)：</span></td>
									<td><span>${item.hjskSj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
							
								<tr>
									<td width="150"><span>学员数目(人)：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.xySm }"/></span></td>
								</tr>
									<tr>
									<td width="150"><span>已推广技术：</span></td>
									<td><span>${item.ytgJs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>统计年度：</span></td>
									<td><span>${item.tjNd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>填报单位：</span></td>
									<td><span>${item.tbDw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责部门：</span></td>
									<td><span>${item.bmFz }</span></td>
								</tr>
									<tr>
									<td width="150"><span>填报人姓名：</span></td>
									<td><span>${item.tbrXm }</span></td>
								</tr>
									<tr>
									<td width="150"><span>填报日期：</span></td>
									<td><span><fmt:formatDate pattern="yyyy年MM月dd日" value="${item.tbRq}" /></span></td>
								</tr>
									<tr>
									<td width="150"><span>联系方式：</span></td>
									<td><span>${item.lxFs }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsNykjXtygzzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>协调员工作站</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNykjXtygzzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.ytDw }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>人员数量：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.rySl }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>服务对象：</span></td>
									<td><span>${item.fwDx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>服务内容：</span></td>
									<td><span>${item.fwNw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建站时间：</span></td>
									<td><span>${item.jzSj }</span></td>
								</tr>
							
								<%-- <tr>
									<td width="150"><span>服务时间：</span></td>
									<td><span>${item.fwSj }</span></td>
								</tr> --%>
									<tr>
									<td width="150"><span>联系人：</span></td>
									<td><span>${item.lxr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>手机(移动电话)：</span></td>
									<td><span>${item.ydDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电子邮件：</span></td>
									<td><span>${item.dzYj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsNjfwzzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>农机服务组织</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNjfwzzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建设时间：</span></td>
									<td><span>${item.jsSj }</span></td>
								</tr>
							
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			<c:when test="${not empty  itemsNyjstgzJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>农业技术推广站</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNyjstgzJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.tgzMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>建站时间：</span></td>
									<td><span>${item.jzSj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>负责人姓名：</span></td>
									<td><span>${item.fzrXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>在编人数(人)：</span></td>
									<td><span><fmt:formatNumber type="number" value="${item.zbRs }"/></span></td>
								</tr>
								<tr>
									<td width="150"><span>服务技术类型：</span></td>
									<td><span>${item.fwJslx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>推广技术名称：</span></td>
									<td><span>${item.tgJsmc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>对象简介：</span></td>
									<td><span>${item.dxJj }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsJyscJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>经营市场</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsJyscJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.mc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>地址：</span></td>
									<td><span>${item.xxDz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>动物防疫合格证编号：</span></td>
									<td><span>${item.dwfyHgzbh }</span></td>
								</tr>
								<tr>
									<td width="150"><span>法人：</span></td>
									<td><span>${item.frDb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>联系电话：</span></td>
									<td><span>${item.lxDh }</span></td>
								</tr>
								<%-- <tr>
									<td width="150"><span>**号码：</span></td>
									<td><span>${item.czHm }</span></td>
								</tr> --%>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.yzBm }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
            <c:when test="${not empty  itemsZzZwscinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>${itemsZzZwscinfolist[0].scLb }作物</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsZzZwscinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							 <h4>${index.index+1 }.${item.zwMc }</h4> 
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>作物名称：</span></td>
									<td><span>${item.zwMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>产量：</span></td>
									<td><span>${item.cl }${item.dw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>年份：</span></td>
									<td><span>${item.nf }年</span></td>
								</tr>
								<tr>
									<td width="150"><span>类别：</span></td>
									<td><span>${item.scLb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>种植面积：</span></td>
									<td><span>${item.bzMj }亩</span></td>
								</tr>
								
								<tr>
									<td width="150"><span>作物分类：</span></td>
									<td><span>${item.zwFl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>作物种类：</span></td>
									<td><span>${item.zwZl }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  itemsNatureSoilinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>土壤资源</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNatureSoilinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.dlMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>速效磷：</span></td>
									<td><span>${item.fastP }</span></td>
								</tr>
								<tr>
									<td width="150"><span>速效钾：</span></td>
									<td><span>${item.fastK }</span></td>
								</tr>
								<tr>
									<td width="150"><span>破解氮：</span></td>
									<td><span>${item.alkaN }</span></td>
								</tr>
								<tr>
									<td width="150"><span>有机质：</span></td>
									<td><span>${item.organic }</span></td>
								</tr>
								<tr>
									<td width="150"><span>全氮：</span></td>
									<td><span>${item.entN }</span></td>
								</tr>
								<tr>
									<td width="150"><span>有机质分值：</span></td>
									<td><span>${item.yjzFz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>有效磷分值：</span></td>
									<td><span>${item.yxpFz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>全氮分值：</span></td>
									<td><span>${item.qnFz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>速效钾分值：</span></td>
									<td><span>${item.sxkFz }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>**氮分值：</span></td>
									<td><span>${item.jjnFz }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>面积：</span></td>
									<td><span>${item.shapeMj }</span></td>
								</tr>
								<%-- <tr>
									<td width="150"><span>SHAPE：</span></td>
									<td><span>${item.shape }</span></td>
								</tr>
								<tr>
									<td width="150"><span>AREA_：</span></td>
									<td><span>${item.area0 }</span></td>
								</tr>
								<tr>
									<td width="150"><span>LEN：</span></td>
									<td><span>${item.len }</span></td>
								</tr>
								<tr>
									<td width="150"><span>LEN_1：</span></td>
									<td><span>${item.len1 }</span></td>
								</tr>
								<tr>
									<td width="150"><span>AREA：</span></td>
									<td><span>${item.area }</span></td>
								</tr>
									<tr>
									<td width="150"><span>AREA_1：</span></td>
									<td><span>${item.area1 }</span></td>
								</tr> --%>
									<tr>
									<td width="150"><span>名称：</span></td>
									<td><span>${item.mc }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			 <c:when test="${not empty  itemsNatureFnydinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>非农用地资源</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNatureFnydinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							 <h4>${index.index+1 }.${item.dlMc }</h4> 
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>地类种类：</span></td>
									<td><span>${item.dlZl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地类名称：</span></td>
									<td><span>${item.cl }${item.dlMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地类编码：</span></td>
									<td><span>${item.dlBm }年</span></td>
								</tr>
								<tr>
									<td width="150"><span>面积：</span></td>
									<td><span>${item.shape }</span></td>
								</tr>
							</table>	
						</div>
					</c:forEach>
				</div>
			</c:when>
			 <c:when test="${not empty  itemsNatureNydinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>农用地资源</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsNatureNydinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							 <h4>${index.index+1 }.${item.dlMc }</h4> 
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>地类编码：</span></td>
									<td><span>${item.dlBm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>居民点距离：</span></td>
									<td><span>${item.jmdJl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>道路距离：</span></td>
									<td><span>${item.dlJl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>综合星级：</span></td>
									<td><span>${item.zhXj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>居民点ID：</span></td>
									<td><span>${item.idJmd }</span></td>
								</tr>
								<tr>
									<td width="150"><span>道路工矿ID：</span></td>
									<td><span>${item.idDlgk }</span></td>
								</tr>
								<tr>
									<td width="150"><span>道路工矿距离：</span></td>
									<td><span>${item.dlgkJl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>道路ID：</span></td>
									<td><span>${item.idDl }</span></td>
								</tr>
								<tr>
									<td width="150"><span>限制因素等级：</span></td>
									<td><span>${item.xzysDj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>非限制因素分值：</span></td>
									<td><span>${item.fxzysFz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>综合评分：</span></td>
									<td><span>${item.zhPf }</span></td>
								</tr>
								<tr>
									<td width="150"><span>污染质数：</span></td>
									<td><span>${item.wrZs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>污染质数2：</span></td>
									<td><span>${item.wrZs2 }</span></td>
								</tr>
								<tr>
									<td width="150"><span>污染质数3：</span></td>
									<td><span>${item.wrZs3 }</span></td>
								</tr>
								<tr>
									<td width="150"><span>地类名称：</span></td>
									<td><span>${item.dlMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>自然等别：</span></td>
									<td><span>${item.zrDb }</span></td>
								</tr>
								<tr>
									<td width="150"><span>来源等别：</span></td>
									<td><span>${item.lyDb }</span></td>
								</tr>
								<tr>							<tr>
									<td width="150"><span>经济等别：</span></td>
									<td><span>${item.jjDb }</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${not empty  tbbaseinfosList}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>实用人才</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${tbbaseinfosList }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.baseInfoName }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<%-- <tr>
									<td width="150"><span>身份证：</span></td>
									<td><span>${item.baseInfoIdNumber }</span></td>
								</tr>
								<tr>
									<td width="150"><span>性别：</span></td>
									<td><span>
									<c:if test="${item.baseInfoSex=='1' }">男</c:if>
									<c:if test="${item.baseInfoSex=='0' }">女</c:if>
									</span></td>
								</tr> --%>
								<tr>
									<td width="150"><span>生日：</span></td>
									<td><span><fmt:formatDate value="${item.baseInfoBirthday }" pattern="yyyy年MM月dd日" /></span></td>
								</tr>
								<tr>
									<td width="150"><span>民族：</span></td>
									<td><span>${item.nationName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>政治面貌：</span></td>
									<td><span>${item.politicsName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>学历：</span></td>
									<td><span>${item.educationName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>学位：</span></td>
									<td><span>${item.baseInfoXw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>户籍属性：</span></td>
									<td><span>${item.hukouName }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>家庭人口：</span></td>
									<td><span>${item.baseInfoJtrk }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>家庭年平均收入（万：</span></td>
									<td><span>${item.baseInfoJtpjsr }</span></td>
								</tr>
								<tr>
									<td width="150"><span>最新带动户数：</span></td>
									<td><span>${item.baseInfoDdhs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>人才类别：</span></td>
									<td><span>${item.classiFicationName }</span></td>
								</tr>
							<%-- 	<tr>
									<td width="150"><span>从事产业：</span></td>
									<td><span>${item.workTypeName }</span></td>
								</tr> --%>
								<tr>
									<td width="150"><span>从业地址：</span></td>
									<td><span>${item.baseInfoCydz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>工作单位：</span></td>
									<td><span>${item.baseInfoGzdw }</span></td>
								</tr>
									<tr>
									<td width="150"><span>电话：</span></td>
									<td><span>${item.baseInfoPhone }</span></td>
								</tr>
								<tr>
									<td width="150"><span>手机：</span></td>
									<td><span>${item.baseInfoCellPhone }</span></td>
								</tr>
								<tr>
									<td width="150"><span>邮编：</span></td>
									<td><span>${item.baseInfoCode }</span></td>
								</tr>
								<tr>
									<td width="150"><span>毕业院校：</span></td>
									<td><span>${item.baseInfoByyx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>毕业时间：</span></td>
									<td><span>${item.baseInfoBysj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>通讯地址：</span></td>
									<td><span>${item.baseinfoAddress }</span></td>
								</tr>
								<tr>
									<td width="150"><span>技术职称：</span></td>
									<td><span>${item.techpositionName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>职务：</span></td>
									<td><span>${item.baseInfoZw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>培养渠道：</span></td>
									<td><span>${item.traingTypeName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>人才级别：</span></td>
									<td><span>${item.levelName }</span></td>
								</tr>
								<tr>
									<td width="150"><span>初级证书编号：</span></td>
									<td><span>${item.baseInfoCertificate }</span></td>
								</tr>
								<tr>
									<td width="150"><span>中级证书编号：</span></td>
									<td><span>${item.baseInfoZjNum }</span></td>
								</tr>
								<tr>
									<td width="150"><span>高级证书编号：</span></td>
									<td><span>${item.baseInfoGjNum }</span></td>
								</tr>
								<tr>
									<td width="150"><span>突贡人才标记：</span></td>
									<td><span>
									<c:if test="${item.baseInfoTg=='0' }">否</c:if>
									<c:if test="${item.baseInfoTg=='1' }">是</c:if>
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>突贡人才证书编号：</span></td>
									<td><span>${item.baseInfoTGNum }
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>推荐状态：</span></td>
									<td><span>
									<c:if test="${item.baseinfoNominate=='0' }">已推荐</c:if>
									<c:if test="${item.baseinfoNominate=='1' }">未推荐</c:if>
									<c:if test="${item.baseinfoNominate=='2' }">所有</c:if>
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>年检状态：</span></td>
									<td><span>
									<c:if test="${item.baseInfoStatus=='0' }">正常</c:if>
									<c:if test="${item.baseInfoStatus=='1' }">已故</c:if>
									<c:if test="${item.baseInfoStatus=='2' }">已故</c:if>
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>备注：</span></td>
									<td><span>${item.baseInfoBz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>审核标记：</span></td>
									<td><span>
									<c:if test="${item.baseInfoCheck=='0' }">未审核</c:if>
									<c:if test="${item.baseInfoCheck=='1' }">审核</c:if>
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>记录完整性：</span></td>
									<td><span>
									<c:if test="${item.baseInfoCompletely=='0' }">不完整</c:if>
									<c:if test="${item.baseInfoCompletely=='1' }">完整</c:if>
									</span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
			
		    <c:when test="${not empty  itemsXclyLycinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>民俗旅游村</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsXclyLycinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.shMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>所在市：</span></td>
									<td><span>${item.szsMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>所在区县：</span></td>
									<td><span>
									${item.qxMc }
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.address }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电话：</span></td>
									<td><span>${item.phone }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经度纬度：</span></td>
									<td><span>${item.jingDuWeiDu }</span></td>
								</tr>
								<tr>
									<td width="150"><span>一级行业</span></td>
									<td><span>${item.yjhy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>二级行业：</span></td>
									<td><span>${item.ejhy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否已上百度地图：</span></td>
									<td><span>${item.sfBddt }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>咨询热线：</span></td>
									<td><span>${item.zxrx }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>预订热线：</span></td>
									<td><span>${item.ydrx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否有WIFI覆盖：</span></td>
									<td><span>${item.sfWifi }</span></td>
								</tr>
								<tr>
									<td width="150"><span>有无旅游咨询中心：</span></td>
									<td><span>${item.ywlyzxfwzx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>简介：</span></td>
									<td><span>${item.jianJie }</span></td>
								</tr> 
								<tr>
									<td width="150"><span>住宿环境：</span></td>
									<td><span>${item.zsHj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>餐饮设施：</span></td>
									<td><span>${item.cySs }</span></td>
								</tr>
									<tr>
									<td width="150"><span>娱乐项目：</span></td>
									<td><span>${item.ylXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色美食：</span></td>
									<td><span>${item.msTs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色农产品：</span></td>
									<td><span>${item.tsNcp }</span></td>
								</tr>
								<tr>
									<td width="150"><span>能否观光采摘：</span></td>
									<td><span>${item.nfGgcz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>采摘品种、季节：</span></td>
									<td><span>${item.czPzJj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>传说、典故：</span></td>
									<td><span>${item.csDg }</span></td>
								</tr>	
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>		


    <c:when test="${not empty  itemsXclyLyhinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>民俗旅游户</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsXclyLyhinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.shMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>所在市：</span></td>
									<td><span>${item.szsMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>所在区县：</span></td>
									<td><span>
									${item.qxMc }
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.address }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电话：</span></td>
									<td><span>${item.phone }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经度纬度：</span></td>
									<td><span>${item.jingDuWeiDu }</span></td>
								</tr>
								<tr>
									<td width="150"><span>一级行业</span></td>
									<td><span>${item.yjhy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>二级行业：</span></td>
									<td><span>${item.ejhy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否已上百度地图：</span></td>
									<td><span>${item.sfBddt }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>咨询热线：</span></td>
									<td><span>${item.zxrx }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>预订热线：</span></td>
									<td><span>${item.ydrx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否有WIFI覆盖：</span></td>
									<td><span>${item.sfWifi }</span></td>
								</tr>
								<tr>
									<td width="150"><span>简介：</span></td>
									<td><span>${item.jianJie }</span></td>
								</tr> 
								<tr>
									<td width="150"><span>经营面积（平米）：</span></td>
									<td><span>${item.jymj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>床位：</span></td>
									<td><span>${item.cw }</span></td>
								</tr>
								<tr>
									<td width="150"><span>接待价格（每人/天）：</span></td>
									<td><span>${item.jdJg }</span></td>
								</tr>
								
								<tr>
									<td width="150"><span>住宿环境：</span></td>
									<td><span>${item.zsHj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>餐饮设施：</span></td>
									<td><span>${item.cySs }</span></td>
								</tr>
									<tr>
									<td width="150"><span>娱乐项目：</span></td>
									<td><span>${item.ylXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色美食：</span></td>
									<td><span>${item.msTs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色农产品：</span></td>
									<td><span>${item.tsNcp }</span></td>
								</tr>
								<tr>
									<td width="150"><span>能否观光采摘：</span></td>
									<td><span>${item.nfGgcz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>采摘品种、季节：</span></td>
									<td><span>${item.czPzJj }</span></td>
								</tr>	
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>			
			
			
			    <c:when test="${not empty  itemsXclyNyYqinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>乡村旅游之农业园区</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsXclyNyYqinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.shMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								<tr>
									<td width="150"><span>所在市：</span></td>
									<td><span>${item.szsMc }</span></td>
								</tr>
								<tr>
									<td width="150"><span>所在区县：</span></td>
									<td><span>
									${item.qxMc }
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>详细地址：</span></td>
									<td><span>${item.address }</span></td>
								</tr>
								<tr>
									<td width="150"><span>电话：</span></td>
									<td><span>${item.phone }</span></td>
								</tr>
								<tr>
									<td width="150"><span>经度纬度：</span></td>
									<td><span>${item.jingDuWeiDu }</span></td>
								</tr>
								<tr>
									<td width="150"><span>一级行业</span></td>
									<td><span>${item.yjhy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>二级行业：</span></td>
									<td><span>${item.ejhy }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否已上百度地图：</span></td>
									<td><span>${item.sfBddt }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>咨询热线：</span></td>
									<td><span>${item.zxrx }</span></td>
								</tr>
								<tr>
								    <td width="150"><span>预订热线：</span></td>
									<td><span>${item.ydrx }</span></td>
								</tr>
								<tr>
									<td width="150"><span>是否有WIFI覆盖：</span></td>
									<td><span>${item.sfWifi }</span></td>
								</tr>
								<tr>
									<td width="150"><span>简介：</span></td>
									<td><span>${item.jianJie }</span></td>
								</tr> 
								<tr>
									<td width="150"><span>经营特色：</span></td>
									<td><span>${item.jyTs }</span></td>
								</tr>
								
								<tr>
									<td width="150"><span>住宿环境：</span></td>
									<td><span>${item.zsHj }</span></td>
								</tr>
								<tr>
									<td width="150"><span>餐饮设施：</span></td>
									<td><span>${item.cySs }</span></td>
								</tr>
									<tr>
									<td width="150"><span>娱乐项目：</span></td>
									<td><span>${item.ylXm }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色美食：</span></td>
									<td><span>${item.msTs }</span></td>
								</tr>
								<tr>
									<td width="150"><span>特色农产品：</span></td>
									<td><span>${item.tsNcp }</span></td>
								</tr>
								<tr>
									<td width="150"><span>能否观光采摘：</span></td>
									<td><span>${item.nfGgcz }</span></td>
								</tr>
								<tr>
									<td width="150"><span>采摘品种、季节：</span></td>
									<td><span>${item.czPzJj }</span></td>
								</tr>	
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>
			
		<c:when test="${not empty  itemsXncJsJbxxinfolist}">
				<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>新农村建设基本信息</h4>
				 </div>-->
				<div class="modal-body">
					<c:forEach items="${itemsXncJsJbxxinfolist }" var="item"
						varStatus="index">
						<div class="part1">
							<h4>${index.index+1 }.${item.xzcMc }</h4>
							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-spacing: 0; border-collapse: collapse;">
								
								<tr>
									<td width="150"><span>所在区县：</span></td>
									<td><span>
									${item.qxMc }
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>所在乡镇：</span></td>
									<td><span>
									${item.xzMc }
									</span></td>
								</tr>
								<tr>
									<td width="150"><span>统计年度：</span></td>
									<td><span><c:if test="${!empty item.tjNd }">${item.tjNd }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>太阳能照明个数(盏)：</span></td>
									<td><span><c:if test="${!empty item.tynzmGs }">${item.tynzmGs }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>太阳能照明装机容量(瓦)：</span></td>
									<td><span><c:if test="${!empty item.tynzmZjrl }">${item.tynzmZjrl }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>太阳能热水器安装户数(个)：</span></td>
									<td><span><c:if test="${!empty item.tynrsqAzhs }">
									<fmt:formatNumber type="number" value="${item.tynrsqAzhs }" /></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>太阳能热水器采暖面积(平方米)：</span></td>
									<td><span><c:if test="${!empty item.tynrsqCrmj }">${item.tynrsqCrmj }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>节能卫生吊炕个数(户)：</span></td>
									<td><span><c:if test="${!empty item.jnwsDkgs }">
									<fmt:formatNumber type="number" value="${item.jnwsDkgs }"/></c:if></span></td>
								</tr>
								
								<tr>
									<td width="150"><span>成型燃料加工点个数(个)：</span></td>
									<td><span><c:if test="${!empty item.cxrljgdGs }">
									<fmt:formatNumber type="number" value="${item.cxrljgdGs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>成型燃料加工点消耗秸秆(吨)：</span></td>
									<td><span><c:if test="${!empty item.cxrljgdXhjg }">${item.cxrljgdXhjg }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>成型燃料加工点年产量(吨)：</span></td>
									<td><span><c:if test="${!empty item.cxrljgdNcl }">${item.cxrljgdNcl }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>生物质燃炉户数(户)：</span></td>
									<td><span><c:if test="${!empty item.swzrlHs }">
									<fmt:formatNumber type="number" value="${item.swzrlHs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>生物质燃炉炊事用炉数(台)：</span></td>
									<td><span><c:if test="${!empty item.swzrlCsyr }">${item.swzrlCsyr }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>能源技术服务站个数(个)：</span></td>
									<td><span><c:if test="${!empty item.nyjsfwzGs }">
									<fmt:formatNumber value="${item.nyjsfwzGs }" type="number"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>农村雨洪利用工程个数(个)：</span></td>
									<td><span><c:if test="${!empty item.ncyhgcGs }">
									<fmt:formatNumber type="number" value="${item.ncyhgcGs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>农村雨洪利用工程集水量(立方米)：</span></td>
									<td><span><c:if test="${!empty item.ncyhgcJsl }">${item.ncyhgcJsl }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>沼气池个数(个)：</span></td>
									<td><span><c:if test="${!empty item.zqcGs }">
									<fmt:formatNumber type="number" value="${item.zqcGs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>沼气池池容(立方米)：</span></td>
									<td><span><c:if test="${!empty item.zqcCr }">${item.zqcCr }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>沼气使用户数(户)：</span></td>
									<td><span><c:if test="${!empty item.zqSyhs }">
									<fmt:formatNumber type="number" value="${item.zqSyhs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>秸秆气化站个数(个)：</span></td>
									<td><span><c:if test="${!empty item.jgqhzGs }">
									<fmt:formatNumber type="number" value="${item.jgqhzGs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>秸秆气化站处理能力(吨)：</span></td>
									<td><span><c:if test="${!empty item.jgqhzClnl }">${item.jgqhzClnl }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>沼气池年产沼气(立方米)：</span></td>
									<td><span><c:if test="${!empty item.zqcNczq }">${item.zqcNczq }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>秸秆气化站使用户数(户)：</span></td>
									<td><span><c:if test="${!empty item.jgqhzSyhs }">
									<fmt:formatNumber type="number" value="${item.jgqhzSyhs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>有机肥生产点个数(个)：</span></td>
									<td><span><c:if test="${!empty item.yjhscdGs }">
									<fmt:formatNumber type="number" value="${item.yjhscdGs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>有机肥生产点年消耗粪便(吨)：</span></td>
									<td><span><c:if test="${!empty item.yjhscdNxhfb }">${item.yjhscdNxhfb }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>有机肥生产点年产量(吨)：</span></td>
									<td><span><c:if test="${!empty item.yjhscdNcl }">${item.yjhscdNcl }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>粪污治理点个数(个)：</span></td>
									<td><span><c:if test="${!empty item.fwcldGs }">
									<fmt:formatNumber type="number" value="${item.fwcldGs }"/></c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>粪污治理点年消耗粪便(吨)：</span></td>
									<td><span><c:if test="${!empty item.fwcldNxhfb }">${item.fwcldNxhfb }</c:if></span></td>
								</tr>
								<tr>
									<td width="150"><span>备注：</span></td>
									<td><span><c:if test="${!empty item.bz }">${item.bz }</c:if></span></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</c:when>		
			
			
			<c:otherwise>
  			<!--<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4>无查询结果</h4>
				 </div>-->
				<div class="modal-body">无查询结果</div>
		</c:otherwise>

		</c:choose>
	</div>
</body>
</html>