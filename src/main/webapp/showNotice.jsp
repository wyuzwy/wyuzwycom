<%--
  Created by IntelliJ IDEA.
  User: zhangwenyu
  Date: 2019/12/4
  Time: 19:24
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
    <title>${notice.title }</title>

</head>
<body>
<p>名称：${notice.name }</p>
<div style="width: 1000px;margin:0 auto;">
    ${notice.content }
</div>

<div style="margin-top: 50px;margin-bottom: 20px;" align="right">发布于：${notice.remark }</div>
</body>
</html>
