<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/10
  Time: 9:25
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
    <title>支付订单</title>
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
    <form action="${pageContext.request.contextPath}/onlinePay"
          method="post">
        订单号：<INPUT TYPE="text" NAME="orderid" value="${param.id}" readonly="readonly"><br/>
        支付金额：<INPUT TYPE="text" NAME="money" value="${param.money}"
                    readonly="readonly">元
        <div class="divBank">
            <div style="margin-top: 2%"><span class="label label-info">请选择网上银行</span></div>
            <div style="margin-left: 20px;">
                <div style="margin-bottom: 20px;">
                    <input id="ICBC-NET-B2C" type="radio" name="yh"
                           value="ICBC-NET-B2C" checked="checked"/> <img
                        name="ICBC-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/icbc.bmp'/>"/> <input
                        id="CMBCHINA-NET-B2C" type="radio" name="yh"
                        value="CMBCHINA-NET-B2C"/> <img name="CMBCHINA-NET-B2C"
                                                        align="middle" src="<c:url value='/bank_img/cmb.bmp'/>"/> <input
                        id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C"/> <img
                        name="ABC-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/abc.bmp'/>"/> <input
                        id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C"/> <img
                        name="CCB-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/ccb.bmp'/>"/>
                </div>
                <div style="margin-bottom: 20px;">
                    <input id="BCCB-NET-B2C" type="radio" name="yh"
                           value="BCCB-NET-B2C"/> <img name="BCCB-NET-B2C" align="middle"
                                                       src="<c:url value='/bank_img/bj.bmp'/>"/> <input
                        id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C"/>
                    <img name="BOCO-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/bcc.bmp'/>"/> <input
                        id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C"/> <img
                        name="CIB-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/cib.bmp'/>"/> <input
                        id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C"/>
                    <img name="NJCB-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/nanjing.bmp'/>"/>
                </div>
                <div style="margin-bottom: 20px;">
                    <input id="CMBC-NET-B2C" type="radio" name="yh"
                           value="CMBC-NET-B2C"/> <img name="CMBC-NET-B2C" align="middle"
                                                       src="<c:url value='/bank_img/cmbc.bmp'/>"/> <input
                        id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C"/> <img
                        name="CEB-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/guangda.bmp'/>"/> <input
                        id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C"/> <img
                        name="BOC-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/bc.bmp'/>"/> <input
                        id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET"/>
                    <img name="PINGANBANK-NET" align="middle"
                         src="<c:url value='/bank_img/pingan.bmp'/>"/>
                </div>
                <div style="margin-bottom: 20px;">
                    <input id="CBHB-NET-B2C" type="radio" name="yh"
                           value="CBHB-NET-B2C"/> <img name="CBHB-NET-B2C" align="middle"
                                                       src="<c:url value='/bank_img/bh.bmp'/>"/> <input
                        id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C"/>
                    <img name="HKBEA-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/dy.bmp'/>"/> <input
                        id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C"/>
                    <img name="NBCB-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/ningbo.bmp'/>"/> <input
                        id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C"/>
                    <img name="ECITIC-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/zx.bmp'/>"/>
                </div>
                <div style="margin-bottom: 20px;">
                    <input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C"/>
                    <img name="SDB-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/sfz.bmp'/>"/> <input
                        id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C"/> <img
                        name="GDB-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/gf.bmp'/>"/> <input
                        id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C"/> <img
                        name="SHB-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/sh.bmp'/>"/> <input
                        id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C"/>
                    <img name="SPDB-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/shpd.bmp'/>"/>
                </div>
                <div style="margin-bottom: 20px;">
                    <input id="POST-NET-B2C" type="radio" name="yh"
                           value="POST-NET-B2C"/> <img name="POST-NET-B2C" align="middle"
                                                       src="<c:url value='/bank_img/post.bmp'/>"/> <input
                        id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C"/>
                    <img name="BJRCB-NET-B2C" align="middle"
                         src="<c:url value='/bank_img/beijingnongshang.bmp'/>"/> <input
                        id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C"/> <img
                        name="HXB-NET-B2C" align="middle"
                        src="<c:url value='/bank_img/hx.bmp'/>"/> <input id="CZ-NET-B2C"
                                                                         type="radio" name="yh" value="CZ-NET-B2C"/>
                    <img
                            name="CZ-NET-B2C" align="middle"
                            src="<c:url value='/bank_img/zheshang.bmp'/>"/>
                </div>
            </div>
            <div style="margin: 40px;">
                <INPUT TYPE="submit" class="btn btn-info" value="确定支付">
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
