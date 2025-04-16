<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="news.DBUtil"%>
<%@ page import="java.sql.*"%>
<html>

<head>
    <meta charset="utf-8">
    <link href="../css/index.css" rel="stylesheet">
    <title>搜索新闻</title>
</head>

<body>
    <!-- 头部 -->
    <div class="header">
        <div class="logo">
            <img alt="logo" src="../images/logo.png" width="200px" height="60px">
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
    <div class="content">
        <div class="search-box">
            <form action="search_news.jsp" method="get">
                <label for="keyword">关键词:</label>
                <input type="text" id="keyword" name="keyword" placeholder="请输入关键词">
                <input type="submit" value="搜索">
            </form>
        </div>
        <!-- 页面主体布局，分为左右两部分 -->
        <div class="main-container">
            <!-- 左边新闻列表 -->
            <div class="left-news">
            <h2>最新新闻</h2>
                <%
                    try {
                        DBUtil db = new DBUtil();
                        Connection conn = db.getConn();
                        // 查询最新的8条新闻，按时间倒序排序（假设数据库中有相应时间字段，这里用time字段举例，需根据实际调整）
                        String sql = "SELECT * FROM newsdetail ORDER BY time DESC LIMIT 7";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        ResultSet rs = pstmt.executeQuery();
                        while (rs.next()) {
                %>
                <div class="news-item">
                    <!-- 显示新闻图片 -->
                    <%
                        String imagePath = rs.getString("image_path");
                        if (imagePath!= null &&!imagePath.isEmpty()) {
                    %>
                    <img src="<%=imagePath%>" class="news-image" alt="新闻图片">
                    <%
                        } else {
                    %>
                    <img src="../images/default-news-image.png" class="news-image" alt="默认新闻图片">
                    <%
                        }
                    %>
                    <div class="news-info">
                        <!-- 显示新闻标题 -->
                        <div class="news-title">
                            <a href="detail.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title")%></a>
                        </div>
                        <!-- 显示新闻内容一小段，截取合适长度并用...表示省略 -->
                        <div class="news-content-preview">
                            <%
                                String content = rs.getString("content");
                                if (content.length() > 50) { // 这里截取50个字符作为示例，可按需调整
                                    content = content.substring(0, 50) + "...";
                                }
                            %>
                            <%=content%>
                        </div>
                    </div>
                </div>
                <%
                        }
                        rs.close();
                        pstmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            <!-- 右边新闻分类 -->
            <div class="right-categories">
                <%
                    boolean hasCategoryNews = false;
                    try {
                        DBUtil db = new DBUtil();
                        Connection conn = db.getConn();
                        String[] categories = {"军事", "农业", "教育", "科技"};
                        for (String category : categories) {
                            String sql = "SELECT * FROM newsdetail WHERE type = '" + category + "' ORDER BY time DESC LIMIT 3";
                            PreparedStatement pstmt = conn.prepareStatement(sql);
                            ResultSet rs = pstmt.executeQuery();
                            if (rs.next()) {
                                hasCategoryNews = true;
                %>
                <div class="category">
                    <h2 class="category-title"><%=category%></h2>
                    <%
                        do {
                    %>
                    <div class="category-news-item">
                        <span class="bullet">&bull;</span>
                        <a href="detail.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title")%></a>
                    </div>
                    <%
                        } while (rs.next());
                    %>
                </div>
                <%
                            }
                            rs.close();
                            pstmt.close();
                        }
                        conn.close();
                        if (!hasCategoryNews) {
                %>
                <p class="no-category-news">暂无分类新闻。</p>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
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