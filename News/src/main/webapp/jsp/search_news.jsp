<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="news.DBUtil" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="utf-8">
<link href="../css/index.css" rel="stylesheet">
<link href="../css/layout.css" rel="stylesheet">
<title>搜索结果</title>
</head>
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
			<li class="nav-item"><a href="allnews.jsp">所有新闻</a></li>
			<li class="nav-item"><a href="search.jsp">搜索新闻</a></li>
			<li class="nav-item"><a href="login.jsp">后台管理</a></li>
		</ul>
	</nav>
    <div class="searchResultsContainer">
        <%
            String keyword = request.getParameter("keyword");
            int resultCount = 0;
            if (keyword!= null &&!keyword.trim().isEmpty()) {
        %>
        <h1 class="searchResultsTitle">[<%= keyword %>]搜索结果</h1>
        <%
            try {
                DBUtil db = new DBUtil();
                Connection conn = db.getConn();
                // 修改SQL查询，使其能够搜索标题、内容、作者和类型
                String sql = "SELECT * FROM newsdetail WHERE title LIKE? OR content LIKE? OR author LIKE? OR type LIKE?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "%" + keyword + "%");
                pstmt.setString(2, "%" + keyword + "%");
                pstmt.setString(3, "%" + keyword + "%");
                pstmt.setString(4, "%" + keyword + "%");
                ResultSet rs = pstmt.executeQuery();
        %>
        <%
            while (rs.next()) {
                resultCount++;
        %>
        <div class="newsItem">
            <div class="newsTitle">
            <a href="detail.jsp?id=<%= rs.getInt("id") %>">
            <%= rs.getString("title") %></a>
            </div>
            <div class="newsContent">
            <%= rs.getString("content").length() > 100? rs.getString("content").substring(0, 100) + "....." : rs.getString("content") %>
            </div>
            <div class="newsAuthorTime">
            <span class="newsAuthor">
            作者: <%= rs.getString("author") %>
            </span><span class="newsTime">
            发布时间: <%= rs.getString("time") %>
            </span>
            </div>
        </div>
        <%
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('搜索失败：" + e.getMessage() + "');</script>");
        }
    } else {
        out.println("<script>alert('请输入搜索关键词！');</script>");
    }
        %>
    </div>
    <!-- 页尾 -->
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2023 千里眼融媒体中心. 版权所有。</p>
            <p>联系我们：地址 - 广东省东莞市广东科技学院，电话 - 0874 - 3315373</p>
        </div>
    </footer>
</body>
</html>