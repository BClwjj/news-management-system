<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="news.DBUtil"%>
<html>
<link href="../css/index.css" rel="stylesheet">
<link href="../css/layout.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>新闻详情</title>
</head>
<%
String id = request.getParameter("id");
%>
<body class="page-body">
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
			<li class="nav-item"><a href="allnews.jsp">所有新闻</a></li>
			<li class="nav-item"><a href="search.jsp">搜索新闻</a></li>
			<li class="nav-item"><a href="login.jsp">后台管理</a></li>
		</ul>
	</nav>
	<%
	try {
		DBUtil db = new DBUtil();
		Connection conn = db.getConn();
		// 使用 PreparedStatement 来避免 SQL 注入，查询当前新闻详情
		String sql = "SELECT * FROM newsdetail WHERE id =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="news-container">
		<h1 class="news-title"><%=rs.getString("title")%></h1>
		<div class="info-container">
			<p class="info-paragraph">
				作者:
				<%=rs.getString("author")%></p>
			<p class="info-paragraph">
				类型:
				<%=rs.getString("type")%></p>
			<p class="info-paragraph"><%=rs.getString("time")%></p>
		</div>
		<div class="info-separator"></div>
		<!-- 添加判断条件，只有当image_path有值时才显示图片元素 -->
		<%
		String imagePath = rs.getString("image_path");
		if (imagePath != null && !imagePath.isEmpty()) {
		%>
		<img src="<%=imagePath%>" class="content-image">
		<%
		}
		%>
		<div class="content-container">
			<%
			String content = rs.getString("content");
			// 将文本中的换行符替换为 <p> 标签，用于区分段落
			// 使用正则表达式(?m)^匹配每行的开始，并添加<p class='content-paragraph'>标签。
			content = content.replaceAll("(?m)^", "<p class='content-paragraph'>");
			// 使用正则表达式(?m)^(?!$)匹配每行的开始（除了空行），并添加</p><p class='content-paragraph'>标签，以区分不同的段落。
			content = content.replaceAll("(?m)^(?!$)", "</p><p class='content-paragraph'>");
			// 将文本中的换行符\n替换为<br>标签，用于在段落内保持换行。
			content = content.replaceAll("\\n", "<br>");
			// 合并多余的<p>标签
			content = content.replaceAll("<p class='content-paragraph'>\\s*<p class='content-paragraph'>",
					"<p class='content-paragraph'>");
			%>
			<%=content%>
		</div>
	</div>
	<%
	// 查询同类型的3条新闻推荐
	String type = rs.getString("type");
	String recommendSql = "SELECT * FROM newsdetail WHERE type =? AND id!=? LIMIT 3";
	PreparedStatement recommendPstmt = conn.prepareStatement(recommendSql);
	recommendPstmt.setString(1, type);
	recommendPstmt.setString(2, id);
	ResultSet recommendRs = recommendPstmt.executeQuery();
	%>
	<div class="recommend-news-container">
		<h2 class="recommend-news-title">
			<em><b>相关推荐</b></em>
		</h2>
		<%
		while (recommendRs.next()) {
		%>
		<div class="recommend-news-item">
			<!-- 显示新闻图片（添加判断，防止图片路径为空时报错） -->
			<%
			String recommendImagePath = recommendRs.getString("image_path");
			if (recommendImagePath != null && !recommendImagePath.isEmpty()) {
			%>
			<img src="<%=recommendImagePath%>" class="recommend-news-image">
			<%
			}
			%>
			<div class="recommend-news-info">
				<div class="recommend-news-heading ">
					<a href="detail.jsp?id=<%=recommendRs.getString("id")%>"><%=recommendRs.getString("title")%></a>
				</div>
				<p class="recommend-news-content">
					<%
					String recommendContent = recommendRs.getString("content");
					// 这里简单截取一小段内容展示
					if (recommendContent.length() > 100) {
						recommendContent = recommendContent.substring(0, 100) + "...";
					}
					%>
					<%=recommendContent%>
				</p>
			</div>
		</div>
		<%
		}
		// 先关闭推荐新闻相关的 ResultSet 和 PreparedStatement
		recommendRs.close();
		recommendPstmt.close();
		%>
	</div>
	<%
	} // 再关闭当前新闻详情查询的 ResultSet、PreparedStatement 和 Connection
	rs.close();
	pstmt.close();
	conn.close();
	} catch (SQLException e) { // 明确捕获 SQLException
	e.printStackTrace();
	}
	%>
	<!-- 页尾 -->
	<footer class="footer">
		<div class="footer-content">
			<p>&copy; 2023 千里眼融媒体中心. 版权所有。</p>
			<p>联系我们：地址 - 广东省东莞市广东科技学院，电话 - 0874 - 3315373</p>
		</div>
	</footer>
</body>
</html>