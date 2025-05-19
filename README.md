# 新闻管理系统
![网站截图](./News/src/main/webapp/images/detail1.png)

基于 **Servlet/JSP + MySQL** 开发的新闻内容管理系统，支持新闻发布、分页展示、模糊搜索和管理员权限控制。

## 功能列表
- 用户端：新闻浏览、分类查看、关键词搜索
- 管理员端：新闻CRUD、登录验证
- 技术实现：JDBC数据库连接、Filter字符编码处理、JSP动态页面

## 技术栈
- 后端：Java Servlet, JSP, MySQL
- 前端：HTML/CSS
- 工具：Maven

## 快速启动
1. 导入数据库
2. 配置 `DBUtil.java` 中的数据库连接信息  
3. 部署到Tomcat服务器  
4. 访问 `http://localhost:8080/news/index.jsp`
