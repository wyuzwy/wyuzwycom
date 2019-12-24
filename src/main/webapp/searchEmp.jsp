<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>查询员工</title>
    <script type="text/javascript" src="login_style/js/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/datagrid-export.js"></script>
    <link rel="stylesheet" href="login_style/css/supersized.css">
    <link rel="stylesheet" href="login_style/css/login.css">
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<table id="dg4" title="员工信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true" url="findEmp" fit="true" toolbar="#tb">
    <%--findEmp--%>
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th data-options="field:'id',width:50" hidden >ID</th>
        <th data-options="field:'name',width:50">姓名</th>
        <th data-options="field:'sex',width:50,formatter:formatSex">性别</th>
        <th data-options="field:'deptId',width:50,formatter:formatDept">部门</th>
        <th data-options="field:'jobId',width:50,formatter:formatJob">职位</th>
        <th data-options="field:'cardId',width:100">身份证号</th>
        <th data-options="field:'brithday',width:100,formatter:timeStamp2String">出生日期</th>
        <th data-options="field:'address',width:100">地址</th>
        <th data-options="field:'postCode',width:50">邮政编码</th>
        <th data-options="field:'tel',width:50">电话号码</th>
        <th data-options="field:'phone',width:50">手机号码</th>
        <th data-options="field:'qqNum',width:50">QQ</th>
        <th data-options="field:'email',width:50">邮箱</th>
        <th data-options="field:'party',width:50">政治面貌</th>
        <th data-options="field:'race',width:50">民族</th>
        <th data-options="field:'education',width:50">文化程度</th>
        <th data-options="field:'speciality',width:50">专业</th>
    </tr>
    </thead>
</table>
<div id="tb" align="center">
    <table style="margin-top: 10px">
        <tr>
            <td>&nbsp;姓名:&nbsp;</td>
            <td><input class="easyui-textbox"id="name" name="name" size="10"/></td>
            <td>&nbsp;&nbsp;部门：&nbsp;</td>
            <td><select class="easyui-combobox"   id="deptId" name="deptId" editable="false" panelHeight="auto" style="width:100px"  size="60"
                                   data-options="valueField:'id',textField:'name',url:'allDept'">
                <%--<option value="0" selected>请选择...</option>--%>
            </select>
            </td>
            <td>&nbsp;&nbsp;职位：&nbsp;</td>
            <td><select class="easyui-combobox"   id="jobId" name="jobId" editable="false" panelHeight="auto" style="width:100px"  size="60"
                                   data-options="valueField:'id',textField:'name',url:'allJob'">
                <option value="0" selected>请选择...</option>
            </select></td>
            <td>&nbsp;&nbsp;性别：&nbsp;</td>
            <td><select class="easyui-combobox"   id="sex" name="jobId" editable="false" panelHeight="auto" style="width:100px"  size="60">
                <option value="0" selected>请选择...</option>
                <option value="1">男</option>
                <option value="2">女</option>
            </select></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchEmp()"  style="width:80px;margin-left: 5px">查询</button></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="printEmp()"  style="width:80px;margin-left: 5px">导出</button></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openDialog()"  style="width:80px;margin-left: 5px">编辑</button></td>
            <td><button  class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteEmp()"  style="width:80px;margin-left: 5px">删除</button></td>
        </tr>
    </table>
    <div style="margin-bottom:10px"></div>

</div>

