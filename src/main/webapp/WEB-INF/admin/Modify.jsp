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
        <form class="layui-form">
            <input type="hidden" id="id" name="id" value="${admin.id}">
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" disabled="" value="${admin.name}" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>旧密码</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_repass" value="${admin.password}" name="oldpass" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="password" class="layui-form-label">
                    <span class="x-red">*</span>新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" name="password" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div></div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" type="button" lay-filter="save" lay-submit="" onclick="xiug()">修改</button></div>
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    function xiug() {
        var id = $("#id").val();
        var psw = $("#password").val();

        $.ajax({
           type:"post",
           url:"${ctx}/admin/Modifypassword",
           dataType:"json",
            data:{
              id:id,password:psw
            },
            success:function (data) {
                if(data.code == 1){
                    window.location.href="${ctx}/admin/myModify"
                    alert("修改成功!");
                }else {
                    alert("修改失败!");
                }
            }
        });
    }
</script>
