<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>

    <title>上传文件</title>
    <%--<script type="text/javascript" src="login_style/js/jquery-3.2.1.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body  style="margin-left:10px; border: none;background: white">

<div style="margin:20px 0; border: none"></div>
<div class="easyui-panel"  title="支持多文件上传" style="width:100%;max-width:600px;padding:30px 60px;">
    <form id="fileFrom" name="fileFrom"  enctype="multipart/form-data">
        <div style="margin-bottom:20px;margin-left:30px" >
            上&nbsp;&nbsp;传&nbsp;人：<input class="easyui-textbox" id="username" name="username" style="width:200px" data-options="readonly:true">
            <input class="easyui-textbox" id="number" name="number"  type="hidden">
        </div>
        <div style="margin-bottom:20px;margin-left:30px" >
            文件描述：<input class="easyui-textbox" id="described" name="described" style="width:200px">
        </div>
        <div style="margin-bottom:20px;margin-left:30px">
            <%--上传文件：<input   id="file" name="file"  type="file" multiple="true" style="width:200px">--%>
                上传文件：<input   class="easyui-filebox" id="file" name="file"  multiple="true" style="width:200px">
            <input class="easyui-textbox" id="url"  name="url"   type="hidden">
        </div>
        <div align="center" style="padding:5px 0">
            <button type="button" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="addFile()"  style="width:120px">确认上传</button>
            <button type="button" class="easyui-linkbutton" data-options="iconCls:'icon-clear'"  onclick="clearForm()"  style="width:120px;margin-left: 5px">重置</button>
        </div>
    </form>
</div>

<script type="text/javascript">
    var name = "${sessionScope.user.username}";
    var number = "${sessionScope.user.number}";
    $(function () {

        $("#fileFrom #username").textbox("setValue",name);

        $("#fileFrom #number").textbox("setValue",number);
        $('#file').filebox({
            buttonText: '选择文件'
        });
    });


    function addFile(){

        var described=$("#fileFrom #described").val();
        if(described ==""||described==null||described==undefined){
            $.messager.alert("系统提示", "请补充描述！！！");
            return false;
        }

        var file = $("#file").filebox("getValue");
        if (file==''||file=="" || file==undefined ||file==null){
            $.messager.alert("系统提示", "请上传文件!!!");
            return;
        }
        var formData = new FormData($("#fileFrom")[0]);
        $.ajax({
            url:"/addFile",
            type: "POST",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $("#file").filebox("setValue","");
                    $("#fileFrom #url").textbox("setValue",result.url);
                    uploadFile();
                }else{
                    $.messager.alert("系统提示", "文件上传出现错误了，请重试！！！");
                    return false;
                }

            },
            error:function () {
                alert("出错了");
            }

        });

    }


    function uploadFile() {
        $.ajax({
            url:"/uploadFile",
            data:$("#fileFrom").serialize(),
            type:"POST",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "添加文件成功！！！");
                    clearForm();
                }else{
                    $.messager.alert("系统提示", "添加失败，请重试！！！");
                }
            }
        });
    }

    function clearForm() {
        $("#fileFrom").form('clear');
        $("#fileFrom #username").textbox("setValue",name);
        $("#fileFrom #number").textbox("setValue",number);
        //$('#fileFrom').form('clear');
    }

</script>

</body>
</html>
