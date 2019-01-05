<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/5
  Time: 16:02
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
    <title>订单生成</title>
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">

</head>
<body>
<style type="text/css">
    body {
        margin: 30px;
        text-align: center;
    }
</style>
<div style="font-size: 20px;">
    <span class="glyphicon glyphicon-hand-left">
        <a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
    </span>

    <div style="margin:5% auto;">
        <form action="${pageContext.request.contextPath}/order"
              method="post">
            <input type="hidden" name="method" value="add">
            <table align="center" width="50%" border="1">
                <tr>
                    <td>收货地址</td>
                    <td><input type="text" name="receiverinfo">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <table border="1" width="50%" class="table table-bordered">
                            <tr>
                                <td>商品名称</td>
                                <td>单价</td>
                                <td>数量</td>
                            </tr>
                            <c:set value="0" var="all"/>
                            <c:forEach items="${shopping}" var="entry">
                                <tr>
                                    <td>${entry.key.name}</td>
                                    <td>${entry.key.price}</td>
                                    <td>${entry.value}</td>
                                </tr>
                                <c:set value="${entry.key.price*entry.value+all}" var="all"/>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>订单总价:${all}元 <input type="hidden" value="${all}"
                                            name="money"></td>
                    <td align="right"><input type="submit" value="生成订单">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="div_foot">
    <div class="inner">
        <p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
    </div>
</div>
</body>
</html>
