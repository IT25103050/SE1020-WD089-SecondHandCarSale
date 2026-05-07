<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Redirect to the seller dashboard as the default landing page for this module
    response.sendRedirect(request.getContextPath() + "/seller-dashboard");
%>
<!DOCTYPE html>
<html>
<head>
    <title>AutoMart - Redirecting</title>
</head>
<body>
    If you are not redirected, <a href="seller-dashboard">click here for Seller Dashboard</a> or 
    <a href="dealer-dashboard">click here for Dealer Dashboard</a>.
</body>
</html>
