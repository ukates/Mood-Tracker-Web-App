<%-- 
    Document   : CreateTable
    Created on : Mar 10, 2020, 12:14:56 AM
    Author     : Cates
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Mood Tracker Table</title>
    </head>
    <body>
        <%
            java.sql.Connection con = null; 
            java.sql.Statement stmt = null; 
            try {
            java.sql.DriverManager.registerDriver(new oracle.jdbc.OracleDriver()); 
            con = java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1", "pass"); 
            stmt = con.createStatement(); 
            }
            catch(Exception e) {
                out.println("<h1>Unable to connect to database.</h1>"); 
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
            try {
                stmt.executeUpdate("DROP TABLE MOOD_TRACKER"); 
                out.println("<b>Previous Mood Tracker Table Dropped</b><br />"); 
            }
            catch (java.sql.SQLException e){
                out.println("<b>Mood Tracker Table does not exist</b><br />");
            }
            try {
                stmt.executeUpdate("CREATE TABLE MOOD_TRACKER("
                        + "FNAME VARCHAR2(20) NOT NULL, LNAME VARCHAR2(20) NOT NULL, MOOD VARCHAR2(20) NOT NULL)"); 
                out.println("<b>Mood Tracker table created</b><br>");
            }
            catch(java.sql.SQLException e) {
                out.println("<b>Error creating Mood Tracker table</b><br />"); 
            }
            try {
                stmt.close(); 
                con.close(); 
                out.println("<b>Connection to database closed</b><br />"); 
                out.println("<br><a href = \"DerrickCatesFormPost3.jsp\">CLICK HERE TO ADD TO MOOD TRACKER TABLE!</a>");
            }
            catch(java.sql.SQLException e) {
                out.println("<b>Unable to close connection</b><br />"); 
        }
        %>
    </body>
</html>
