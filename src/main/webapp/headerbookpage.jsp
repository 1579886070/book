<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/9/23
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">
</head>
<body>
<div class="site-wrapper">
    <div class="inner">
        <h1 class="masthead-brand">网上书城</h1>
        <nav>
            <ul class="nav masthead-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">首页·</a></li>
                <li><a href="${pageContext.request.contextPath}/showshopping.jsp">查看购物车</a></li>
                <li><a href="${pageContext.request.contextPath}/order?method=search">查看订单</a></li>
                <li><a href="${pageContext.request.contextPath}/addproduct.jsp">添加图书</a></li>
                <li><a href="${pageContext.request.contextPath}/product?method=findProduct">删除图书</a></li>
                <li><a href="${pageContext.request.contextPath }/login.jsp">登陆/注册</a></li>
            </ul>
        </nav>
    </div>
</div>
<ol class="breadcrumb">
    <%--用户登陆信息--%>
    <li class="active">当前用户</li>
    <li>
        <c:if test="${empty user }">
           未登录
        </c:if>

        <c:if test="${not empty user }">
            ${user.nickname}
            <a style="color: #1b6d85" href='${pageContext.request.contextPath}/user?method=logout'>注销</a>
        </c:if>
  </li>

</ol>
</body>
</html>
