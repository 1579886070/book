<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Web图书管理系统</title>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
</head>
<style type="text/css">
    .aa {
        border: 15px ridge #8c8c8c;

    }
</style>
<body>

<div class="site-wrapper">

    <div class="site-wrapper-inner">
        <div>
            <%@include file="/headerbookpage.jsp" %>
        </div>
        <div class="cover-container" style="margin-top: 40px;">


            <%--轮播图    --%>
            <div>
                <div id="carousel-example-generic" class="carousel slide aa" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="${pageContext.request.contextPath}/images/1.jpg">
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/2.jpeg">
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/3.jpg">
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/4.png">
                        </div>

                    </div>
                </div>
            </div>

            <%--图书显示面板    --%>
            <div class="panel panel-default">
                <div class="panel-heading"><h3>图书选购</h3></div>
                <div class="panel-body">

                    <c:forEach items="${productList}" var="p" varStatus="vs">
                        <div style="float: left; margin:40px;">
                        <h4>${p.name }</h4>
                        <img src="http://127.0.0.1/${p.imgurl}"
                                width="60px" height="55px"  />
                        <p>价格: ￥${p.price }</p>
                        <p>
                            <a href='${pageContext.request.contextPath}/product?method=findById&id=${p.id}'>点击购买</a>
                        </p>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <%--底部版权    --%>
            <div class="mastfoot">
                <div class="inner">
                    <p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
                </div>
            </div>

        </div>

    </div>

</div>
</body>
<script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
</html>