<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/3
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>订单管理</title>
	<script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">



</head>
<style type="text/css">
	body {
		margin: 30px;
		text-align: center;
	}
</style>

<body>
<div>
	<%@include file="/header.jsp" %>
</div>
<div style="margin:5% auto; width: 70%;">
	<div align="center">
		<font size="5">订单信息</font>
	</div>
	<br/>
	<table align="center" class="table table-hover table-bordered">
		<tr>
			<td>订单编号</td>
			<td>订单信息</td>
			<td>订单状态</td>
			<td>订单用户</td>
			<td>订单操作</td>
		</tr>


		<c:forEach items="${orders}" var="order">
			<tr>
				<td>${order.id }</td>
				<td>
					<table align="center"class="table table-condensed">
						<tr>
							<td>商品名称</td>
							<td>商品单价</td>
							<td>购买数量</td>
						</tr>

						<c:forEach items="${order.orderItems}" var="item">
							<tr>
								<td>${item.name }</td>
								<td>${item.price }</td>
								<td>${item.buynum }</td>
							</tr>
						</c:forEach>

						<tr>
							<td colspan="3" align="right">总价:${order.money}</td>
						</tr>

					</table>
				</td>
				<td><c:if test="${order.paystate==0}">
					<p><font color="black">未支付</font></p>
					<a style="color: #66afe9" href='${pageContext.request.contextPath}/pay.jsp?id=${order.id}&money=${order.money}'>点击支付</a>
					</c:if>
					<c:if test="${order.paystate==1}">
						<font color="red">已付款</font>
					</c:if>
				</td>
				<td>
					【${order.nickname}】
				</td>
				<td><a
					href="${pageContext.request.contextPath}/order?method=del&id=${order.id}">取消订单</a>
				</td>
			</tr>

		</c:forEach>
	</table>
</div>
<div class="div_foot">
	<div class="inner">
		<p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
	</div>
</div>
</body>
</html>
