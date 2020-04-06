<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="./bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="./css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <title>Kabelová kniha</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar START-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar END--> 
    <div class="container-fluid">
    <div style="font-size: large">
        <h1>Něco se pokazilo</h1>
        <a href="index.jsp"><h2>Návrat na úvodní stranu ...</h2></a>
        <hr/>
        <hr/>
        <h2 style="red"><b>Popis chyby:</b></h2>
      <%
        Throwable ex = pageContext.getErrorData().getThrowable();
        StackTraceElement[] stack = ex.getStackTrace();
        
        while(ex != null){
          String type = ex.getClass().getName();
          String message = ex.getMessage();
      %>
      <%=type%><b><%=message%></b><br/>
      <%
        ex = ex.getCause();
        }//while(ex != null)
      %>  
    </div>
    <h3>Stack tree:</h3>
    <div style="font-family: Courier">
      <%
        for(StackTraceElement ste: stack){
      %>
      <%=ste.toString()%>
      <br/>
      <%
        }//for(StackTraceElement ste: stack)
      %>
    </div>
    </div>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
