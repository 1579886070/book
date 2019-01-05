<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/6
  Time: 8:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限不足</title>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">
</head>
<body>
<div style="font-size: 20px;">
    <span class="glyphicon glyphicon-hand-left">
        <a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
    </span>
</div>
<div style="text-align: center;margin-top: 5%;">
    <h3><span class="text-danger">权限不足，请联系管理员</span></h3>
</div>
</body>
</html>
