package news;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.DBUtil;

@WebServlet("/UpdatenServlet")
public class UpdatenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdatenServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id = request.getParameter("id");
	        String title = request.getParameter("title");
	        String author = request.getParameter("author");
	        String type = request.getParameter("type");
	        String content = request.getParameter("content");
	        try {
	            DBUtil db = new DBUtil();
	            Connection conn = db.getConn();
	            Statement stmt = conn.createStatement();
	            String sql = "UPDATE newsdetail SET title = '" + title + "', "
	            		+ "author = '" + author + "', type = '" + type + "', "
	            				+ "content = '" + content + "' WHERE id = " + id;
	            stmt.executeUpdate(sql);
	            stmt.close();
	            conn.close();
	            response.sendRedirect("jsp/adminindex.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
