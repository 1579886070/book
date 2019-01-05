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
    <title>用户登陆</title>
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
<script type="text/javascript">
    function loginForm() {
        if ($("#inputname2").val() == "") {
            $("#show").html("账号不能为空");
            return false;
        }
        if ($("#inputPassword3").val() == "") {
            $("#show").html("密码不能为空");
            return false;
        }
        else {
            return true;
        }
    };

    /*记住用户名*/
    window.onload = function () {
        //从cookie中获取saveusername值,得到的是utf-8码
        var usernamevalue = "${cookie.saveusername.value}";

        //通过decodeURIComponent这个函数完成utf-8解码操作.
        document.getElementById("inputname2").value = window.decodeURIComponent(
            usernamevalue, "utf-8");
    };
</script>
<body>
<div>
    <%@include file="/header.jsp" %>
</div>

<div id="show"></div>
<div>
    ${requestScope["login.message"] }
</div>

<div style="margin:10% auto;max-width: 600px;">
    <form class="form-horizontal" action="${pageContext.request.contextPath}/user?method=login" method="post"
          onsubmit="return loginForm();">
        <div class="form-group">
            <label for="inputname2" class="col-sm-2 control-label">name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputname2" placeholder="name" name="name">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="checkbox" value="on"> Remember me
                    </label>
                    <label>
                        <a href="${pageContext.request.contextPath }/register.jsp">还没有账号？点击注册</a>
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">登陆</button>
            </div>
        </div>
    </form>
</div>

<div class="div_foot">
    <div class="inner">
        <p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
    </div>
</div>
</body>
</html>
