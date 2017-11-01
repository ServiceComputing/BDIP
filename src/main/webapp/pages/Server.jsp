<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: jrj
  Date: 17-5-11
  Time: 下午10:02
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>服务器异常流量</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table">
    <h1>Ip地址：202.121.223.4</h1>
    <caption>服务器异常流量</caption>
    <thead>
    <tr>
        <th>时间</th>
        <th>上行/下行流量</th>
        <th>上行/下行包量</th>
        <th>上行流量/上行包数</th>
        <th>下行流量/下行包数</th>
        <th>主动链接</th>
        <th>被动链接</th>
        <th>主动结束</th>
        <th>被动结束</th>
        <th>TCP PSH</th>
        <th>链接平均包数</th>
        <th>活跃连接数</th>
        <th>警报原因</th>
    </tr>
    </thead>
    <tbody>
<%
    String dbURL="jdbc:mysql://10.255.0.12:3306/ExceptionServer";
    String userName="root";
    String userPwd="hadoop928";
    Statement statement;
    Connection dbConn;
    Class.forName("com.mysql.jdbc.Driver");
    dbConn= DriverManager.getConnection(dbURL, userName, userPwd);
    statement = dbConn.createStatement();
    String sql = "SELECT * FROM 202d121d223d4 ORDER BY curTime  DESC LIMIT 10;";
    ResultSet rs = statement.executeQuery(sql);
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    while(rs.next()){%>
<tr>
    <td><%=sd.format(new Date(rs.getLong(1)*1000))%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=rs.getString(10)%></td>
    <td><%=rs.getString(11)%></td>
    <td><%=rs.getString(13)%></td>
    <td><%=rs.getString(14)%></td>
</tr>
<%}
%>
    </tbody>
</table>

<h4>
    现在的域值：时间长于10分钟 每秒通讯次数少于2次 一边小于1024b/s
</h4>
<table class="table">
    <h1>Ip地址：202.121.223.10 慢速连接</h1>
    <thead>
    <tr>
        <th>对方Ip</th>
        <th>连接时长</th>
        <th>连接通信次数</th>
        <th>上行流量</th>
        <th>下行流量</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th>202.120.xx.xx</th>
        <th>1200 秒</th>
        <th>600 次</th>
        <th>15000 Mb</th>
        <th>64 Mb</th>
    </tr>
    </tbody>
</table>

<table class="table">
    <h1>Ip地址：202.121.223.10</h1>
    <caption>服务器异常流量</caption>
    <thead>
    <tr>
        <th>时间</th>
        <th>上行/下行流量</th>
        <th>上行/下行包量</th>
        <th>上行流量/上行包数</th>
        <th>下行流量/下行包数</th>
        <th>主动链接</th>
        <th>被动链接</th>
        <th>主动结束</th>
        <th>被动结束</th>
        <th>TCP PSH</th>
        <th>链接平均包数</th>
        <th>活跃连接数</th>
        <th>警报原因</th>
    </tr>
    </thead>
    <tbody>
    <%
        sql = "SELECT * FROM 202d121d223d10 ORDER BY curTime  DESC LIMIT 10;";
        rs = statement.executeQuery(sql);
        while(rs.next()){%>
    <tr>
        <td><%=sd.format(new Date(rs.getLong(1)*1000))%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
        <td><%=rs.getString(9)%></td>
        <td><%=rs.getString(10)%></td>
        <td><%=rs.getString(11)%></td>
        <td><%=rs.getString(13)%></td>
        <td><%=rs.getString(14)%></td>
    </tr>
    <%}
    %>
    </tbody>
</table>
<table class="table">
    <h1>Ip地址：202.121.223.12</h1>
    <caption>服务器异常流量</caption>
    <thead>
    <tr>
        <th>时间</th>
        <th>上行/下行流量</th>
        <th>上行/下行包量</th>
        <th>上行流量/上行包数</th>
        <th>下行流量/下行包数</th>
        <th>主动链接</th>
        <th>被动链接</th>
        <th>主动结束</th>
        <th>被动结束</th>
        <th>TCP PSH</th>
        <th>链接平均包数</th>
        <th>活跃连接数</th>
        <th>警报原因</th>
    </tr>
    </thead>
    <tbody>
    <%
        sql = "SELECT * FROM 202d121d223d12 ORDER BY curTime  DESC LIMIT 10;";
        rs = statement.executeQuery(sql);
        while(rs.next()){%>
    <tr>
        <td><%=sd.format(new Date(rs.getLong(1)*1000))%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
        <td><%=rs.getString(9)%></td>
        <td><%=rs.getString(10)%></td>
        <td><%=rs.getString(11)%></td>
        <td><%=rs.getString(13)%></td>
        <td><%=rs.getString(14)%></td>
    </tr>
    <%}
    %>
    </tbody>
</table>

</body>
</html>
