<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
	<div class="header">
		<div class="logo">
			<img alt="logo" src="../images/logo.png" width="200px" height="70px">
		</div>
		<div class="one">
			<p>管理员登录</p>
		</div>
	</div>
	<div class="main">
		<main class="main-container">
			<div class="right-form-container">
				<p>账号密码登录</p>
				<form action="${pageContext.request.contextPath}/LoginServlet"
					method="post">
					<div class="form-group">
						<label for="email-phone">用户名</label> <input type="text"
							name="adminname" placeholder="请输入用户名">
					</div>
					<div class="form-group">
						<label for="password">密码</label> <input type="password"
							name="adminpass" placeholder="请输入密码">
					</div>
					<div class="form-options">
						<a href="#" class="forgot-password">找回密码</a>
					</div>
					<button type="submit" class="login-btn">登录</button>
				</form>
			</div>
		</main>
	</div>
	<footer class="footer">
		<div class="footer-content">
			<p>&copy; 2023 千里眼融媒体中心. 版权所有。</p>
			<p>联系我们：地址 - 广东省东莞市广东科技学院，电话 - 0874 - 3315373</p>
		</div>
	</footer>
</body>
</html>