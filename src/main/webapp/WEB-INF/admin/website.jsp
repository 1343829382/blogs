<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/5
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Document</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <style>
        .sys-container legend {
            padding: 10px;
        }

        .sys-container .input-group {
            margin: 10px;
        }

        .sys-container textarea {
            height: 100px;
            overflow-y: scroll;
        }
    </style>
</head>

<body>
<div class="container sys-container">
    <div class="panel panel-default">
            <fieldset>
                <legend>系统设置</legend>
            </fieldset>
            <input type="hidden" id="id" name="id" value="${website.id}">
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon1">网站标题</span>
                <input type="text" id="title" name="title" class="form-control" value="${website.title}" aria-describedby="sizing-addon2">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon2">关&nbsp;键&nbsp;&nbsp;词</span>
                <input type="text" id="antistop" name="antistop" class="form-control" value="${website.antistop}" aria-describedby="sizing-addon2">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon3">网站描述</span>
                <input type="text" id="relate" name="relate" class="form-control" value="${website.relate}" aria-describedby="sizing-addon2">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon4">站 长Q Q</span>
                <input type="text" id="qq" name="qq" class="form-control" value="${website.qq}"  aria-describedby="sizing-addon2">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon6">弹窗公告</span>
                <textarea name="publica" id="publica" class="form-control">${website.publica}</textarea>
            </div>
            <div class="input-group">
                <button type="button" class="btn btn-primary" onclick="update()">保存</button>
            </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script>
    function update() {
        var id = $("#id").val();
        var title = $("#title").val();
        var antistop = $("#antistop").val();
        var relate = $("#relate").val();
        var qq = $("#qq").val();
        var publica = $("#publica").val();

        $.ajax({
            type:"post",
            url:"${ctx}/admin/website/update",
            dataType:"json",
            data:{
                id:id,
                title:title,
                antistop:antistop,
                relate:relate,
                qq:qq,
                publica:publica
            },
            success:function (date) {
                if(date.code == 1){
                    window.location.href="${ctx}/admin/website/getAll"
                    alert("修改成功!");
                }else {
                    alert("修改失败!");

                }
            }
        });
    }
</script>
