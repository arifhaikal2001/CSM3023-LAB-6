<%-- 
    Document   : processAuthor
    Created on : 31 May 2024, 12:54:52 pm
    Author     : McBois
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myAuthor" class="lab6.com.Author" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Author</title>
    </head>
    <body>
        <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>
    
    <jsp:setProperty name="myAuthor" property="*"/>
    
        <%
            int result;

            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/csm3023";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin@123");

            String sInsertQry = "INSERT INTO author(authno, name, address, city, state, zip) VALUES(?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            myPS.setString(1, myAuthor.getAuthno());
            myPS.setString(2, myAuthor.getName());
            myPS.setString(3, myAuthor.getAddress());
            myPS.setString(4, myAuthor.getCity());
            myPS.setString(5, myAuthor.getState());
            myPS.setString(6, myAuthor.getZip());

            result = myPS.executeUpdate();
            if (result > 0){
            out.println("<p style='color:blue;'>\tRecord successfully added into Author table...!</p>");
            out.print("<p style='color:blue;'>" + "Record with author no " + myAuthor.getAuthno() + " successfully created..!" + "</p>");
            out.print("<p style='color:blue;'>" + "Details of record are; " + "</p>");
            out.print("<p style='color:blue;'>Name : " + myAuthor.getName() + "</p>");
            out.print("<p style='color:blue;'>Address : " + myAuthor.getAddress() + "</p>");
            out.print("<p style='color:blue;'>City : " + myAuthor.getCity() + "</p>");
            out.print("<p style='color:blue;'>State : " + myAuthor.getState() + "</p>");
            out.print("<p style='color:blue;'>Zip : " + myAuthor.getZip() + "</p>");


            //Step 5: Close database connection...!
            System.out.println("Step 5: Close database connection...!");
            myConnection.close();
            System.out.println(" ");
            System.out.println("Database connection is closed...!");
            }
        %>
    </body>
</html>