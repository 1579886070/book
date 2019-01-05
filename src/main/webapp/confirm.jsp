<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/10
  Time: 16:04
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
    <title>确认支付</title>
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">


</head>
<style type="text/css">
    body {
        margin: 30px;
        text-align: center;
    }
</style>
<body>
<div style="font-size: 20px;">
    <span class="glyphicon glyphicon-hand-left">
        <a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
    </span>
</div>
<div style="margin:5% auto;">
    <!-- 确认支付form -->
    <form action="https://www.yeepay.com/app-merchant-proxy/node"
          method="post">
        <h3>订单号：${p2_Order}<br><br>付款金额 ：${p3_Amt }元</h3>
        <input type="hidden" name="pd_FrpId" value="${pd_FrpId }" /> <input
            type="hidden" name="p0_Cmd" value="${p0_Cmd }" /> <input
            type="hidden" name="p1_MerId" value="${p1_MerId }" /> <input
            type="hidden" name="p2_Order" value="${p2_Order }" /> <input
            type="hidden" name="p3_Amt" value="${p3_Amt }" /> <input
            type="hidden" name="p4_Cur" value="${p4_Cur }" /> <input
            type="hidden" name="p5_Pid" value="${p5_Pid }" /> <input
            type="hidden" name="p6_Pcat" value="${p6_Pcat }" /> <input
            type="hidden" name="p7_Pdesc" value="${p7_Pdesc }" /> <input
            type="hidden" name="p8_Url" value="${p8_Url }" /> <input
            type="hidden" name="p9_SAF" value="${p9_SAF }" /> <input
            type="hidden" name="pa_MP" value="${pa_MP }" /> <input type="hidden"
                                                                   name="pr_NeedResponse" value="${pr_NeedResponse }" /> <input
            type="hidden" name="hmac" value="${hmac }" />
        <div style="margin: 40px;">
        <input type="submit" class="btn btn-info" value="确认支付" />
        </div>
    </form>
</div>
</body>
</html>