<div id="dlg" class="easyui-dialog" style="width: 900px;height: 450px;padding: 10px 20px" data-options="modal:true"
     closed="true">
    <form id="UE">
        <input class="easyui-textbox" id="id"  name="id"   type="hidden">
        <div style="margin-bottom:20px;margin-left:30px" >
            姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input class="easyui-textbox" id="name1"  name="name" style="width:150px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;
            部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：<select class="easyui-combobox"   id="deptId1" name="deptId" editable="false" panelHeight="auto" style="width:150px;height:30px;"
                                                           data-options="valueField:'id',textField:'name',url:'allDept'">
        </select>
            &nbsp;&nbsp;&nbsp;
            职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：<select class="easyui-combobox"   id="jobId1" name="jobId" editable="false" panelHeight="auto" style="width:150px;height:30px;"
                                                           data-options="valueField:'id',textField:'name',url:'allJob'">
        </select>
        </div>
        <div style="margin-bottom:20px;margin-left:30px">
            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<select class="easyui-combobox"   id="sex1" name="sex" editable="false" panelHeight="auto" style="width:150px;height:30px;"  size="60">
            <option value="0" selected>请选择...</option>
            <option value="1">男</option>
            <option value="2">女</option>
        </select>
            &nbsp;&nbsp;&nbsp;
            出生日期：<input type="text" class="easyui-datebox" id="birthday" name="birthday" data-options="formatter:myformatter,parser:myparser" style="width:150px;height:30px;">
            &nbsp;&nbsp;&nbsp;
            手机号码：<input class="easyui-textbox" id="phone" name="phone" style="width:150px;height:30px;" data-options="required:true">

        </div>
        <div style="margin-bottom:20px;margin-left:30px">
            身份证号：<input class="easyui-textbox" id="cardId" name="cardId" style="width:270px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;&nbsp;
            地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<input class="easyui-textbox" id="address" name="address" style="width:270px;height:30px;" data-options="required:true">

        </div>
        <div style="margin-bottom:20px;margin-left: 30px" >
            邮 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input class="easyui-textbox" id="email" name="email" style="width:150px;;height:30px;" data-options="required:true" >
            &nbsp;&nbsp;&nbsp;
            邮政编码：<input class="easyui-textbox" id="postCode" name="postCode" style="width:150px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;
            电话号码：<input class="easyui-textbox" id="tel" name="tel" style="width:150px;;height:30px;">
        </div>
        <div style="margin-bottom:20px;margin-left: 30px" >
            Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q：<input class="easyui-textbox" id="qqNum" name="qqNum" style="width:150px;;height:30px;" >
            &nbsp;&nbsp;&nbsp;
            民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：
            <%--<input class="easyui-textbox" id="race" name="race" style="width:150px;;height:30px;" data-options="required:true">--%>
            <select class="easyui-combobox" id="race" name="race"   style="width:150px;;height:30px;" data-options="required:true">
                <option value="汉族">汉族</option>
                <option value="蒙古族">蒙古族</option>
                <option value="回族">回族</option>
                <option value="藏族">藏族</option>
                <option value="维吾尔族">维吾尔族</option>
                <option value="苗族">苗族</option>
                <option value="彝族">彝族</option>
                <option value="壮族">壮族</option>
                <option value="布依族">布依族</option>
                <option value="朝鲜族">朝鲜族</option>
                <option value="满族">满族</option>
                <option value="侗族">侗族</option>
                <option value="瑶族">瑶族</option>
                <option value="白族">白族</option>
                <option value="土家族">土家族</option>
                <option value="哈尼族">哈尼族</option>
                <option value="哈萨克族">哈萨克族</option>
                <option value="傣族">傣族</option>
                <option value="黎族">黎族</option>
                <option value="傈僳族">傈僳族</option>
                <option value="佤族">佤族</option>
                <option value="畲族">畲族</option>
                <option value="高山族">高山族</option>
                <option value="拉祜族">拉祜族</option>
                <option value="水族">水族</option>
                <option value="东乡族">东乡族</option>
                <option value="纳西族">纳西族</option>
                <option value="景颇族">景颇族</option>
                <option value="柯尔克孜族">柯尔克孜族</option>
                <option value="土族">土族</option>
                <option value="达斡尔族">达斡尔族</option>
                <option value="仫佬族">仫佬族</option>
                <option value="羌族">羌族</option>
                <option value="布朗族">布朗族</option>
                <option value="撒拉族">撒拉族</option>
                <option value="毛南族">毛南族</option>
                <option value="仡佬族">仡佬族</option>
                <option value="锡伯族">锡伯族</option>
                <option value="阿昌族">阿昌族</option>
                <option value="普米族">普米族</option>
                <option value="塔吉克族">塔吉克族</option>
                <option value="怒族">怒族</option>
                <option value="乌孜别克族">乌孜别克族</option>
                <option value="俄罗斯族">俄罗斯族</option>
                <option value="鄂温克族">鄂温克族</option>
                <option value="德昂族">德昂族</option>
                <option value="保安族">保安族</option>
                <option value="裕固族">裕固族</option>
                <option value="京族">京族</option>
                <option value="塔塔尔族">塔塔尔族</option>
                <option value="独龙族">独龙族</option>
                <option value="鄂伦春族">鄂伦春族</option>
                <option value="赫哲族">赫哲族</option>
                <option value="门巴族">门巴族</option>
                <option value="珞巴族">珞巴族</option>
                <option value="基诺族">基诺族</option>
            </select>
            &nbsp;&nbsp;&nbsp;
            政治面貌：<select class="easyui-combobox" id="party" name="party"   style="width:150px;;height:30px;" data-options="required:true">
                        <option value="中共党员">中共党员</option>
                        <option value="预备党员">预备党员</option>
                        <option value="共青团员">共青团员</option>
                        <option value="群众">群众</option>
                        <option value="其他">其他</option>
                        </select>
            <%--<input class="easyui-textbox" id="party" name="party" style="width:150px;;height:30px;" data-options="required:true">--%>
        </div>
        <div style="margin-bottom:20px;margin-left: 30px" >
            文化程度：
            <%--<input class="easyui-textbox" id="education" name="education" style="width:150px;;height:30px;"data-options="required:true" >--%>
            <select class="easyui-combobox" id="education" name="education"   style="width:150px;;height:30px;" data-options="required:true">
                <option value="博士">博士</option>
                <option value="硕士">硕士</option>
                <option value="本科">本科</option>
                <option value="大专">大专</option>
                <option value="高中">高中</option>
                <option value="初中">初中</option>
                <option value="小学">小学</option>
            </select>
            &nbsp;&nbsp;&nbsp;
            专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<input class="easyui-textbox" id="speciality" name="speciality" style="width:150px;;height:30px;" data-options="required:true">

        </div>

        <div style="text-align:center;padding:5px 0">
            <button type="button" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" onclick="updateEmp()"  style="width:80px">保存</button>
            <button  type="button" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeDialog()" style="width:80px">关闭</button>
        </div>
    </form>


