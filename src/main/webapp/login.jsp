<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form role="form" action="syslogin.do" method="post">
                <h3>用户登录</h3>
                <div class="form-group">
                    <input type="text" class="form-control" name="username"  placeholder="用户名" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password"  placeholder="密　码" />
                </div>
                <div class="form-group text-right">
                    <button type="submit" class="btn btn-default">登录</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
                <c:if test="${msg != null }">
                    <div class="alert alert-warning alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">
                            &times;
                        </button>
                            ${msg }
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</div>
</body>
</html>