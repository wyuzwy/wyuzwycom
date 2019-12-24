<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/11/23
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>

<%
    request.setCharacterEncoding("utf-8");

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>人事资源管理系统</title>
    <%--<base href="<%=basePath%>">--%>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

    <style type="text/css">
        /**{*/
            /*padding:0px;*/
            /*margin:0px;*/
            /*font-size:12px;*/
        /*}*/
        #north{
            background-image:  url('login_style/img/topbg.gif');
            height:80px;
            overflow:hidden;

        }
    </style>
</head>


<body class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'" id="north" >
        <div style="position: relative;padding:0px;margin:0px;font-size:12px;">
            <img alt="找不到图片" src="login_style/img/top_logo.png">
            <table style="position:absolute;right:35px;top:15px;">
                <tr>
                    <td style="width:25px"><img  src="login_style/img/top_home.gif">
                    </td>
                    <td style="width:120px"><a href="" style="color: #FFFFFF; text-decoration:none">首页</a>
                    </td>
                    <td style="width:25px"> <img  src="login_style/img/top_exit.gif">
                    </td>
                    <td style="width:120px">
                        <a href="<%request.getContextPath();%>/exit" style="color:#FFFFFF; text-decoration:none">退出登录</a>
                    </td>
                </tr>
            </table>
            <div style="position: absolute;background-image:url('login_style/img/StatBarBg.png');
     left:400px;top:47px;width:100%;height:33px;background-size:100%;">
                <div style="width:100%">
                    <table style="margin-left:50px;margin-top:7px">
                        <tr>
                            <td style="width:25px"><img  src="login_style/img/StatBar_admin.gif"></td>
                            <td style="width:180px">当前用户：<span>${sessionScope.user.username}</span> </td>
                            <td style="width:115px"></td>
                            <td style="width:25px"><img  src="login_style/img/role.png"></td>
                            <td style="width:180px">用户权限：<span>${sessionScope.user.role.name}</span></td>
                            <td style="width:220px"></td>
                            <td style="width:25px" ><img  src="login_style/img/StatBar_time.gif"></td>
                            <td style="width:300px"><p id="time"></p ></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <%--<div style=" float: right;padding-right: 20px;">--%>
            <%--<div>当前时间：<span style="color: blue" id="time"></span></div>--%>
            <%--<div id="time">当前时间：</div>--%>

            <%--<div style="padding-top: 30px" align="right">--%>
                <%--<font color="red">${currentUser.userId }</font>--%>
                <%--,欢迎您！--%>
                <%--<a href="javascript:(0)" style="background-color: white" onclick="exit()"><font--%>
                        <%--color="#0E2D5F">注销</font></a>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <div data-options="region:'south'"  style="height:50px;">
        <p style="text-align: center">@五邑大学160803班 张文宇</p>
    </div>
    <div data-options="region:'east'" title="系统说明" style="width:100px;"></div>
    <div data-options="region:'west'" title="公司人事管理信息" style="width:150px;">
        <div class="easyui-accordion" style="width:100%;height:100%;" data-options="selected:false">
            <div title="用户管理" data-options="iconCls:'icon-groupadd'" style="overflow:auto;padding:0px;">
                    <a  style="width:145px;" id="searchUser"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="用户查询"  >用户查询</a>
                    <a style="width:145px;" id="addUser"  class="easyui-linkbutton" name="添加用户" data-options="iconCls:'icon-groupadd'">添加用户</a>

            </div>
            <div title="部门管理" data-options="iconCls:'icon-edit'" style="padding:0px;">
                <a  style="width:145px;" id="searchDept" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="部门查询"  >部门查询</a>
                <a style="width:145px;" id="addDept" href="#" class="easyui-linkbutton" name="添加部门" data-options="iconCls:'icon-add'">添加部门</a>
            </div>
            <div title="职位管理" data-options="iconCls:'icon-remove'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchJob" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="职位查询"  >职位查询</a>
                <a style="width:145px;" id="addJob" href="#" class="easyui-linkbutton" name="添加职位" data-options="iconCls:'icon-add'">添加职位</a>
            </div>
            <div title="员工管理" data-options="iconCls:'icon-man'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchEmp" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="员工查询"  >员工查询</a>
                <a style="width:145px;" id="addEmp" href="#" class="easyui-linkbutton" name="添加员工" data-options="iconCls:'icon-add'">添加员工</a>
            </div>
            <div title="公告管理" data-options="iconCls:'icon-ok'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchNotice" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" name="公告查询"  >公告查询</a>
                <a style="width:145px;" id="addNotice" href="#" class="easyui-linkbutton" name="添加公告" data-options="iconCls:'icon-add'">添加公告</a>
            </div>
            <div title="下载中心" data-options="iconCls:'icon-print'" style="padding:10px 0;">
                <a  style="width:145px;" id="searchFile" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-fileDL'" name="文件下载"  >文件下载</a>
                <a  style="width:145px;" id="addFile" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-upload'" name="文件上传"  >文件上传</a>
            </div>
            <div title="个人中心" data-options="iconCls:'icon-user'" style="padding:10px 0;">
                <a  style="width:145px;" id="userInfo" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-man'" name="个人信息"  >个人信息</a>
                <a  style="width:145px;" id="uploadPw" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" name="修改密码"  >修改密码</a>
            </div>
        </div>
    </div>
    <div data-options="region:'center'"  >
        <div class="easyui-tabs" fit="true" border="false" id="usertab">
            <div title="首页">
                <div align="center" style="padding-top: 100px;"><font color="red" size="10">欢迎使用人事资源管理平台</font></div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    setInterval("time.innerHTML=new Date().toLocaleString('chinese', { hour12: false })+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
    $(function() {
        loginMsg();
        $("#searchUser").click(function(){
            var role="${sessionScope.user.role.id}";
            if(role!="1"){
                $.messager.alert("系统提示", "<font color=red>您非超级管理员，暂无此操作权限！！！</font>");
                return ;
            }
            addTab("#usertab","用户查询","icon-zoom","searchUser.jsp");
        });
        $("#addUser").click(function(){
            var role="${sessionScope.user.role.id}";
            if(role!="1"){
                $.messager.alert("系统提示", "<font color=red>您非超级管理员，暂无此操作权限！！！</font>");
                return ;
            }
            addTab("#usertab","添加用户","icon-groupadd","addUser.jsp");
        });
        $("#searchDept").click(function(){
            addTab("#usertab","部门查询","icon-zoom","searchDept.jsp");
        });
        $("#addDept").click(function(){
            addTab("#usertab","添加部门","icon-groupadd","addDept.jsp");
        });
        $("#searchJob").click(function(){
            addTab("#usertab","职位查询","icon-zoom","searchJob.jsp");
        });
        $("#addJob").click(function(){
            addTab("#usertab","添加职位","icon-groupadd","addJob.jsp");
        });
        $("#searchEmp").click(function(){
            addTab("#usertab","员工查询","icon-zoom","searchEmp.jsp");
        });
        $("#addEmp").click(function(){
            addTab("#usertab","添加员工","icon-groupadd","addEmp.jsp");
        });
        $("#searchNotice").click(function(){
            addTab("#usertab","公告查询","icon-print","searchNotice.jsp");
        });
        $("#addNotice").click(function(){
            addTab("#usertab","添加公告","icon-groupadd","addNotice.jsp");
        });
        $("#searchFile").click(function(){
            addTab("#usertab","文件下载","icon-fileDL","searchFile.jsp");
        });
        $("#addFile").click(function(){
            addTab("#usertab","文件上传","icon-upload","addFile.jsp");
        });
        $("#userInfo").click(function(){
            addTab("#usertab","个人信息","icon-man","userInfo.jsp");
        });
        $("#uploadPw").click(function(){
            addTab("#usertab","修改密码","icon-man","uploadPw.jsp");
        });
    });

    function addTab(id, info, icon, url){
        var res = $(id).tabs("exists", info);

        if(res) {
            $(id).tabs("select", info);
        }else{
            var content = '<iframe scrolling="auto" frameborder="0" src="'+ url + '"style="width:100%;height:100%;"></iframe>';
            $(id).tabs("add", {
                "iconCls" : icon,
                "title" : info,
                content : content,
                "closable" : "true"
            });
        }
    }


    function loginMsg() {
        var title='上线通知';
        var sayHello='<div style="width:270px;height:120px"><div style="margin-bottom:5px">尊敬的<font size="4" color="green">${sessionScope.user.username}</font></div>';

        var hour=new Date().getHours();
        if(6<=hour&&hour<=12){
            sayHello+='<div style="text-indent:2em;">早上好！</div>' +
                '<div style="text-indent:2em;">一次次被吵醒，一次次的坚强站立，一次次的松懒躺下，不在起床中挺立，就在起床中趴下！为了祖国的明天，祝你克服一切阻力，睁开合拢的双眼，原来又是美好的一天！</div></div>';
        }else if(12<hour&&hour<=19){
            sayHello+='<div style="text-indent:2em;">下午好！</div>' +
                '<div style="text-indent:2em;">阳光，洒落点点滴滴的碎金，恰巧你捡到了；清风，催开一路的百花，恰巧你也笑了；问候，挑了一肩永恒的情谊，恰巧与你遇见了。愿你的生活，无比美好。</div></div>';
        }else{
            sayHello+='<div style="width:200px;text-indent:2em;">晚上好！</div>' +
                '<div style="text-indent:2em;">夜深人静，风清气爽，美好的世界缠绵着梦想，道生晚安，挂念不断，愿温柔的臂弯守候在你的身边，短信声声，祝福连连，愿你今夜开心入眠，晚安!</div></div>';
        }
        var msg=sayHello;
        var time='60000';
        var width=300;
        var height=210;
        showMessage(title,msg,time,width,height);
    }


    function showMessage(title,msg,time,width,height) {
        // '您有' + '<font size="4" color="red">' + 5 + '</font>' + '张表单需要审批！<br>点击确认立即审批      <a  href="javascript:void(0);" onclick="getPage()">确认</a>',
        $.messager.show({
            title:title,
            width:width,
            height:height,
            msg:msg,
            timeout: time,
            showType: 'slide'
        });
    }
    // $(".messager-body").window('close');style="color:blue;size:3"
</script>


</html>
