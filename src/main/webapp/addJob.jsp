<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加职位</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin-left:10px; border: none;background: white">
<div style="margin:20px 0; border: none"></div>
<div class="easyui-panel" id="addUserForm" title="添加职位" style="width:100%;max-width:400px;padding:30px 60px;">
    <div align="center">
        <form id="aj" >
            <div style="margin-bottom:20px;margin-left:30px" >
                名称：<input class="easyui-textbox" id="name"  name="name" style="width:150px;height:30px;" data-options="required:true">
            </div>
            <div style="margin-bottom:20px;margin-left:30px" >
                备注：<input class="easyui-textbox" id="remark"  name="remark" style="width:150px;height:30px;">
            </div>
        </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="addJob()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="clearForm()" style="width:80px">重置</button>
        </div>
    </div>
</div>
<script>
    function addJob() {
        var name=$("#name").val();
        if(name==""){
            $.messager.alert("系统提示", "<font color=red>请输入名称！！！！</font>");
            return false;
        }
        $.ajax({
            url:"addJob",
            data:$("#aj").serialize(),
            type:"POST",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>职位： <span>"+name+"</span>  添加成功</font>");
                    clearForm();
                }else{
                    $.messager.alert("系统提示", "<font color=red>职位添加失败，请重试！</font>");
                }
            }
        });
    }

    function clearForm(){
        $('#aj').form('clear');
    }
</script>


</body>
</html>
