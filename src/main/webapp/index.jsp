<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="vertical-align" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人事登录-登录</title>
<style type="text/css"></style>
<!-- CSS:写前端，如果不是专业的，那就用框架，我们这个项目用了：easyUI框架，其他框架还有：bootstrap -->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="login_style/layer_v3.1.1/3.1.1/layer.js"></script>
<link rel="stylesheet" href="login_style/css/supersized.css">
<link rel="stylesheet" href="login_style/css/login.css">
	<style type="text/css">
		input {vertical-align:middle}
		img {vertical-align:middle}
		a:link,a:visited{
			text-decoration:none;  /*超链接无下划线*/
			font-size: 15px;	/* 字体大小 */
		}
	</style>
</head>
<body>

	<div id="div_login">
		<p>人事管理HR系统</p>
		<div id="div_form">
			<img src="login_style/img/logo2.jpg" alt="找不到图片">
			<div >
			<form id="login">
				<table >
					<tbody>
					<tr>
						<th class="td1"><img src="login_style/img/memeber.gif" alt=""
											 style="width: 16px; text-align: right"></th>
						<th ><input type="text" id="number" name="number" placeholder="请输入账号" oninput="onTextChange()"></th>
					</tr>
					<tr>
						<th class="td1"><img src="login_style/img/lock.gif" alt=""
											 style="width: 16px;"></th>
						<th><input type="password" placeholder="请输入密码" id="password" name="password" oninput="onTextChange()"></th>
					</tr>
					<tr>
						<%--class="td1"--%>
						<th class="td1"><img src="login_style/img/timg.jpg" alt=""
												 style="width: 16px;"></th>
						<th><input type="text" placeholder="请输入验证码" id="verify" name="verify" oninput="onTextChange()" autocomplete="off"  style="width: 163px;">
							<img id="vCode" alt="" title="点击更换" src = "<c:url value='/setVerify?name=registCode&'/>"  onClick="changeVerifyCode(this)" style="width: 70px;height: 27px;">
						</th>

						<%--<th><img id="vCode" alt="" title="点击更换" src = "<c:url value='/findVerify?name=registCode&'/>" onClick="changeVerifyCode()" style="width: 70px;height: 28px;" border="2"></th>--%>
						<%--display: none" border="2"--%>
					</tr>
					<%--<tr align="right" style="background-color: inherit">--%>
						<%--<th colspan="2" ><a style="color: #0081C2" href="javascript:void(0) ;" onClick="showFetch()">忘记密码</a></th>--%>
					<%--</tr>--%>
					<%--<tr align="center" style="background-color: inherit;">--%>
						<%--&lt;%&ndash;<tr align="center">&ndash;%&gt;--%>
						<%--<td colspan="2">--%>
								<%--<input id="input_submit" type="button"  style="width: 100px;height: 37px; cursor: not-allowed;" value="登&nbsp;&nbsp;&nbsp;录" disabled="disabled" onclick="login()"/>--%>
						<%--</td>--%>
					<%--</tr>--%>
					</tbody>
				</table>

				<%--<div align="center">--%>
					<%--<button id="input_submit" type="button" disabled="disabled"  onclick="login()">登录</button>--%>
				<%--</div>--%>
			</form>
				<table style="margin-top: 140px;border-spacing: 0px 1px;width: 258px;height: 37px">
					<tr align="right" style="background-color: inherit">
						<th><a style="color: #2446AB" href="javascript:void(0);"  onClick="showFetch()">忘记密码</a></th>
					</tr>
					<tr align="center" style="background-color: inherit;">
						<%--<tr align="center">--%>
						<td >
							<input id="input_submit" type="button"  style="width: 100px;height: 37px; cursor: not-allowed;" value="登&nbsp;&nbsp;&nbsp;录" disabled="disabled" onclick="login()"/>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	<!-- Javascript -->
	<script src="login_style/js/supersized.3.2.7.min.js"></script>
	<script src="login_style/js/supersized-init.js"></script>

