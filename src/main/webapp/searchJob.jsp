<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>查询职位</title>
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        #UJ span.textbox {
            border: 0;
        }
    </style>
</head>
<body>
<table id="dg4" title="职位信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="findJob" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th data-options="field:'id',width:50">ID</th>
        <th data-options="field:'name',width:50">名称</th>
        <th data-options="field:'remark',width:50">备注</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;名称:&nbsp;</td>
            <td><input class="easyui-textbox"id="name" name="name" size="10"/></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchJob()"   style="width:80px;margin-left: 5px">查询</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteUser()"  style="width:80px;margin-left: 5px">删除</button></td>
        </tr>
    </table>
</div>

<div id="dlg" class="easyui-dialog" style="width: 400px;height: 300px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <div align="center" style="margin-top: 20px">
    <form id="UJ">
        <table>
            <tr>
                <td>I&nbsp;&nbsp;&nbsp;D：</td>
                <td><input class="easyui-textbox" id="id"  name="id" style="width:150px;height:30px;" data-options="readonly:true"></td>
            </tr>
            <tr>
                <td>名称：</td>
                <td><input class="easyui-textbox" id="name1"  name="name" style="width:150px;height:30px;" data-options="required:true"></td>
            </tr>
            <tr>
                <td>备注：</td>
                <td><input class="easyui-textbox" id="remark"  name="remark" style="width:150px;height:30px;"></td>
            </tr>
        </table>
    </form>
        <div style="margin-bottom:20px;margin-left: 30px" ></div>
        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="updateJob()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
        </div>
    </div>
</div>



<script>

    function searchJob() {
        var name=$("#tb #name").val();
        if(name==""){
            name=null;
        }
        $("#dg4").datagrid('load', {
            name:name
        });
    }

    function openDialog() {
        var selectedRows = $("#dg4").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg").dialog("open").dialog("setTitle", "编辑职位信息");
        $("#dlg").panel({
            closable:false
        });
        $("#UJ").form("load", row);
        $("#UJ #name1").textbox('textbox').css('border','1px solid #95b8e7');
        $("#UJ #remark").textbox('textbox').css('border','1px solid #95b8e7');
    }

    function deleteUser() {
        var role="${sessionScope.user.role.id}";
        if(role!="1"&&role!="2"){
            $.messager.alert("系统提示", "<font color=red>您非管理员，暂无此操作权限！！！</font>");
            return ;
        }
        var selectedRows = $("#dg4").datagrid('getSelections');
        if (selectedRows.length == 0) {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
        var strIds = [];
        for (var i = 0; i < selectedRows.length; i++) {
            strIds.push(selectedRows[i].id);
        }
        var ids = strIds.join(",");
        $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
            if (r) {
                $.ajax({
                    url:"deleteJob/"+ids,
                    type:"DELETE",
                    success:function (result) {
                        if(result.flag=="200"){
                            $.messager.alert("系统提示", "成功删除"+result.count+"条数据");
                            $('#dg4').datagrid('reload');
                        }else{
                            $.messager.alert("系统提示", "删除失败，请重试！！！");
                        }
                    }
                });
            }
        });
    }

    function updateJob() {
        var id=$("#UJ #id").val();
        var name=$("#UJ #name1").val();
        if(name==""){
            $.messager.alert("系统提示", "<font color=red>名称不能为空！！！！！</font>");
            return false;
        }
        $.ajax({
            url:"updateJob",
            data:$("#UJ").serialize(),
            type:"POST",
            success:function (result) {
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>编号为： <span>"+id+"</span>  的职位信息修改成功</font>");
                    closeDialog();
                    $('#dg4').datagrid('reload');
                }else{
                    $.messager.alert("系统提示", "<font color=red>修改失败，请重试！</font>");
                }
            }
        });
    }

    function closeDialog() {
        $('#UJ').form('clear');
        $("#dlg").dialog("close");
    }


</script>




</body>
</html>
