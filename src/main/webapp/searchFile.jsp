<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>文件下载</title>
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<table id="dg4" title="文件信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="findFile" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th data-options="field:'id',width:50">文件编号</th>
        <th data-options="field:'number',width:100">上传人编号</th>
        <th data-options="field:'username',width:100">上传人</th>
        <th data-options="field:'described',width:200">描述</th>
        <th data-options="field:'createdate',width:100">上传时间</th>
        <th data-options="field:'remark',width:100,formatter:createDo">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;上传人:&nbsp;</td>
            <td><input class="easyui-textbox"id="username" name="username" size="15"/></td>
            <td>&nbsp;描述:&nbsp;</td>
            <td><input class="easyui-textbox"id="described" name="described" size="30"/></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchFile()"   style="width:80px;margin-left: 5px">查询</button></td>
        </tr>
    </table>
</div>

<script type="text/javascript">

    var role ="${sessionScope.user.status}";
    //alert(role);
    function createDo(val,row) {
        var id = row.id;
        var btn="<button class=\"easyui-linkbutton\"  data-options=\"iconCls:'icon-upload'\" onclick=\"downFile("+id+")\" style=\"width:60px;margin-left: 10px\">下载</button>";

        if(role=="1"||role=="2"){
            btn+="<button class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-cancel'\" onclick=\"deleteFile("+id+")\" style=\"width:60px;margin-left: 10px\">删除</button>";

        }
        return btn;
    }
    // $.parser.parse('#remark');
    function downFile(id) {
        window.location.href="downFile?id="+id;
    }

    function deleteFile(id) {
        $.messager.confirm("系统提示", "您确认要删掉编号为：<font color=red>" +id+ "</font>的文件吗？", function (r) {
                    if(r){
                        $.ajax({
                            url:"deleteFile/"+id,
                            type:"DELETE",
                            success:function (result) {
                                if(result.flag=="200"){
                                    $.messager.alert("系统提示", "删除成功！！！");
                                    $('#dg4').datagrid('reload');
                                }else{
                                    $.messager.alert("系统提示", "删除失败！！！");
                                }
                            }
                        });
                    }
                }
            );

    }

    function searchFile() {
        var username = $("#username").val();
        var described=$("#described").val();
        if(username==''||username==""){
            username=null;
        }
        if(described==''||described==""){
            described=null;
        }
        $("#dg4").datagrid('load', {
            username:username,
            described:described
        });
    }

</script>
</body>
</html>
