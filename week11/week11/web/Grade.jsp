<%-- 
    Document   : Grade
    Created on : Mar 27, 2016, 1:00:52 PM
    Author     : shraddha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <%@ page import="java.util.*" %>
            <%@ page import="javax.sql.*;" %>
            <%
                int id = Integer.parseInt(request.getParameter("studentId"));
                int courseId = Integer.parseInt(request.getParameter("courseId"));

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

                PreparedStatement ps = con.prepareStatement("select `student`.`firstname`, `student`.`lastname`, `course`.`subjectId`, `course`.`courseNumber`, `enrollment`.`grade` from `student`.`student`,`student`.`enrollment`,`student`.`course` where `student`.`id` = ? and `enrollment`.`courseId` = ? and `enrollment`.`courseId`=`course`.`courseId` and `enrollment`.`id` = `student`.`id`");
                ps.setInt(1, id);
                ps.setInt(2, courseId);
                ResultSet rset = ps.executeQuery();
                if (rset.next()) {
                    String firstName = rset.getString(1);
                    String lastName = rset.getString(2);
                    String subject = rset.getString(3);
                    String number = rset.getString(4);
                    String grade = rset.getString(5);
            %>
            <font size ="5">
            Your First Name : <%= firstName%><br/><br/>
            Your Last Name : <%= lastName%><br/><br/>
            Your Subject : <%= subject%><br/><br/>
            Your Number : <%= number%><br/><br/>
            Your Grade : <%= grade%><br/><br/></font>
            <%
            } else {
            %>
            Invalid Student Id Course Id
            <%
                }

            %>
    </body>
</html>
