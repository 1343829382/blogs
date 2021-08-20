<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/9
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="${ctx}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="请输入QQ" name="qq" id="qq">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="请输入网站名称" name="name" id="name">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="请输入内容" name="address" id="address">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" type="button"  lay-submit="" lay-filter="sreach"  onclick="add()">添加</button>
                        </div>
                    </form>
                </div>
<%--                <div class="layui-card-header">--%>
<%--&lt;%&ndash;                    <button class="layui-btn" onclick="xadmin.open('添加分类','/admin/category/myadd',455,300)"><i class="layui-icon"></i>添加</button>&ndash;%&gt;--%>
<%--                     <a class="layui-btn" onclick="xadmin.open('添加','/admin/youlian/myadd',455,300)">添加</a>--%>
<%--                </div>--%>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th style="text-align: center;">ID</th>
                            <th style="text-align: center;">QQ</th>
                            <th style="text-align: center;">网站名称</th>
                            <th style="text-align: center;">地址</th>
                            <th style="text-align: center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="user">
                            <tr>
                                <td style="text-align: center;">${user.id}</td>
                                <td style="text-align: center;">${user.qq}</td>
                                <td style="text-align: center;">${user.name}</td>
                                <td style="text-align: center;"><a href="${user.address}">${user.address}</a></td>
                                <td style="text-align: center;">
                                    <a style="margin: 0 20px;" title="编辑" href="/admin/youlian/upda/${user.id}">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="删除"  href="javascript:dele(${user.id})">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <!--上一页-->
                            <a <c:if test="${pageInfo.pageNum-1<1}">class="layui-btn-disabled"</c:if> href="/admin/youlian/getAll?cp=${pageInfo.pageNum-1}">&lt;&lt;</a>
                            <!--循环分页-->
                            <c:forEach begin="1" end="${pageInfo.pages}" var="n">
                                <a class="num" href="/admin/youlian/getAll?cp=${n}">${n}</a>
                            </c:forEach>
                            <!--下一页-->
                            <a <c:if test="${pageInfo.pageNum+1>page.pages}">class="layui-btn-disabled"</c:if> href="/admin/youlian/getAll?cp=${pageInfo.pageNum+1}">&gt;&gt;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    function dele(id) {
            if(confirm("确定要删除吗？")){
                layer.msg('已删除!',{icon:1,time:3000});
                window.location.href="${ctx}/admin/youlian/delete/" + id
            }
    }
    function add() {
        var qq = $("#qq").val();
        var name = $("#name").val();
        var address = $("#address").val();

        $.ajax({
            type:"post",
            url:"${ctx}/admin/youlian/add",
            dataType:"json",
            data:{
                qq:qq,name:name,address:address
            },
            success:function (data) {
                if(data.code == 1){
                    alert("添加成功!");
                    window.location.href="${ctx}/admin/youlian/getAll";
                }else {
                    alert("添加失败!");
                }
            }
        });
    }
</script>
</html>