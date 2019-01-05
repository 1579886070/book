<%--
  Created by IntelliJ IDEA.
  User: 爱生活爱技术
  Date: 2018/10/3
  Time: 20:06
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
    <title>购物车管理</title>
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/bookpagecss.css" rel="stylesheet">

    <script type="text/javascript">
        function delConfirm(e){
            var flag=window.confirm("确认清空商品吗");

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
            else {
                location.href="${pageContext.request.contextPath}/shopping?method=remove";
            }

        }

        function gotoorder(){

            location.href="${pageContext.request.contextPath}/order.jsp";
        }

        //id代表要修改的商品    count代表商品的数量
        function changeCount(id, count, max) {

            if (parseInt(count) < 0) {
                count = 1;
            }

            if (parseInt(count) > parseInt(max)) {
                count = max;
            }
            if(parseInt(count)==0){

                var flag=window.confirm("确认删除商品吗");
                if(!flag){
                    return ;
                }
            }
            location.href = "${pageContext.request.contextPath}/shopping?method=update&id=" + id
                + "&count=" + count;

        }

    </script>
</head>
<style type="text/css">
    body {
        margin: 30px;
        text-align: center;
    }
</style>

<body>
<div>
    <%@include file="/header.jsp" %>
</div>
<div style="margin:5% auto; width: 70%;">
    <div>
        <c:if test="${empty shopping}">
            <h2><font color="#8b0000">购物车中还无商品</font></h2>
        </c:if>

        <c:if test="${not empty shopping}">
            <h2><font color="#8b0000">我的购物车</font></h2>
            <table align="center" class="table table-hover table-bordered" style="text-align: center">
                <c:set var="all" value="0"/>

                <c:forEach items="${shopping}" var="shopping">
                    <tr>
                        <td>
                            名称:${shopping.key.name}
                        </td>
                        <td>
                            单价:${shopping.key.price}
                        </td>
                        <td>
                            总数:${shopping.key.pnum}
                        </td>
                        <td>
                            <input type="button" value="-"
                                   onclick="changeCount('${shopping.key.id }','${shopping.value-1}','${shopping.key.pnum}')">
                            <%--购买数量:${shopping.value}--%>
                            <input type='text' value="${shopping.value}"
                                   style="text-align:center" size="2" onblur="changeCount('${shopping.key.id}',this.value,'${shopping.key.pnum}')">
                            <input type="button" value='+'
                                   onclick="changeCount('${shopping.key.id}','${shopping.value+1}','${shopping.key.pnum }')">
                        </td>

                        <c:set var="all" value="${all+(shopping.key.price*shopping.value)}"/>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="right">总价:￥${all}元</td>
                </tr>

            </table>
            <button type="button" class="btn btn-info"  onclick="delConfirm(event)">清空购物车</button>
            <button type="button" class="btn btn-info" onclick="gotoorder();">我要结算
            </button>

        </c:if>
    </div>
</div>
<div class="div_foot">
    <div class="inner">
        <p>@2018- <a href="http://www.xioaxin12.xyz/" target="_blank">爱生活爱技术</a>, by 小信.</p>
    </div>
</div>
</body>
</html>
