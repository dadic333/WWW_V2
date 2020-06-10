<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link href="css/styl.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Kabelová kniha</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar START-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar END--> 
    <div class="container pt-5 my-5 rounded">
        <h2>Něco se pokazilo</h2>
        <div class="jumbotron h-75">
            <p>
                Došlo k chybě připojení k databázi nebo nějaké jiné nepředloženosti.
                Kontaktujte prosím správce informačního sytému.
            </p>
            <a href="index.jsp"><h2>Návrat na úvodní stranu ...</h2></a>
        </div>
    </div>
    <div class="container-fluid">
    <div style="font-size: large">
        <h3 style="red"><b>Popis chyby:</b></h3>
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
  </body>
</html>
