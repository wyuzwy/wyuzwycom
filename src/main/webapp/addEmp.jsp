<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/24
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加员工</title>
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
<div class="easyui-panel" id="addUserForm" title="添加员工" style="width:100%;max-width:900px;padding:30px 60px;">
    <form id="ff" align="center">
        <%--<table style="width:600px;">--%>
            <%--<tr style="width:700px;">--%>
                <%--<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>--%>
                <%--<td style="width:200px;"><input class="easyui-textbox" id="name"  name="name" data-options="required:true"></td>--%>

                <%--<td >部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：</td>--%>
                <%--<td style="width:200px;"><select class="easyui-combobox"   id="deptId" name="deptId" editable="false" panelHeight="auto"style="width:145px;height:30px;"--%>
                            <%--data-options="valueField:'id',textField:'name',url:'allRole'"></select>--%>
                <%--</td>--%>

                <%--<td >职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>--%>
                <%--<td style="width:200px;"><select class="easyui-combobox"   id="jobId" name="jobId" editable="false" panelHeight="auto"style="width:145px;height:30px;"--%>
                                                           <%--data-options="valueField:'id',textField:'name',url:'allRole'"></select>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr style="margin-bottom: 10px">--%>
                <%--<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>--%>
                <%--<td><select class="easyui-combobox"   id="sex" name="sex" editable="false" panelHeight="auto" style="width:145px;height:30px;"  size="60">--%>
                <%--<option value="0" selected>请选择...</option>--%>
                <%--<option value="1">男</option>--%>
                <%--<option value="2">女</option></select>--%>
                <%--</td>--%>
                <%--<td >出生日期：</td>--%>
                <%--<td ><input type="text" class="easyui-datebox" id="birthday" name="birthday" data-options="formatter:myformatter,parser:myparser" ></td>--%>
                <%--<td>手机号码：</td>--%>
                <%--<td><input class="easyui-textbox" id="phone" name="phone"  data-options="required:true"></td>--%>
            <%--</tr>--%>
            <%--<tr style="margin-bottom: 10px">--%>
                <%--<td>身份证号：</td>--%>
                <%--<td><input class="easyui-textbox" id="cardId" name="cardId"   data-options="required:true"></td>--%>
                <%--<td>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>--%>
                <%--<td><input class="easyui-textbox" id="address" name="address"  data-options="required:true"></td>--%>
            <%--</tr>--%>

            <%--<tr style="margin-bottom: 10px">--%>
                <%--<td>邮 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>--%>
                <%--<td><input class="easyui-textbox" id="email" name="email"  data-options="required:true" ></td>--%>
                <%--<td>邮政编码：</td>--%>
                <%--<td><input class="easyui-textbox" id="postCode" name="postCode"  data-options="required:true"></td>--%>
                <%--<td>电话号码：</td>--%>
                <%--<td><input class="easyui-textbox" id="tel" name="tel" ></td>--%>
            <%--</tr>--%>
            <%--<tr style="margin-bottom: 10px">--%>
                <%--<td>Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q：</td>--%>
                <%--<td><input class="easyui-textbox" id="qqNum" name="qqNum"  ></td>--%>
                <%--<td>民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>--%>
                <%--<td><input class="easyui-textbox" id="race" name="race"  data-options="required:true"></td>--%>
                <%--<td>政治面貌：</td>--%>
                <%--<td><input class="easyui-textbox" id="party" name="party"  data-options="required:true"></td>--%>
            <%--</tr>--%>
            <%--<tr style="margin-bottom: 10px">--%>
                <%--<td>文化程度：</td>--%>
                <%--<td ><input class="easyui-textbox" id="education" name="education" data-options="required:true" ></td>--%>
                <%--<td>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</td>--%>
                <%--<td><input class="easyui-textbox" id="speciality" name="speciality"  data-options="required:true"></td>--%>

            <%--</tr>--%>
        <%--</table>--%>
        <%--<div style="text-align:center;padding:5px 0">--%>
            <%--<button type="button" class="easyui-linkbutton" id="saveEmp" data-options="iconCls:'icon-add'"  style="width:80px">添加</button>--%>

            <%--<button class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearForm()" style="width:80px;margin-left: 5px">重置</button>--%>
        <%--</div>--%>






        <div style="margin-bottom:20px;" >
            姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input class="easyui-textbox" id="name"  name="name" style="width:150px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;
            部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：<select class="easyui-combobox"   id="deptId" name="deptId" editable="false" panelHeight="auto" style="width:150px;height:30px;"
                                                     data-options="valueField:'id',textField:'name',url:'allDept'">
        </select>
            &nbsp;&nbsp;&nbsp;
            职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：<select class="easyui-combobox"   id="jobId" name="jobId" editable="false" panelHeight="auto" style="width:150px;height:30px;"
                                                     data-options="valueField:'id',textField:'name',url:'allJob'">
        </select>
        </div>
        <div style="margin-bottom:20px;">
            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<select class="easyui-combobox"   id="sex" name="sex" editable="false" panelHeight="auto" style="width:150px;height:30px;"  size="60">
            <option value="0" selected>请选择...</option>
            <option value="1">男</option>
            <option value="2">女</option>
        </select>
            &nbsp;&nbsp;&nbsp;
            出生日期：<input type="text" class="easyui-datebox" id="birthday" name="birthday" data-options="formatter:myformatter,parser:myparser" style="width:150px;height:30px;">
            &nbsp;&nbsp;&nbsp;
            手机号码：<input class="easyui-textbox" id="phone" name="phone" style="width:150px;height:30px;" data-options="required:true">

        </div>
        <div style="margin-bottom:20px;">
            身份证号：<input class="easyui-textbox" id="cardId" name="cardId" style="width:270px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;&nbsp;
            地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<input class="easyui-textbox" id="address" name="address" style="width:270px;height:30px;" data-options="required:true">

        </div>
        <div style="margin-bottom:20px;" >
            邮 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input class="easyui-textbox" id="email" name="email" style="width:150px;;height:30px;" data-options="required:true" >
            &nbsp;&nbsp;&nbsp;
            邮政编码：<input class="easyui-textbox" id="postCode" name="postCode" style="width:150px;height:30px;" data-options="required:true">
            &nbsp;&nbsp;&nbsp;
            电话号码：<input class="easyui-textbox" id="tel" name="tel" style="width:150px;;height:30px;">
        </div>
        <div style="margin-bottom:20px;" >
            Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q：<input class="easyui-textbox" id="qqNum" name="qqNum" style="width:150px;height:30px;" >
            &nbsp;&nbsp;&nbsp;
            民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：
            <%--<input class="easyui-textbox" id="race" name="race" style="width:150px;;height:30px;" data-options="required:true">--%>
            <select class="easyui-combobox" id="race" name="race"   style="width:150px;;height:30px;" data-options="required:true">
                <option value="">请选择...</option>
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
                <option value="">请选择...</option>
                <option value="中共党员">中共党员</option>
                <option value="预备党员">预备党员</option>
                <option value="共青团员">共青团员</option>
                <option value="群众">群众</option>
                <option value="其他">其他</option>
            </select>
        </div>
        <div align="left" style="margin-bottom:20px;margin-left:30px" >
            文化程度：<select class="easyui-combobox" id="education" name="education"   style="width:150px;;height:30px;" data-options="required:true">
                <option value="">请选择...</option>
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
            <button type="button" class="easyui-linkbutton" id="saveEmp" data-options="iconCls:'icon-add'"  style="width:80px">添加</button>

            <button class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="clearForm()" style="width:80px">重置</button>
        </div>

    </form>
