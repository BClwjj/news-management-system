<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="news.DBUtil"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<meta charset="utf-8">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<title>管理员新闻列表</title>
</head>

<body>
	<!-- 头部 -->
	<div class="header">
		<div class="logo">
			<img alt="logo" src="../images/logo.png" width="200px" height="70px">
		</div>
		<div class="one">
			<p>千里眼融媒体中心·日报编辑部：0874 - 3315373</p>
			<p>千里眼融媒体中心·日报广告(登报、挂失)热线：0874 - 3315250</p>
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
	<div class="content">
		<h1 class="news-list-title">管理新闻</h1>
		<%
		int pageSize = 8; // 每页显示的新闻数量
		int pageIndex = 1; // 当前页码，默认为1
		int totalPages = 0; // 总页数，先初始化为0
		if (request.getParameter("pageIndex") != null) {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		}

		try {
			DBUtil db = new DBUtil();
			Connection conn = db.getConn();
			Statement stmt = conn.createStatement();
			// 查询总记录数
			String countSql = "SELECT COUNT(*) FROM newsdetail";
			ResultSet countRs = stmt.executeQuery(countSql);
			int totalRecords = 0;
			if (countRs.next()) {
				totalRecords = countRs.getInt(1);
			}
			countRs.close();
			// 计算总页数
			totalPages = (int) Math.ceil((double) totalRecords / pageSize);
			// 查询当前页的数据
			int startIndex = (pageIndex - 1) * pageSize;
			String sql = "SELECT * FROM newsdetail ORDER BY time DESC LIMIT " + startIndex + ", " + pageSize;
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<table class="news-table">
			<tr>
				<th class="news-table-header">新闻标题</th>
				<th class="news-table-header">新闻作者</th>
				<th class="news-table-header">新闻类型</th>
				<th class="news-table-header">发布时间</th>
				<th class="news-table-header">编辑</th>
				<th class="news-table-header">删除</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr class="news-table-row-hover">
				<td class="news-table-cell"><a class="news-link"
					href="detail.jsp?id=<%=rs.getInt("id")%>"> <%=rs.getString("title")%></a></td>
				<td class="news-table-cell"><%=rs.getString("author")%></td>
				<td class="news-table-cell"><%=rs.getString("type")%></td>
				<td class="news-table-cell"><%=rs.getString("time")%></td>
				<td class="action-cell"><a class="news-link"
					href="edit.jsp?id=<%=rs.getInt("id")%>">编辑</a></td>
				<td class="action-cell"><a class="news-link"
					href="${pageContext.request.contextPath}/DeleteServlet?id=<%= rs.getInt("id") %>"
					onclick="return confirm('确定要删除该条新闻吗？');">删除</a></td>
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			conn.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</table>
		<!-- 分页导航 -->
		<div class="pagination">
			<%
			if (pageIndex > 1) {
			%>
			<a href="?pageIndex=<%=pageIndex - 1%>">上一页</a>
			<%
			}
			for (int i = 1; i <= totalPages; i++) {
			%>
			<%
			if (i == pageIndex) {
			%>
			<a class="current-page" href="#"><%=i%></a>
			<%
			} else {
			%>
			<a href="?pageIndex=<%=i%>"><%=i%></a>
			<%
			}
			%>
			<%
			}
			if (pageIndex < totalPages) {
			%>
			<a href="?pageIndex=<%=pageIndex + 1%>">下一页</a>
			<%
			}
			%>
		</div>
	</div>
	<footer class="footer">
		<div class="footer-content">
			<p>&copy; 2023 千里眼融媒体中心. 版权所有。</p>
			<p>联系我们：地址 - 广东省东莞市广东科技学院，电话 - 0874 - 3315373</p>
		</div>
	</footer>
</body>
</html>