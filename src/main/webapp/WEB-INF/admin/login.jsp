<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/5
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>后台登录-X-admin2.2</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/login.css">
    <link rel="stylesheet" href="${ctx}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message">x-admin2.0-管理登录</div>
    <center><p id="p" style="color: red; margin-top: 10px; font-size: 18px">${mag}</p></center>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" >
        <input name="username" placeholder="用户名" id="username"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" id="password" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <button lay-submit lay-filter="login" class="layui-btn layui-btn-danger layui-btn-radius" style="width:100%;" type="button" onclick="login()">登录</button>
        <hr class="hr20" >
    </form>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    function login() {
            var name = $("#username").val();
            var psw = $("#password").val();
            $.ajax({
               type:"post",
               url:"/admin/main",
               dataType:"json",
               data:{
                username:name,password:psw
               },
                success:function (data) {
                    if (data.code == 0){
                        window.location.href="/admin/management"
                        alert("登录成功!");
                    }else {
                        alert("用户名或密码错误!");
                    }
                }
            });
    }
</script>
</body>
</html>
