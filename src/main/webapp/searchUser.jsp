<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/23
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户列表</title>

    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/datagrid-export.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="login_style/js/md5.js"></script>
    <style type="text/css">
        #ud span.textbox {
            border: 0;
        }
    </style>
</head>
<body>
<table id="dg4" title="用户信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="findUser" fit="true" toolbar="#tb" .>
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th data-options="field:'number',width:100">账号</th>
        <th data-options="field:'username',width:100">昵称</th>
        <th data-options="field:'password',width:100,formatter:formatMd5">密码</th>
        <th data-options="field:'phone',width:100">手机</th>
        <th data-options="field:'status',width:100,formatter:formatRole">角色</th>
        <th data-options="field:'createdate',width:100,formatter:timeStamp2String">注册时间</th>
        <th data-options="field:'remark',width:100">备注</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center" >
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;账号:&nbsp;</td>
            <td><input class="easyui-textbox" id="number" name="ID" size="10"/></td>
            <td>&nbsp;姓名:&nbsp;</td>
            <td><input class="easyui-textbox"id="username" name="name" size="10"/></td>
            <td>&nbsp;角色：&nbsp;</td>
            <td><select class="easyui-combobox"   id="status" name="status" editable="false" panelHeight="auto" style="width:100px"  size="60"
                                   data-options="valueField:'id',textField:'name',url:'allRole'">

                </select></td>

            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchUser()"   style="width:80px;margin-left: 5px">查询</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="printUser()"   style="width:80px;margin-left: 5px">导出</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>
            <td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteUser()"  style="width:80px;margin-left: 5px">删除</button></td>
        </tr>
    </table>
        <div style="margin-bottom:10px"></div>
</div>

<div id="dlg" class="easyui-dialog" data-options="modal:true"  style="width: 600px;height: 300px;padding: 10px 20px"
     closed="true" >
    <form id="ud">
        <table cellspacing="10px;">
            <tr>
                <td>用户编号：</td>
                <td><input class="easyui-textbox" id="number1"  name="number" style="width:120px;height:30px;" data-options="readonly:true"></td>
                <td>用户名称：</td>
                <td><input class="easyui-textbox" id="username1" name="username" style="width:120px;height:30px;" data-options="readonly:true"></td>
            </tr>
            <tr>
                <td>手机号码：</td>
                <td><input class="easyui-textbox" id="phone" name="phone" style="width:120px;height:30px;" data-options="readonly:true"></td>
                <td>角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</td>
                <td><select class="easyui-combobox"   id="status1" name="status" editable="false" panelHeight="auto" style="width:130px;height:30px;"
                            data-options="valueField:'id',textField:'name',url:'allRole'">
                </select></td>
            </tr>
            <tr>
                <td>备 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                <td><input class="easyui-textbox" id="remark" name="remark" style="width:120px;;height:30px;" data-options="readonly:true"></td>
            </tr>
        </table>
        <div  style="margin-top: 30px;margin-left: 38%">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateUser()" iconCls="icon-ok">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()" iconCls="icon-cancel">关闭</a>
        </div>
    </form>

</div>




<script>
    function searchUser() {
        var number = $('#number').val();
        var username=$('#username').val();
        var status = $('#status').combobox("getValue");
        // if(number==""){
        //     number=null;
        // }
        if(number =="") {
            number=null;
        }
        if(username==""){
            username=null;
        }
        $('#dg4').datagrid('load', {
            number: number,
            username: username,
            status: status
        });
    }

    function openDialog() {
        var selectedRows = $("#dg4").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];
        if(row.status=="1"){
            $.messager.alert("系统提示", "您不能对超级管理员进行操作！！！！");
            return;
        }
        $("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
        $("#dlg").panel({
            closable:false
        });
        $("#ud").form("load", row);
        $("#ud #ensurePassword").textbox("setValue",row.password);
        $("#ud #status1").textbox('textbox').css('border','1px solid #95b8e7');
        //$("#ud #ensurePassword").setValue(row.password);
    }



    function deleteUser() {
        var selectedRows = $("#dg4").datagrid('getSelections');
        if (selectedRows.length == 0) {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
        var strIds = [];
        for (var i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].status=="1"){
                $.messager.alert("系统提示", "<font color=red>不能删除超级管理员！！！</font>");
                return;
            }
            strIds.push(selectedRows[i].number);
        }
        var ids = strIds.join(",");
        $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
            if (r) {
                $.ajax({
                    url:"deleteUser/"+ids,
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



    function updateUser() {

        var username=$("#ud #username1").val();
        var password = $("#ud #password").val();
        var ensurePassword = $("#ud #ensurePassword").val();
        var phone=$("#ud #phone").val();
        var status = $('#ud #status1').combobox("getValue");
        if(username==""){
            $.messager.alert("系统提示", "<font color=red>用户名不能为空！！！！！</font>");
            return false;
        }
        var regPass = /(^[a-zA-Z0-9_-]{6,12}$)/;
        if(!regPass.test(password)){
            $.messager.alert("系统提示", "<font color=red>密码必须为6-12位英文和数字的组合！</font>");
            //alert("密码必须为6-12位英文和数字的组合！");
            return false;
        }
        if(password != ensurePassword){
            $.messager.alert("系统提示", "<font color=red>两次密码不正确，请重新输入！！！！</font>");
            //alert("两次密码不正确，请重新输入！！！！");
            return false;
        }
        var regPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(!regPhone.test(phone)){
            $.messager.alert("系统提示", "<font color=red>手机号码必须为11位数字！！</font>");
            //alert("手机号码必须为11位数字！！！");
            return false;
        }

        if(status=="0" || status==undefined ||status==null || status==""){
            $.messager.alert("系统提示", "<font color=red>请选择角色！！！</font>");
            //alert("请选择角色！！！");
            return false;
        }
        $.ajax({
            url: "updateUser",
            data: $("#ud").serialize(),
            type: "POST",
            success: function (result) {
                //console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>用户： <span>"+username+"</span>  修改成功</font>");
                    closeDialog();
                    $('#dg4').datagrid('reload');
                }else {
                    $.messager.alert("系统提示", "<font color=red>用户：<span>"+username+"</span>修改失败，请重试！</font>");
                }
            }
        });
    }


    function printUser() {//导出数据到excel
       $("#dg4").datagrid('toExcel','user.xls');
    }




    function closeDialog() {
        $('#ud').form('clear');
        $("#dlg").dialog("close");
    }





    function formatMd5(val,row) {
        return hex_md5(val);
    }


    function formatRole(val,row) {
        return row.role['name'];
    }


    function timeStamp2String(time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();

        return year + "-" + month + "-" + date;
    }
</script>
</body>
</html>
