<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/9
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/xadmin.css">
    <script type="text/javascript" src="${ctx}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" action="/admin/category/add" method="post">
            <div class="layui-form-item">
                <label for="typename" class="layui-form-label">类名</label>
                <div class="layui-input-inline">
                    <input type="text" id="typename" name="typename" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="orderno" class="layui-form-label">
                    <span class="x-red">*</span>序号</label>
                <div class="layui-input-inline">
                    <input type="text" id="orderno" name="orderno" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">根据序号排序</div></div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <input class="layui-btn" type="submit" lay-filter="save" value="添加"></div>
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
</script>
