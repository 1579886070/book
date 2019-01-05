<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/14
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.png" />
    <title>Title</title>
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
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
<div style="margin-top: 5%;" class="panel panel-info">
    <div class="panel-heading">关于我</div>
    <div class="panel-body">
        <table class="table table-bordered">
            <tr>
                <td width="92">姓名:</td>
                <td width="100">小信</td>
                <td width="89">出生日期:</td>
                <td width="113">1999-12-18</td>
                <td width="91">性别:</td>
                <td width="48">男</td>
            </tr>
            <tr>
                <td><p >技能掌握：</p></td>
                <td colspan="5"><p >熟悉javase </p>
                    <p >熟悉javaee </p>
                    <p >掌握Spring,Mybatis,PringMvc框架。了解Hibernate，Struts </p>
                    <p >熟悉html/css/js </p>
                    <p >熟悉Maven，Git，idea，eclipse</p></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
