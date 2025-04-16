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

		// ����˺Ż������Ƿ�Ϊ��
		if (adminname == null || adminname.trim().isEmpty() || adminpass == null || adminpass.trim().isEmpty()) {
			out.println("<script>alert('�û��������벻��Ϊ�գ�');window.location='jsp/login.jsp';</script>");
			return;
		}

		try {
			// ʹ��DBUtil��ȡ���ݿ�����
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
				out.println("<script>alert('�û������������');window.location='jsp/login.jsp';</script>");
			}

			// �ر���Դ
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			response.setContentType("text/plain");
			out.print("���ݿ����ӻ��ѯ����" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
