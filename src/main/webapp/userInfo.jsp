<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/12/16
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        span.textbox {
            border: 0;
        }
        /*span.textbox{*/
            /*border: ;*/
        /*}*/



    </style>
</head>
<body style="margin-left:10px; border: none;background: white">
<div style="margin:20px 0; border: none"></div>

<div class="easyui-panel" id="addUserForm" title="个人信息" style="width:100%;max-width:600px;padding:30px 60px;">
    <div align="center" style="margin-bottom:20px">
    <form id="ff" >
        <table>
            <tr style="margin-bottom:10px">
                <td>
                    用户账号：
                </td>
                <td>
                    <input class="easyui-textbox" id="number"  name="number"  style="width:150px;height:30px;"   data-options="required:true,readonly:true">
                </td>
            </tr>
            <tr style="margin-bottom:10px">
                <td>
                    用户名称：
                </td>
                <td>
                    <input class="easyui-textbox" id="username" name="username" style="width:150px;height:30px;" data-options="required:true,readonly:true">
                </td>
            </tr>
            <tr style="margin-bottom:10px">
                <td>
                    手机号码：
                </td>
                <td>
                    <input class="easyui-textbox" id="phone" name="phone" style="width:150px;height:30px;" data-options="required:true">
                </td>
            </tr>
            <tr style="margin-bottom:10px">
                <td>
                    角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：
                </td>
                <td>
                    <input class="easyui-textbox" id="role_1" name="role_1" style="width:150px;height:30px;" data-options="required:true,readonly:true">
                    <%--<select class="easyui-combobox"   id="status" name="status" editable="false" panelHeight="auto" style="width:100px;height:30px;"--%>
                            <%--data-options="valueField:'id',textField:'name',url:'allRole',readonly:true">--%>
                    <%--</select>--%>
                    <input  id="status" name="status" style="width:150px;height:30px;" type="text" hidden>
                </td>
            </tr>
            <tr style="margin-bottom:10px">
                <td>
                    创建日期：
                </td>
                <td>
                    <input class="easyui-textbox" id="date" name="date" style="width:150px;height:30px;" data-options="required:true,readonly:true">
                </td>
            </tr>
            <tr style="margin-bottom:10px">
                <td>
                    备 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：
                </td>
                <td>
                    <input class="easyui-textbox" id="remark" name="remark" multiline="true" style="width:150px;;height:50px;"data-options="" >
                </td>
            </tr>
        </table>
    </form>
    </div>

    <div align="center">
        <button type="button" id="edit" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="showButton()" style="width:80px">编辑</button>
        <button type="button" id="save" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="updateUser()" style="width:80px">保存</button>
        <button type="button" id="cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="cancelEdit()" style="width:80px">取消</button>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        hiddenButton();
        var number="${sessionScope.user.number}";
        $.ajax({
            url:"finNumber",
            data:"number="+number,
            type:"GET",
            success:function (result) {
                if(result.flag=="100"){
                    showData(result.user);
                }else{
                    // $.messager.alert("系统提示", "<font color=red>服务器发生错误！！！</font>");
                    var title='错误提示';
                    var msg='数据错误，正在进行退出页面，请重新登录！';
                    var time='2000';
                    showMessage(title,msg,time);
                    setTimeout("turnToIndex()","2500");
                }
            },
            error:function () {
                $.messager.alert("系统提示", "<font color=red>连接超时，请关闭页面重试！！</font>");
            }

        });
    });


    function updateUser() {
        var username = $("#username").textbox("getValue");
        if(username==""){
            $.messager.alert("系统提示", "<font color=red>用户名不能为空！</font>");
            return false;
        }
        var phone=$("#phone").textbox("getValue");
        var regPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(!regPhone.test(phone)){
            $.messager.alert("系统提示", "<font color=red>请输入有效的手机号码</font>");
            return false;
        }

        $.ajax({
            url:"updateUser",
            data:$("#ff").serialize(),
            type:"POST",
            success:function (result) {
                if(result.flag=="200"){
                    var title='消息提示';
                    var msg='修改成功，用户名修改在下次登录时生效';
                    var time='10000';
                    showMessage(title,msg,time);
                    hiddenButton();
                }else {
                    var title='消息提示';
                    var msg='修改失败！！';
                    var time='2000';
                    showMessage(title,msg,time);
                }


            },
            error:function () {
                var title='消息提示';
                var msg='服务器请求超时，请重试！！';
                var time='2000';
                showMessage(title,msg,time);
            }
        });
    }


    function showData(data) {
        $("#number").textbox("setValue",data.number);
        $("#username").textbox("setValue",data.username);
        $("#phone").textbox("setValue",data.phone);
        $("#role_1").textbox("setValue",data.role.name);
        $("#status").val(data.status);
        var date = timeStamp2String(data.createdate);
        $("#date").textbox("setValue",date);
        $("#remark").textbox("setValue",data.remark);
    }

    function hiddenButton() {
        $("#phone").textbox({readonly:true});
        $("#remark").textbox({readonly:true});
        $("#username").textbox({readonly:true});
        $("#edit").show();
        $("#save").hide();
        $("#cancel").hide();
    }

    function showButton() {
        $("#username").textbox({readonly:false});
        $("#phone").textbox({readonly:false});
        $("#remark").textbox({readonly:false});
        $("#username").textbox('textbox').css('border','1px solid #95b8e7');
        $("#phone").textbox('textbox').css('border','1px solid #95b8e7');
        $("#remark").textbox('textbox').css('border','1px solid #95b8e7');
        $("#edit").hide();
        $("#save").show();
        $("#cancel").show();
    }


    function cancelEdit() {
        javascript:location.reload();
    }

    function timeStamp2String(time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();

        return year + "-" + month + "-" + date;
    }


    function turnToIndex() {
        window.location.href="<%request.getContextPath();%>/exit";
    }


    function showMessage(title,msg,time){
        $.messager.show({
            title:title,
            msg:msg,
            showType:'fade',
            timeout:time,
            style:{
                right:'',
                bottom:''
            }
        });
    }

</script>



</body>
</html>
