<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/12/16
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改密码</title>
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
<div class="easyui-panel" id="addUserForm" title="修改密码" style="width:100%;max-width:600px;padding:30px 60px;">
    <div align="center" style="margin-bottom:20px">
        <form id="ff">
            <table>
                <tr>
                    <td>
                        用户编号：
                    </td>
                    <td>
                        <input class="easyui-textbox" id="number"  name="number"  style="width:150px;height:30px;"data-options="required:true,readonly:true">
                    </td>
                </tr>
                <tr>
                    <td>
                        原&nbsp;密&nbsp;码：
                    </td>
                    <td>
                        <input class="easyui-passwordbox" id="oldPassword" name="oldPassword" style="width:150px;height:30px;" data-options="required:true,validType:'password'">
                    </td>
                </tr>
                <tr>
                    <td>
                        新&nbsp;密&nbsp;码：
                    </td>
                    <td>
                        <input class="easyui-passwordbox" id="password" name="password" style="width:150px;height:30px;" data-options="required:true,validType:'password'">
                    </td>
                </tr>
                <tr>
                    <td>
                        确认密码：
                    </td>
                    <td>
                        <input class="easyui-passwordbox" id="Password_1" name="Password_1" style="width:150px;height:30px;" data-options="required:true,validType:'password'">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div align="center">
        <button type="button" id="save" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="updatePw()" style="width:80px">保存</button>
        <button type="button" id="cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="init()" style="width:80px">取消</button>
    </div>
</div>

<script type="text/javascript">

    $(function () {
        init();
    });

    function init() {
        $('#ff').form('clear');
        var number = "${sessionScope.user.number}";
        $("#number").textbox("setValue",number);
    }

    function updatePw() {
        var number = "${sessionScope.user.number}";
        var oldPassword = $("#oldPassword").textbox("getValue");
        var password = $("#password").textbox("getValue");
        var ensurePassword = $("#Password_1").textbox("getValue");

        if(oldPassword==password){
            $.messager.alert("系统提示", "<font color=red>原密码和新密码不能一样！！！</font>");
            return false;
        }

        var regPass =  /(^[a-zA-Z0-9_-]{6,12}$)/;
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
        $.ajax({
            url:"finNumber",
            data:"number="+number,
            type:"GET",
            success:function (result) {
                if(result.flag=="100"){
                    if(oldPassword==result.user.password){
                        upload();
                    }else{
                        $.messager.alert("系统提示", "<font color=red>原密码错误，请重试！！！</font>");
                        $("#oldPassword").textbox("setValue","");
                    }
                }
            }
        });
    }


    function upload() {
        $.ajax({
            url:"updateUser",
            data:$("#ff").serialize(),
            type:"POST",
            success:function (result) {
                if(result.flag=="200"){
                    var title='消息提示';
                    var msg='修改成功，请重新登录！！！';
                    var time='2000';
                    showMessage(title,msg,time);
                    setTimeout("trunToExit()","2500");
                }
            }
        })
    }


    function showMessage(title,msg,time) {
        $.messager.show({
            title: title,
            msg: msg,
            showType: 'fade',
            timeout: time,
            style: {
                right: '',
                bottom: ''
            }
        });
    }
    function trunToExit() {
        parent.location.href="<%request.getContextPath();%>/exit";
    }
    function cancelEdit() {
        $('#ff').form('clear');
        init();
    }
</script>

</body>
</html>
