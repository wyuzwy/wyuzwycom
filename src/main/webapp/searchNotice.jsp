<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<html>
<head>
    <title>查询公告</title>
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>

<table id="dg" title="公告信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="findNotice" fit="true" toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th data-options="field:'id',width:20" >ID</th>
        <th data-options="field:'name',width:80">公告名称</th>
        <th data-options="field:'title',width:80">公告标题</th>
        <th data-options="field:'content',width:200,formatter:htmlToText">内容</th>
        <th data-options="field:'remark',width:80">发布时间</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center">
        <table style="margin-top: 10px">
            <tr>
                <td>&nbsp;名称:&nbsp;</td>
                <td><input class="easyui-textbox" id="name1" name="name" size="10"></td>
                <td>&nbsp;标题:&nbsp;</td>
                <td><input class="easyui-textbox" id="title1" name="title" size="10"></td>
                <td><button class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px;margin-left: 5px">搜索</button></td>
                <td><button class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="noticeDetails()" style="width:80px;margin-left: 5px">详情</button></td>
                <td><button class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDiv()" style="width:80px;margin-left: 5px">修改</button></td>
                <td><button class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteNotice()" style="width:80px;margin-left: 5px">删除</button></td>
            </tr>
        </table>
    <div style="margin-bottom:10px"></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 900px;height: 510px;padding: 10px 20px" data-options="modal:true"
     closed="true" buttons="#dlg-buttons" >
    <form id="example">
            <div hidden>
                公告ID: <input class="easyui-textbox" id="id" name="id" style="width:200px;height:20px;" data-options="required:true">
            </div>
            <div style="margin-top: 5px;margin-left: 5px">
                公告名称： <input class="easyui-textbox" id="name" name="name" style="width:200px;height:20px;" data-options="required:true">
            </div>

            <div style="margin-top: 5px;margin-left: 5px">
                公告标题： <input class="easyui-textbox" id="title" name="title" style="width:200px;height:20px;" data-options="required:true">
            </div>

            <div style="margin-top: 5px;margin-left: 5px">
                <textarea id="content" name="content" cols="100" rows="8" style="width:700px;height: 300px; visibility: hidden" ><%=htmlspecialchars(htmlData)%></textarea>
            </div>
            <%--<div style="margin-top: 5px;margin-left: 5px">--%>
            <%--备注：<input class="easyui-textbox" name="remark" style="width:200px;height:20px;" >--%>
            <%--</div>--%>
        <div  style="margin-top: 30px;margin-left: 38%">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateNotice()" iconCls="icon-ok">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()" iconCls="icon-cancel">关闭</a>
        </div>
    </form>
</div>
<%--<div id="dlg-buttons" style="margin-top: 30px;margin-left: 38%">--%>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveNotice()" iconCls="icon-ok">保存</a>--%>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()" iconCls="icon-cancel">关闭</a>--%>
<%--</div>--%>


<script>

    var articleDetailEditor;
    var ontent="textarea[name=\"content\"]";//定义富文本编辑框要加载到该id的textarea


    //提交表单(支持模糊查询)
    function submitForm(){
        var name=$("#tb").find("#name1").val();
        var title=$("#tb").find("#title1").val();
        if(name==""){
            name=null;
        }
        if(title==""){
            title=null;
        }
        $('#dg').datagrid('load', {
            name:name,
            title:title
        });

    }

    //删除公告
    function deleteNotice() {
        var role="${sessionScope.user.role.id}";
        if(role!="1"&&role!="2"){
            $.messager.alert("系统提示", "<font color=red>您非管理员，暂无此操作权限！！！</font>");
            return ;
        }

        var selectedRows = $("#dg").datagrid('getSelections');
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
                    url:"deleteNotice/"+ids,
                    type:"DELETE",
                    success:function (result) {
                        if (result.flag=="200") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.count + "</font>条数据！");
                            $('#fn').form('clear');
                            $("#dg").datagrid('reload');
                        } else {
                            $.messager.alert("系统提示", "<font color=red>操作失败，请重试！！！</font>");
                        }
                    }
                });
            }
        });


    }

    //查看公告详情
    function noticeDetails() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要查看的数据！");
            return;
        }
        var id=selectedRows[0].id;
        window.open("http://localhost:8080/noticeDetailsById?id="+id,"_blank");


    }

    //打开隐藏的div，用于修改公告
    function openDiv() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];

        var id=row.id;
        $.ajax({
            url:"getNoticeById",
            data:"id="+id,
            type:"GET",
            success:function (result) {
                if(result.flag=="200"){
                    $("#dlg").dialog("open").dialog("setTitle", "编辑公告信息");
                    $("#dlg").panel({
                        closable:false
                    });
                    ArticleeditorCreat(ontent);
                    articleDetailEditor.html(row.content);
                    $("#example").form("load", result.row);
                }else{
                    $.messager.alert("系统提示", "<font color=red>该公告不存在，请刷新后再试！！！</font>");
                    //closeDialog();
                }
            }
        });

    }

    //将html的公告内容转成纯文本内容
    function htmlToText(val,row) {
        var test=val;
        test = test.replace(/(\n)/g, "");
        test = test.replace(/(\t)/g, "");
        test = test.replace(/(\r)/g, "");
        test = test.replace(/<\/?[^>]*>/g, "");
        test = test.replace(/\s*/g, "");
        return test;
    }


    //关闭显示的div
    function closeDialog(){
        $("#dlg").dialog("close");
        //KindEditor.instances[0].html("");
        articleDetailEditor.remove(ontent);
    }

    //提交修改后的数据
    function updateNotice(){
        articleDetailEditor.sync();//将富文本编辑框的内容同步到textarea文本框中
        var name=$("#example #name").val();
        if(name==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告名称！！！</font>");
            return false;
        }
        var title=$("#example #title").val();
        if(title==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告主题！！！</font>");
            return false;
        }
        var text= $("#example #content").val();
        if(text==""){
            $.messager.alert("系统提示", "<font color=red>请输入公告内容！！！</font>");
            return false;
        }
        $.ajax({
            url:"/updateNotice",
            data:$("#example").serialize(),
            type:"POST",
            success:function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>公告： <span>"+name+"</span>  修改成功</font>");
                    closeDialog();
                    $('#fn').form('clear');
                    $("#dg").datagrid('reload');
                }else{
                    $.messager.alert("系统提示", "<font color=red>公告：<span>"+name+"</span>修改失败，请重试！</font>");
                }
            }
        });

    }


    //在隐藏的div初始化富文本编辑框
    function ArticleeditorCreat(kedit){
        articleDetailEditor = KindEditor.create(kedit,{
            readonlyMode : false,   //只读模式
            cssPath : 'kindeditor/plugins/code/prettify.css',
            uploadJson : 'kindeditor/jsp/upload_json.jsp',
            fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                this.sync();  //同步
            },
            afterBlur:function(){
                this.sync();
            },
        });
    }
// function creatK(ontent) {
//     KindEditor.ready(function (K) {
//         editor1 = K.create(ontent, {
//             cssPath: 'kindeditor/plugins/code/prettify.css',
//             uploadJson: 'kindeditor/jsp/upload_json.jsp',
//             fileManagerJson: 'kindeditor/jsp/file_manager_json.jsp',
//             allowFileManager: true,
//             afterCreate: function () {
//                 var self = this;
//                 K.ctrl(document, 13, function () {
//                     self.sync();
//                     document.forms['example'].submit();
//                 });
//                 K.ctrl(self.edit.doc, 13, function () {
//                     self.sync();
//                     document.forms['example'].submit();
//                 });
//             }
//         });
//         prettyPrint();
//     });

</script>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>