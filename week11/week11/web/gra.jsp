<%-- 
    Document   : gra
    Created on : Mar 29, 2016, 11:18:31 AM
    Author     : shraddha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@ page import="java.util.*" %>
        <%@ page import="javax.sql.*;" %>

        <%
            String id = (String) request.getParameter("studentId");
            String courseId = (String) request.getParameter("courseId");
            java.sql.Connection con;
            java.sql.Statement s;
            java.sql.ResultSet rs;
            java.sql.PreparedStatement pst;

            con = null;
            s = null;
            pst = null;
            rs = null;
            PreparedStatement ps = null;
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

            try {

                if (courseId.isEmpty()) {
                ps = con.prepareStatement("select `student`.`firstname`, `student`.`lastname`, `course`.`subjectId`, `course`.`courseNumber`, `enrollment`.`grade` from `student`.`student`,`student`.`enrollment`,`student`.`course` where `student`.`id` = ? and `enrollment`.`courseId`=`course`.`courseId` and `enrollment`.`id` = `student`.`id`");
                ps.setInt(1, Integer.parseInt(id));

            }

            if (id.isEmpty()) {
        
                ps = con.prepareStatement("select `student`.`firstname`, `student`.`lastname`, `course`.`subjectId`, `course`.`courseNumber`, `enrollment`.`grade` from `student`.`student`,`student`.`enrollment`,`student`.`course` where `enrollment`.`courseId` = ? and `enrollment`.`courseId`=`course`.`courseId` and `student`.`id` = `enrollment`.`id`");
                ps.setInt(1, Integer.parseInt(courseId));

            }
            if (!id.isEmpty() && !courseId.isEmpty()) {
                ps = con.prepareStatement("select `student`.`firstname`, `student`.`lastname`, `course`.`subjectId`, `course`.`courseNumber`, `enrollment`.`grade` from `student`.`student`,`student`.`enrollment`,`student`.`course` where `student`.`id` = ? and `enrollment`.`courseId` = ? and `enrollment`.`courseId`=`course`.`courseId` and `enrollment`.`id` = `student`.`id`");
                ps.setInt(1, Integer.parseInt(id));
                ps.setInt(2, Integer.parseInt(courseId));

            }

            ResultSet rset = ps.executeQuery();
            while (rset.next()) {
                String firstName = rset.getString(1);
                String lastName = rset.getString(2);
                String subject = rset.getString(3);
                String number = rset.getString(4);
                String grade = rset.getString(5);
        %>
        <font size ="3">
        <br/>
        <b><%= firstName%>  <%= lastName%> 's grade on course  <%= subject%> &nbsp; <%= number%> is &nbsp; <%= grade%> <br/></b> </font> <%
                }

            } catch (Exception e) {
                System.err.println("Got an exception! " + e);
            }


        %>


    </body>
</html>
