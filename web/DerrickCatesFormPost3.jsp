<%-- 
    Document   : DerrickCatesFormPost3
    Created on : Mar 9, 2020, 10:18:38 PM
    Author     : Cates
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DerrickCatesFormPost3</title>
    <style type ="text/css">
        table {
            margin-left: auto;
            margin-right: auto;
        }
        label {
            text-align:left;
            display: inline-block;
            width: 100px;height: 25px;
        }
        form {
            margin: auto
        }
        h1 {
            text-align: center;
        }
        .container {
            position:relative;
            width: 25vw;
            height: 25vh;
            border: 3px solid purple;
            margin: auto;
            border-radius:500vh;
            display: table;
        }
        .element {
            position:absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background: coral;
            width: 25vw;
            height: 25vh;
            text-align: center;
            border-radius: 800vh;
            display: grid;
        }
    </style>
    </head>
    <body>
        <h1>Mood Tracker</h1>
            <div class ='container'>
                 <div class ='element'>
                    <form action ='DerrickCatesFormPost3.jsp' method ='POST'>
        
        <%
            java.sql.Connection con = null;
            java.sql.Statement stmt = null;
            java.sql.ResultSet rs = null; 
            
            try {
                java.sql.DriverManager.registerDriver(new oracle.jdbc.OracleDriver()); 
                con = java.sql.DriverManager.getConnection("jdbc:oracle:thin:@"
                        + "localhost:1521:XE", "student1", "pass"); 
                stmt = con.createStatement(); 
             } 
            catch(Exception e) {
               out.println("<h1>Unable to connect to database.</h1>"); 
               out.println("</div>");
               out.println("</body>");
               out.println("</html>");
            }
            %>

                        <label>First Name:</label>
                        <input type ='text' name ='firstName'/><br>
                        <label>Last Name:</label>
                        <input type ='text' name ='lastName'/><br>
                        <label>Mood:</label>
                        <input type ='text' name ='mood'/><br>
                        <input type ='submit' value ='Submit'/>
                    </form>
                </div>
            </div>
            <%
            String firstN = request.getParameter("firstName"); 
            String lastN = request.getParameter("lastName"); 
            String cMood = request.getParameter("mood"); 
            
            if(request.getMethod().equals("POST")) {
                try {
                    stmt.executeUpdate("INSERT INTO MOOD_TRACKER VALUES('" + firstN + 
                            "', '" + lastN + "', '" + cMood + "')");

                    rs = stmt.executeQuery("SELECT * FROM MOOD_TRACKER"); 
                    %>
                    <table border = 1;>
                    <tr bgcolor = 'coral'>
                    <th>
                    First Name
                    </th>
                    <th>
                    Last Name 
                    </th>
                    <th>
                    Mood
                    </th>
                    </tr>
                    <%
                    while(rs.next()){
                    %>
                   <tr>
                   <%
                        for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
                   %> 
                   <td>
                   <%
                            out.println(" " + (rs.getString(i)).trim());
                  %>
                   </td> 
                  <%
                        }
                  %>
                  </tr>
                  <%
                    }
                  %>
                   </table>
                  <%
                }
                catch(java.sql.SQLException e) {
                    out.println(e); 
                    out.println("<p>Unable to update table</p><br />");
                }
                try{
                    stmt.close();
                    con.close();
                }
                catch(java.sql.SQLException e) {
                    out.println(e); 
                }
            }
        %>
    </body>
</html>
