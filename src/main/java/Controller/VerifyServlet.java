package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy token từ URL
        String token = request.getParameter("token");

        try {
            if (verifyToken(token)) {
                request.setAttribute("successMessage", "Tài khoản của bạn đã được xác thực thành công.");
            } else {
                request.setAttribute("errorMessage", "Token không hợp lệ hoặc đã hết hạn.");
            }

            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Xác thực token
    private boolean verifyToken(String token) throws Exception {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
        PreparedStatement stmt = conn.prepareStatement("UPDATE user SET status = 'ACTIVE' WHERE token = ?");
        stmt.setString(1, token);
        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;
    }
}