</div>


<script type="text/javascript">

    function searchEmp() {
        var name = $('#name').val();
        var deptId = $('#deptId').combobox("getValue");
        var jobId = $('#jobId').combobox("getValue");
        var sex = $('#sex').combobox("getValue");
        // if(number==""){
        //     number=null;
        // }
        if(name =="") {
            name=null;
        }
        $('#dg4').datagrid('load', {
            name: name,
            deptId: deptId,
            jobId: jobId,
            sex:sex
        });
    }

    function updateEmp() {
        var name=$("#UE #name1").val();
        if(name==""){
            $.messager.alert("系统提示", "<font color=red>请输入姓名！！！</font>");
            return false;
        }
        var deptId= $('#UE #deptId1').combobox("getValue");
        if(deptId==0){
            $.messager.alert("系统提示", "<font color=red>部门信息不能为空！！！</font>");
            return false;
        }
        var jobId=$('#UE #jobId1').combobox("getValue");
        if(jobId==0){
            $.messager.alert("系统提示", "<font color=red>职位信息不能为空！！！</font>");
            return false;
        }
        var sex = $('#UE #sex1').combobox("getValue");
        if(sex==0){
            $.messager.alert("系统提示", "<font color=red>请选择性别！！！</font>");
            return false;
        }

        var birthday = $('#UE #birthday').datebox("getValue");
        if(birthday==""||birthday==null||birthday==undefined){
            $.messager.alert("系统提示", "<font color=red>请填写出生日期！！！</font>");
            return false;
        }
        var phone=$("#UE #phone").val();
        var resPhone= /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(phone==""){
            $.messager.alert("系统提示", "<font color=red>手机号码不能为空！！！</font>");
            return false;
        }else if(!resPhone.test(phone)){
            $.messager.alert("系统提示", "<font color=red>请输入有效的手机号码！！！</font>");
            return false;
        }
        var cardId=$("#UE #cardId").val();
        if(cardId==""){
            $.messager.alert("系统提示", "<font color=red>身份证号码不能为空！！！</font>");
            return false;
        }
        var address=$("#UE #address").val();
        if(address==""){
            $.messager.alert("系统提示", "<font color=red>地址不能为空！！！</font>");
            return false;
        }
        var email = $("#UE #email").val();
        var resEmail= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(email==""){
            $.messager.alert("系统提示", "<font color=red>邮箱不能为空！！！</font>");
            return false;
        }else if(!resEmail.test(email)){
            $.messager.alert("系统提示", "<font color=red>请输入有效的邮箱！！！</font>");
            return false;
        }

        var postCode = $("#UE #postCode").val();
        if(postCode==""){
            $.messager.alert("系统提示", "<font color=red>邮政编码不能为空！！！</font>");
            return false;
        }
        var race=$("#UE #race").val();
        if(race==""){
            $.messager.alert("系统提示", "<font color=red>民族信息不能为空！！！</font>");
            return false;
        }
        var party=$("#UE #party").val();
        if(party==""){
            $.messager.alert("系统提示", "<font color=red>政治面貌不能为空！！！</font>");
            return false;
        }
        var education= $("#UE #education").val();
        if(education==""){
            $.messager.alert("系统提示", "<font color=red>文化程度不能为空！！！</font>");
            return false;
        }
        var speciality= $("#UE #speciality").val();
        if(speciality==""){
            $.messager.alert("系统提示", "<font color=red>专业信息不能为空！！！</font>");
            return false;
        }
        $.ajax({
            url: "updateEmp",
            data: $("#UE").serialize(),
            type: "POST",
            success: function (result) {
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>员工： <span>"+name+"</span>  修改成功</font>");
                    closeDialog();
                    $('#dg4').datagrid('reload');
                }else{
                    $.messager.alert("系统提示", "<font color=red>员工：<span>"+name+"</span>修改失败，请重试！</font>");
                }
            }
        });


    }

    function deleteEmp() {
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
                    url:"deleteEmp/"+ids,
                    type:"DELETE",
                    success:function (result) {
                        if(result.flag==200){
                            $.messager.alert("系统提示", "成功删除"+result.count+"条数据");
                            $('#dg4').datagrid('reload');
                        }else{
                            $.messager.alert("系统提示", "操作失败，请重试！");
                        }
                    }
                });
            }
        });
    }





    function openDialog() {
        var selectedRows = $("#dg4").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg").dialog("open").dialog("setTitle", "编辑员工信息");
        $("#dlg").panel({
            closable:false
        });
        $("#UE").form("load", row);
        var time = timeStamp2String(row.brithday);
        $("#UE #birthday").datebox("setValue",time);
    }

    function closeDialog() {
        $('#UE').form('clear');
        $("#dlg").dialog("close");
    }






    function timeStamp2String(time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();

        return year + "-" + month + "-" + date;
    }

    function formatDept(val,row) {
        return row.dept['name'];
    }

    function formatJob(val,row) {
        return row.job['name'];
    }

    function formatSex(val, row) {
        if (val == 1) {
            return '男';
        } else {
            return '女';
        }
    }

    // function changTimeType(s) {
    //     if (!s) return new Date();
    //     var ss = (s.split('-'));
    //     var y = parseInt(ss[0],10);
    //     var m = parseInt(ss[1],10);
    //     var d = parseInt(ss[2],10);
    //     return m+"/"+d+"/"+y;
    // }



    function printEmp() {//导出数据到excel
        $("#dg4").datagrid('toExcel','employee.xls');
    }




    function myformatter(date){//easyui的日历格式的转换1
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){//easyui的日历格式的转换2
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
    }
</script>
</body>
</html>