</body>
<!-- js：javascript代码 -->
<script type="text/javascript">
	function login() {
        var number=$("#number").val();
        var password=$("#password").val();
        var verify = $("#verify").val();
		$.ajax({
			url:"/login",
			data:{
			    number:number,
				password:password,
                verify:verify
			},
			type:"POST",
			success:function (result) {
			    console.log(result);
				if(result.flag=="200"){

                    window.location.href = result.data;
                    layer.msg('登录成功，正在跳转。。。', {
                        time : 1000
                    });
				}else{
                    var id= document.getElementById("vCode");
                    changeVerifyCode(id);
                    $.messager.alert("系统提示", "<font color=red>"+result.msg+"</font>");

				}
            },
			error:function () {
                $.messager.alert("系统提示", "<font color=red>登录超时，请重试！！！</font>");
            }
		});

    }

    function changeVerifyCode(obj) {
        // var img = document.getElementById("vCode");
		// alert(obj);
        obj.src = "<c:url value='/setVerify?name=registCode&'/>" + new Date().getTime();
        <%--img.src ="<%request.getContextPath();%>/findVerify?name=registCode&"+new Date().getTime();--%>
    }


    //忘记密码窗口
    function showFetch() {
        layer
            .open({
                type : 1,//Page层类型
                area : [ '500px', '300px' ],
                skin : "",
                // btn: ['按钮1', '按钮2'],
                title : [ '找回密码',
                    'border:none; background:#CAE1FF; color:#000;text-align:left;' ],
                shade : 0.6, //遮罩透明度
                maxmin : false, //允许全屏最小化
                anim : 0, //0-6的动画形式，-1不开启
                content : '<div align="center"  style="margin-top:40px;"><table>'
                    + '<tr style="line-height: 35px;"><td>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td><td><input style="height: 23px;width: 160px" type="text" id="f_number" value=""  tabIndex="1" placeholder="请输入账号"></td></tr>'
                    + '<tr style="line-height: 35px;"><td class="label">手机号码：</td><td><input style="height: 23px;width: 160px" type="text" id="f_phone" value=""  tabIndex="2" placeholder="请输入手机号码"></td></tr>'
                    + '<tr style="line-height: 35px;"><td class="label">验&nbsp;&nbsp;证&nbsp;&nbsp;码:</td><td><input style="height: 23px;width: 90px" id="f_verify"  tabIndex="3"  value=""  type="text" maxlength=4 placeholder="请输入验证码">'
					+'<img id="fvCode" alt="" title="点击更换" src = "<c:url value='/setVerify?name=registCode&'/>"  onClick="changeVerifyCode(this)" style="width: 70px;height: 27px;">'
                    // + '<img src="yzm?d='
                    // + currentTime
                    // + '" class="j_captcha verifytxt" onClick="changeVerifyCode()"/>
					 +'</td>'
					+'</tr>'
                    + '</table></div>'
                    // +'<div  style="margin-top:30px;width:100px height="35px"><a align="center" class="button button-blue"  onclick="findPw()"  style="width: 100px;height: 37px;">找&nbsp;&nbsp;&nbsp;回</a></div>',
					+'<div style="margin-top:30px;width:100px height="35px"><input align="center"  type="button" onclick="findPw()" value="找&nbsp;&nbsp;&nbsp;回"  style="width: 100px;height: 37px;background-color:#6abeed;color:white"></div>',//background-color:#6abeed
				end:function () {
					    //即时更新验证码
                    var id= document.getElementById("vCode");
                    changeVerifyCode(id);
                }
            });
    }




    function onTextChange() {
		var number=$("#number").val();
		var password=$("#password").val();
		var verify=$("#verify").val();
		if(number!=""&&number!=null&&password!=""&&password!=null&&verify!=""&&verify!=null){
            $("#input_submit").removeAttr("disabled");
            $("#input_submit").css("cursor","pointer");
            $("#input_submit").css("background-color","#6abeed");
            $("#input_submit").css("color","white");
		}else{
            $("#input_submit").attr("disabled", "disabled");
            $("#input_submit").css("cursor","not-allowed");
            $("#input_submit").css("background-color","");
            $("#input_submit").css("color","");
		}
    }
    
    function findPw() {
        var number = $("#f_number").val();
        var verify = $("#f_verify").val();
        var phone = $("#f_phone").val();

        if (number == "") {
            layer.msg('请输入账号！', {
                time : 1000
            });
            $('#f_number').focus();
            return false;
        }

        if (phone == "") {
            layer.msg('请输入您的手机号码!', {
                time : 1000
            });
            $('#f_phone').focus();
            return false;
        }

        if (verify == "") {
            layer.msg('请输入验证码！', {
                time : 1000
            });
            $('#f_verify').focus();
            return false;
        }

        var l_index = layer.load(1, {
            shade : [ 0.1, '#fff' ]
            //0.1透明度的白色背景
        });

        $.ajax({
			url:"findPassword",
			type:"POST",
            data : {
                number : number,
                phone : phone,
                verify : verify
            },
            dataType : "json",
            complete : function() {
                layer.close(l_index);
                // var id= document.getElementById("vCode");
                // changeVerifyCode(id);
            },
			success:function (result) {
				if(result.flag=="200"){//成功
                    layer.alert("密码重置成功：" + result.msg + "，<br>登陆后请尽快修改",
                        7, function() {
                            layer.closeAll();
                    	}
                    );
				}else{//失败！
                    //即时更新验证码
				    var id= document.getElementById("fvCode");
                    changeVerifyCode(id);
                    layer.alert(result.msg);
				}
            },
			error:function () {
                layer.alert("登录超时，请稍后重试！");
            }
		});

    }
</script>
</html>