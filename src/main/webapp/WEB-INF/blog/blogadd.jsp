<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/12
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <%--    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/xadmin.css">
    <script type="text/javascript" src="${ctx}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/js/xadmin.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ctx}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label style="margin: -5px 0; font-size: 15px;" for="title" class="layui-form-label">
                    <span class="x-red"></span>标题</label>
                <div class="layui-input-inline">
                    <input style="width: 1000px;height: 35px;" type="text" id="title" name="title" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label style="margin: -5px 0; font-size: 15px;" for="keyword" class="layui-form-label">
                    <span class="x-red"></span>关键词</label>
                <div class="layui-input-inline">
                    <input style="width: 1000px; height: 35px;" type="text" id="keyword" name="keyword" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label style="margin: -4px 0; font-size: 15px;" class="layui-form-label">
                    <span class="x-red"></span>分类</label>
                <div class="layui-input-inline">
                    <select id="cid" name="cid" style="display: block;width: 200px;height: 35px">
                        <fc:forEach items="${list}" var="user">
                            <option value="${user.id}">${user.typename}</option>
                        </fc:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label style="margin: -5px 0; font-size: 15px;" for="editor" class="layui-form-label">
                    <span class="x-red"></span>内容</label>
                <div class="layui-input-inline">
                    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="" type="button" onclick="add()">增加</button></div>
        </form>
    </div>
</div>
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    function add() {
        var title = $("#title").val();
        var key = $("#keyword").val();
        var cid = $("#cid").val();
        var editor = $("#ueditor_textarea_editorValue").val();
console.log(editor);
        $.ajax({
           type:"post",
           url:"${ctx}/admin/blog/add",
           dataType:"json",
           data:{
               title:title,keyword:key,content:editor,cid:cid
           },
            success:function (data) {

                if(data.code == 1){
                    window.location.href="${ctx}/admin/blog/getAll";
                    alert("添加成功!");
                }else {
                    alert("添加失败!")
                }
            }
        });
    }
</script>
</body>

</html>
