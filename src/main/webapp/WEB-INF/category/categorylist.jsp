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
                    <form class="layui-form layui-col-space5" action="/admin/category/like" method="post">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="请输入内容" name="typename" id="typename">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" type="submit"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
<%--                    <button class="layui-btn" onclick="xadmin.open('添加分类','/admin/category/myadd',455,300)"><i class="layui-icon"></i>添加</button>--%>
                    <a class="layui-btn" href="/admin/category/myadd">添加</a>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th style="text-align: center;">ID</th>
                            <th style="text-align: center;">类名</th>
                            <th style="text-align: center;">序号</th>
                            <th style="text-align: center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.list}" var="user">
                            <tr>
                                <td style="text-align: center;">${user.id}</td>
                                <td style="text-align: center;">${user.typename}</td>
                                <td style="text-align: center;">${user.orderno}</td>

                                <td style="text-align: center;">
                                    <a style="margin: 0 20px;" title="编辑" href="/admin/category/upda/${user.id}">
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
                            <a <c:if test="${page.pageNum-1<1}">class="layui-btn-disabled"</c:if> class="prev" href="/admin/category/list?cp=${page.pageNum-1}">&lt;&lt;</a>
                            <!--循环分页-->
                            <c:forEach begin="1" end="${page.pages}" var="n">
                                <a class="num" href="/admin/category/list?cp=${n}">${n}</a>
                            </c:forEach>
                            <!--下一页-->
                            <a <c:if test="${page.pageNum+1>page.pages}">class="layui-btn-disabled"</c:if> class="next" href="/admin/category/list?cp=${page.pageNum+1}">&gt;&gt;</a>
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
                window.location.href="${ctx}/admin/category/delete/" + id
            }
    }

</script>
</html>