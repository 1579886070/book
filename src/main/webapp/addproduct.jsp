<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/9/23
  Time: 20:56
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
    <title>图书添加</title>
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
</head>
<style type="text/css">
    body {
        margin: 20px;
        background-color: #D6D6D6FF;
    }
</style>

<body>
<div>
    <%@include file="/header.jsp" %>
</div>

<div style="margin:1% auto;max-width: 600px;">
    <form action="${pageContext.request.contextPath}/addproduct" method="post" enctype="multipart/form-data">
        <table class="table table-bordered" style="table-layout: fixed;" width="100%" cellspacing="0" cellpadding="2">
            <tr>
                <td>商品名称</td>
                <td><input type="text" class="form-control" name="name"></td>
            </tr>
            <tr>
                <td>商品价格</td>
                <td><input type="text" class="form-control" name="price"></td>
            </tr>
            <tr>
                <td>商品分类</td>
                <td>
                    <select style="width: 50%;" name="category">
                        <option>--暂未分类--</option>
                        <option value="C">C</option>
                        <option value="C++">C++</option>
                        <option value="JAVA">JAVA</option>
                        <option value="PYTHON">Python</option>
                        <option value="GOLANG">Golang</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>商品数量</td>
                <td><input type="text" class="form-control" name="pnum"></td>
            </tr>
            <tr>
                <td>商品图片</td>
                <td><input type="file" class="form-control" name="imgurl"></td>
            </tr>
            <tr>
                <td>商品描述</td>
                <td>
                    <textarea style="resize:none; width: 50%;" name="description" rows="10" cols="12"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-sm" type="submit" value="添加商品">
                    <input class="btn btn-sm" type="reset" value="取消"></td>
            </tr>
        </table>
    </form>

</div>

<div class="div_foot">
    <div class="inner">
        <p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
    </div>
</div>
</body>
</html>
