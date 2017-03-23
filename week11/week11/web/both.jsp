<%-- 
    Document   : both
    Created on : Mar 29, 2016, 2:52:31 PM
    Author     : shraddha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@ page import="java.util.*" %>
        <%@ page import="javax.sql.*;" %>

        <%
            String id = null;
            String courseId = null;
            java.sql.Connection con;
            java.sql.Statement s;
            java.sql.ResultSet rs;
            java.sql.PreparedStatement pst;

            con = null;
            s = null;
            pst = null;
            rs = null;
            String url = "jdbc:mysql://localhost/student";
            String username = "root";
            String pass = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded");
                con = java.sql.DriverManager.getConnection(url, username, pass);
                System.out.println("Database connected");
            } catch (ClassNotFoundException cnfe) {
                cnfe.printStackTrace();
            }
            
        %>
            
    </body>
</html>
