<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="news.DBUtil" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑新闻</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css"></head>
<body>
    <!-- 头部 -->
    <div class="header">
        <div class="logo">
            <img alt="logo" src="../images/logo.png" width="200px" height="70px">
        </div>
        <div class="one">
            <p>千里眼融媒体中心·日报编辑部：0874-3315373</p>
            <p>千里眼融媒体中心·日报广告(登报、挂失)热线：0874-3315250</p>
            <p>千里眼融媒体中心·日报投稿邮箱：qianliyan@263.net</p>
        </div>
    </div>
    <!-- 导航栏 -->
    <nav class="navbar">
        <ul class="nav-list">
        <li class="nav-item"><a href="index.jsp">新闻首页</a></li>
        <li class="nav-item"><a href="adminindex.jsp">管理新闻</a></li>
        <li class="nav-item"><a href="addnews.jsp">添加新闻</a></li>
        <li class="nav-item"><a href="search.jsp">搜索新闻</a></li>
        </ul>
    </nav>
    <%
        String id = request.getParameter("id");
        try {
            DBUtil db = new DBUtil();
            Connection conn = db.getConn();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM newsdetail WHERE id = " + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
    %>
    <form action="${pageContext.request.contextPath}/UpdatenServlet" method="post" class="edit-news-form">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <label for="title" class="form-label">新闻标题:</label><br>
        <input type="text" id="title" name="title" value="<%= rs.getString("title") %>" class="title-input"><br>
        <label for="author" class="form-label">新闻作者:</label><br>
        <input type="text" id="author" name="author" value="<%= rs.getString("author") %>" class="form-input"><br>
        <label for="type" class="form-label">新闻类型:</label><br>
        <input type="text" id="type" name="type" value="<%= rs.getString("type") %>" class="form-input"><br>
        <label for="content" class="form-label">新闻内容:</label><br>
        <textarea id="content" name="content" class="content-textarea"><%= rs.getString("content") %></textarea><br>
        <input type="submit" value="保存修改" class="submit-button">
    </form>
    <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2023 千里眼融媒体中心. 版权所有。</p>
            <p>联系我们：地址 - 广东省东莞市广东科技学院，电话 - 0874 - 3315373</p>
        </div>
    </footer>
</body>
</html>