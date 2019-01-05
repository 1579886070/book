<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/10
  Time: 20:41
  To change this template use File | Settings | File Templates.
  删除图书
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书删除</title>
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>

    <script type="text/javascript">
        function delConfirm(e){
            var flag=window.confirm("确认删除图书吗");

            if(!flag){
                //不删除商品
                //要想不删除商品，要阻止事件的默认行为执行.
                if(e&&e.preventDefault){
                    // e对象存在，preventDefault方法存在 ---- 火狐浏览器
                    e.preventDefault();
                }else{
                    // 不支持e对象，或者没有preventDefault方法 ---- IE
                    window.event.returnValue = false;
                }
            }

        }
    </script>
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
<div style="margin:5% auto; width: 70%;">
    <table align="center" class="table table-bordered">
        <tr>
            <td>图书编号</td>
            <td>图书名称</td>
            <td>图书分类</td>
            <td>图书价格</td>
            <td>图书操作</td>
        </tr>


        <c:forEach items="${productList}" var="productList">
            <tr>
                <td>${productList.id }</td>
                <td>${productList.name}</td>
                <td>${productList.category}</td>
                <td>${productList.price}</td>
                <td class="warning"><a onclick="delConfirm(event)"
                        href="${pageContext.request.contextPath}/product?method=delById&id=${productList.id}">删除图书</a>
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
