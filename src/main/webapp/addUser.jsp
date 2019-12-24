<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加用户</title>
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
<div class="easyui-panel" id="addUserForm" title="添加用户" style="width:100%;max-width:600px;padding:30px 60px;">
    <form id="ff" >
        <div style="margin-bottom:20px;margin-left:30px" >
            用户账号：<input class="easyui-textbox" id="number"  name="number" style="width:120px;height:30px;" required="required" data-options="events:{blur:checkNumber},required:true">
            &nbsp;&nbsp;&nbsp;&nbsp;
            用户名称：<input class="easyui-textbox" id="username" name="username" style="width:120px;height:30px;" data-options="required:true">
        </div>
        <div style="margin-bottom:20px;margin-left:30px">
            密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input class="easyui-passwordbox" id="password" name="password" style="width:120px;height:30px;" data-options="required:true,validType:'password'">
            &nbsp;&nbsp;&nbsp;&nbsp;
            确认密码：<input class="easyui-passwordbox" id="ensurePassword" name="ensurePassword" style="width:120px;height:30px;" data-options="required:true,validType:'password'">
        </div>
        <div style="margin-bottom:20px;margin-left:30px">
            手机号码：<input class="easyui-textbox" id="phone" name="phone" style="width:120px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;&nbsp;
            角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：<select class="easyui-combobox"   id="status" name="status" editable="false" panelHeight="auto" style="width:120px;height:30px;"
                                                                       data-options="valueField:'id',textField:'name',url:'allRole'">
        </select>
        </div>
        <div style="margin-bottom:20px;margin-left: 30px" >
            备 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<input class="easyui-textbox" id="remark" multiline="true" name="remark" style="width:120px;;height:60px;" >
        </div>

    <div style="text-align:center;padding:5px 0">
        <button type="button" class="easyui-linkbutton" id="saveUser" data-options="iconCls:'icon-add'"  style="width:80px">添加</button>
        <%--<input type="button" class="easyui-linkbutton" data-options="iconCls:'icon-add'" value="添加" name="添加" style="width:80px">--%>
        <button class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="clearForm()" style="width:80px">重置</button>
    </div>

    </form>
</div>
<script type="text/javascript">



    // $('#number').textbox({
    //     onChange: function (value) {
    //         // var number=$("#number").val();
    //         var number=value;
    //         alert(number);
    //         if(number==""){
    //             $.messager.alert("系统提示", "<font color=red>请输入账号！！！</font>");
    //             return false;
    //         }
    //         validateNumber(number);
    //     }
    // });

    // function validateNumber(number) {
    // var fun=function(){
    function checkNumber(e) {
        $("#number").textbox("setValue",$(this).val())
        var number = $("#number").textbox("getText");
        if(number==""){
            return false;
        }
        $.ajax({
            url:"finNumber",
            data:"number="+number,
            type:"GET",
            success:function (result) {
                //console.log(result);
                if(result.flag!="200") {//说明该账号可用
                    $.messager.alert("系统提示", "<font color=red>账号已存在，请勿重复注册！！</font>");
                    $('#number').textbox("setValue","");
                    return false;
                    // $("#saveUser").attr("ajax-va","success");
                }
               // }else{
               //      $("#saveUser").attr("ajax-va","error");
               //  }

            }
        });

    }


    $(document).on("click","#saveUser",function () {
    // function submitForm() {
        var number=$("#number").val();
        var username=$("#username").val();
        var password = $("#password").val();
        var ensurePassword = $("#ensurePassword").val();
        var phone=$("#phone").val();
        var status = $('#status').combobox("getValue");


        if(number==""){
            $.messager.alert("系统提示", "<font color=red>请输入账号！</font>");
            return false;
        }
        // if($("#saveUser").attr("ajax-va")=="error"){
        //     $.messager.alert("系统提示", "<font color=red>账号已存在，请勿重复注册！！</font>");
        //     //alert("账号已存在，请勿重复注册！！");
        //     return false;
        // }
        // $("#saveUser").removeAttr("ajax-va");


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
            url: "addUser",
            data: $("#ff").serialize(),
            type: "POST",
            success: function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>用户： <span>"+username+"</span>  添加成功</font>");
                    clearForm();
                }else {
                    $.messager.alert("系统提示", "<font color=red>用户：<span>"+username+"</span>添加失败，请重试！</font>");
                }
            }
        });
    });


    function clearForm(){
        // window.location.reload();
        $('#ff').form('clear');
    }




</script>
</body>
</html>
