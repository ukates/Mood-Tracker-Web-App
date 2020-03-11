

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>


<head>       

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       

<title>My JSP Bug</title>   

</head>   

<body>

<h1>Week6 Bug</h1>               

<%

            int num1 = 20;           

            int num2 + 10;           

             int total;           

             total = num1 * num2;           

             out.println("The product of +(num1)+ " and " + (num2) + " is " + total + ".<br><br>");           

%>        

 </body>

</html>
