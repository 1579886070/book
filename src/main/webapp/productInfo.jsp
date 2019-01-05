<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/9/29
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书详细信息</title>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">
</head>
<style type="text/css">
    body {
        margin: 30px;
        text-align: center;
    }
</style>

<script type="text/javascript">
    function addProductToCart(id) {
        location.href = "${pageContext.request.contextPath}/shopping?method=add&id=" + id;
    }
</script>

<body>
<div style="font-size: 20px;">
    <span class="glyphicon glyphicon-hand-left">
        <a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
    </span>
</div>
<div style="margin:5% auto; width: 70%;">
    <div class="panel panel-info">
        <div class="panel-heading">图书信息</div>
        <div class="panel-body">
            <img style="height: 20%;height: 20%;" src="http://127.0.0.1/${product.imgurl}">
            <table align="center" class="table table-hover table-bordered" style="text-align: center">
                <tr>
                    <td>商品名称:${product.name}</td>
                </tr>

                <tr>
                    <td>商品价格:${product.price}</td>
                </tr>
                <tr>
                    <td>商品类别:${product.category}</td>
                </tr>
                <tr>
                    <td>商品总数量:${product.pnum}</td>
                </tr>
                <tr>
                    <td>商品描述:${product.description}</td>
                </tr>

                <tr>
                    <td colspan="2" align="right">
                        <button type="button" class="btn btn-info" onclick="addProductToCart('${product.id}')">添加到购物车</button>
                </tr>
            </table>

        </div>
    </div>
</div>
<div class="div_foot">
    <div class="inner">
        <p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
    </div>
</div>
</body>
</html>
