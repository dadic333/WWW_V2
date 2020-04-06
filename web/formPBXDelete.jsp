<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <title>PBX</title>
    </head>
    <body id="body-pozadi">
    <!-- Navbar START-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar END--> 
    <h1>POBOČKOVÉ ÚSTŘEDNY - Vymazání</h1>
    <!-- Vymazní PBX START -->
    <div class="container">
        <h2>Vymazání PBX</h2>
        <form action="deletePBX.jsp" method="get">
            <select name="PBXDelId" id="PBXDelId" class="form-control" required>
                <option value="">--- Vyber kabelovou hlavu pro vymazání ---</option>
                <c:forEach var="item" items="<%=moje.appLayer.PbxBO.getAllPbx()%>">
                    <option value="${item.id}">
                        ID:&nbsp&nbsp&nbsp  ${item.id};&nbsp&nbsp&nbsp&nbsp&nbsp  
                        NÁZEV:&nbsp&nbsp&nbsp  ${item.name};&nbsp&nbsp&nbsp&nbsp&nbsp
                        UMÍSTĚNÍ:&nbsp&nbsp&nbsp  ${item.building}
                    </option>
                </c:forEach>
            </select>
            <div class="mx-auto" style="width: 70px">
              <button class="btn btn-odeslat" type="submit" >Vymazat</button>
            </div> 
        </form>
    </div>
    <!-- Vymazní PBX END -->         
    <!-- výpis PBX START -->
    <div class="jumbotron">
      <h2>Výpis Pobočkových ústředen</h2>
      <div class="container">
          <%@include file="tables/tablePBX.jsp" %>
      </div>
    </div>     
    <!-- výpis PBX END -->  
    <!-- footer START -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer END -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>