</div>


<script type="text/javascript">

    $(document).on("click","#saveEmp",function () {
        var name=$("#name").val();
        if(name==""){
            $.messager.alert("系统提示", "<font color=red>请输入姓名！！！</font>");
            return false;
        }
        var deptId= $('#deptId').combobox("getValue");
        if(deptId==0){
            $.messager.alert("系统提示", "<font color=red>部门信息不能为空！！！</font>");
            return false;
        }
        var jobId=$('#jobId').combobox("getValue");
        if(jobId==0){
            $.messager.alert("系统提示", "<font color=red>职位信息不能为空！！！</font>");
            return false;
        }
        var sex = $('#sex').combobox("getValue");
        if(sex==0){
            $.messager.alert("系统提示", "<font color=red>请选择性别！！！</font>");
            return false;
        }

        var birthday = $('#birthday').datebox("getValue");
        if(birthday==""||birthday==null||birthday==undefined){
            $.messager.alert("系统提示", "<font color=red>请填写出生日期！！！</font>");
            return false;
        }
        var phone=$("#phone").val();
        var resPhone= /^1(3|4|5|6|7|8|9)\d{9}$/;
        if(phone==""){
            $.messager.alert("系统提示", "<font color=red>手机号码不能为空！！！</font>");
            return false;
        }else if(!resPhone.test(phone)){
            $.messager.alert("系统提示", "<font color=red>请输入有效的手机号码！！！</font>");
            return false;
        }
        var cardId=$("#cardId").val();
        if(cardId==""){
            $.messager.alert("系统提示", "<font color=red>身份证号码不能为空！！！</font>");
            return false;
        }
        var address=$("#address").val();
        if(address==""){
            $.messager.alert("系统提示", "<font color=red>地址不能为空！！！</font>");
            return false;
        }
        var email = $("#email").val();
        var resEmail= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(email==""){
            $.messager.alert("系统提示", "<font color=red>邮箱不能为空！！！</font>");
            return false;
        }else if(!resEmail.test(email)){
            $.messager.alert("系统提示", "<font color=red>请输入有效的邮箱！！！</font>");
            return false;
        }

        var postCode = $("#postCode").val();
        if(postCode==""){
            $.messager.alert("系统提示", "<font color=red>邮政编码不能为空！！！</font>");
            return false;
        }
        var race=$("#race").val();
        if(race==""){
            $.messager.alert("系统提示", "<font color=red>民族信息不能为空！！！</font>");
            return false;
        }
        var party=$("#party").val();
        if(party==""){
            $.messager.alert("系统提示", "<font color=red>政治面貌不能为空！！！</font>");
            return false;
        }
        var education= $("#education").val();
        if(education==""){
            $.messager.alert("系统提示", "<font color=red>文化程度不能为空！！！</font>");
            return false;
        }
        var speciality= $("#speciality").val();

        if(speciality==""){
            $.messager.alert("系统提示", "<font color=red>专业信息不能为空！！！</font>");
            return false;
        }

        $.ajax({
            url: "addEmp",
            data: $("#ff").serialize(),
            type: "POST",
            success: function (result) {
                console.log(result);
                if(result.flag=="200"){
                    $.messager.alert("系统提示", "<font color=green>员工： <span>"+name+"</span>  添加成功</font>");
                    clearForm();
                }else{
                    $.messager.alert("系统提示", "<font color=red>员工：<span>"+name+"</span>添加失败，请重试！</font>");
                }
            }
        });


    });







    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){
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

    function clearForm(){
        $('#ff').form('clear');
    }
</script>





</body>
</html>
