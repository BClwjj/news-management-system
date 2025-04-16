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
        // ��ȡǰ�˴����ĸ�������
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String type = request.getParameter("type");
        String author = request.getParameter("author");

        // ���зǿ���֤
        if (title == null || title.isEmpty() || content == null || content.isEmpty() || type == null || type.isEmpty()
                || author == null || author.isEmpty()) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('���⡢���ݡ����͡����߲���Ϊ�գ������������ӣ�');history.back();</script>");
            return;
        }

        LocalDateTime now = LocalDateTime.now(); // ��ȡ��ǰ���ں�ʱ��
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
                // �����޸�Ϊresult > 0��ʾ����ɹ���֮ǰ�� > 3 ��̫����һ�����ɹ�����1
                out.println("<script>alert('������ӳɹ���');window.location='jsp/adminindex.jsp';</script>");
            } else {
                out.println("<script>alert('�������ʧ�ܣ�');</script>");
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('��������쳣��');</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}