package Controller;

import DBcontext.DbConnection1;
import Dao.PropertyDAO;
import Entity.Property;
import Entity.Property1;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/villaS")
public class PropertyVillaSServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Property> propertyList ;
        PropertyDAO dao = new PropertyDAO();
        try {
            propertyList = dao.getListPropertiesType("villaS");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        // Truyền dữ liệu vào request để hiển thị trong JSP
        request.setAttribute("properties", propertyList);


        // Chuyển tiếp tới trang home.jsp để hiển thị
        request.getRequestDispatcher("villa-sale.jsp").forward(request, response);

    }}