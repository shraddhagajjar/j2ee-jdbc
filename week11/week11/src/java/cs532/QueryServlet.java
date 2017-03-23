/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cs532;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author shraddha
 */
@WebServlet(name = "QueryServlet", urlPatterns = {"/QueryServlet"})
public class QueryServlet extends HttpServlet {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";

    private static final String USERNAME = "root";
    private static final String PASSWORD = null;
    private static final String CONN_STRING = "jdbc:mysql://localhost/ebookshop";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        try {
            out.println(request.getParameter("author"));

            Class.forName("com.mysql.jdbc.Driver");
            out.println("Driver loaded");
            out.println("<br/>");
            conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
            stmt = (Statement) conn.createStatement();

            out.println("Database connected");
            out.println("<br/>");

            out.println("Your Selected Author " + request.getParameter("author"));

            String sqlStr = "SELECT * FROM `books` WHERE `author` = '" + request.getParameter("author") + "' and qty > 0 order by price desc";

            out.println("<html><head><title>Query Response</title></head><body>");
            out.println("<h3>Thank you for your query.</h3>");
            out.println("<p>You query is: " + sqlStr + "</p>");
            ResultSet rset = stmt.executeQuery(sqlStr);

            int count = 0;
            while (rset.next()) {
                out.println("<p>" + rset.getString("author")
                        + ", " + rset.getString("title")
                        + ", $" + rset.getDouble("price") + "</p>");
                count++;
            }
            out.println("<p>==== " + count + " records found =====</p>");
            out.println("</body></html>");
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
