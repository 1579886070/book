<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户注册</title>
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

<%--验证码点击刷新--%>
<script type="text/javascript">
    function change() {
        document.getElementById("im").src = "${pageContext.request.contextPath}/checkimg?time"
            + new Date().getTime();
    };

    function registerForm() {
        if($("#inputname").val()==""){
            $("#show").html("账号不能为空");
            return false;
        }
        if($("#inputPassword").val()==""){
            $("#show").html("密码不能为空");
            return false;
        }
        if($("#inputPassword2").val()==""){
            $("#show").html("确认密码不能为空");
            return false;
        }
        if($("#inputNickname").val()==""){
            $("#show").html("昵称不能为空");
            return false;
        }
        if($("#inputEmail").val()==""){
            $("#show").html("邮箱不能为空");
            return false;
        }
        if($("#inputVerify").val()==""){
            $("#show").html("验证码不能为空");
            return false;
        }
        if($("#inputPassword").val()!=($("#inputPassword2").val())){
            $("#show").html("两次密码不一致");
            return false;
        }
        else{
            return true;
        }
    };
</script>

<body>
<div>
    <%@include file="/header.jsp" %>
</div>
<div id="show"></div>
<div>
    ${requestScope["regist.message"] }
</div>
<div style="margin:10% auto;max-width: 600px;">
    <form class="form-horizontal" action="${pageContext.request.contextPath}/user?method=regist" method="post" onsubmit="return registerForm();">
        <div class="form-group">
            <label for="inputname" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputname" placeholder="name" name="name">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword2" class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword2" placeholder="Password" name="repassword">
            </div>
        </div>
        <div class="form-group">
            <label for="inputNickname" class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputNickname" placeholder="nickname" name="nickname">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail" placeholder="email" name="email">
            </div>
        </div>
        <div class="form-group">
            <label for="inputVerify" class="col-sm-2 control-label">验证码</label>
            <div class="col-sm-10">
                <input name="checkcode" type="text" class="form-control" id="inputVerify" style="width: 120px;float: left;">
                <img src='${pageContext.request.contextPath}/checkimg' id="im"
                     onclick="change();"><span id="checkcode_span"><a
                    href="javascript:void(0)" onclick="change();"><font
                    color="#8b0000" size="2">换一张</font>
					</a>
				</span>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">注册</button>
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
