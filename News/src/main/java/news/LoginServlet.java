package news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.DBUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String adminname = request.getParameter("adminname");
		String adminpass = request.getParameter("adminpass");
		PrintWriter out = response.getWriter();

		// 检查账号或密码是否为空
		if (adminname == null || adminname.trim().isEmpty() || adminpass == null || adminpass.trim().isEmpty()) {
			out.println("<script>alert('用户名或密码不能为空！');window.location='jsp/login.jsp';</script>");
			return;
		}

		try {
			// 使用DBUtil获取数据库连接
			DBUtil db = new DBUtil();
			Connection conn = db.getConn();
			String sql = "select * from admin where adminname=? and adminpass=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminname);
			pstmt.setString(2, adminpass);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null && rs.next()) {
				response.sendRedirect(request.getContextPath() + "/jsp/adminindex.jsp");
			} else {
				out.println("<script>alert('用户名或密码错误！');window.location='jsp/login.jsp';</script>");
			}

			// 关闭资源
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			response.setContentType("text/plain");
			out.print("数据库连接或查询出错：" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
