package news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import news.DBUtil;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取前端传来的各个参数
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String type = request.getParameter("type");
        String author = request.getParameter("author");

        // 进行非空验证
        if (title == null || title.isEmpty() || content == null || content.isEmpty() || type == null || type.isEmpty()
                || author == null || author.isEmpty()) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('标题、内容、类型、作者不能为空，请检查后重新添加！');history.back();</script>");
            return;
        }

        LocalDateTime now = LocalDateTime.now(); // 获取当前日期和时间
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String time = now.format(formatter);

        PrintWriter out = response.getWriter();
        try {
            DBUtil db = new DBUtil();
            Connection conn = db.getConn();
            String sql = "INSERT INTO newsdetail (title, content, type, author, time) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, type);
            pstmt.setString(4, author);
            pstmt.setString(5, time);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                // 这里修改为result > 0表示插入成功，之前的 > 3 不太合理，一般插入成功返回1
                out.println("<script>alert('新闻添加成功！');window.location='jsp/adminindex.jsp';</script>");
            } else {
                out.println("<script>alert('新闻添加失败！');</script>");
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('新闻添加异常！');</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}