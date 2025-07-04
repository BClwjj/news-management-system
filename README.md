# 新闻管理系统

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

## 部分页面预览
1. 新闻首页
   
![网站截图](./News/src/main/webapp/images/首页.png)

2. 新闻列表
   
![网站截图](./News/src/main/webapp/images/新闻列表.png)

3. 新闻详情

![网站截图](./News/src/main/webapp/images/新闻详情.png)

4. 新闻管理

![网站截图](./News/src/main/webapp/images/新闻管理.png)

4.添加新闻

![网站截图](./News/src/main/webapp/images/添加新闻.png)
