<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
        <script>
            window.alert("WINDOW ALERT");
        </script>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <title>JSP Page</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="jumbotron">
      <h2>Výpis kabelů</h2>
      <div class="container">
        <table>
          <tr>
            <th>Pořadí</th>
            <th>Index</th>
            <th>Název kabelové hlavy</th>
            <th>Budova</th>
            <th>Poznámka</th>
            <th>Počet výstupů</th>
          </tr>
          <% int i =0; %>
          <c:set var="cables" value="<%= moje.appLayer.CableHeadBO.getAllCableHeads() %>"/>
          <c:forEach var="cable" items="${cables}">
            <tr class="edit" data-bindID="${cable.id}">  
              <td><%= i=i+1 %> </td>
              <td>${cable.id}</td>
              <td><input style="width: 100%" type='text' class='_nameCable' value='${cable.name}' /></td>
              <td><input style="width: 100%" type='text' class='_buildingCable' value='${cable.building}' /></td>
              <td><input style="width: 100%" type='text' class='_noteCable' value='${cable.note}' /></td>
              <td>${cable.outputcount}</td>
              <td><a id="sendData" href="#" >Provést změnu</a></td>
<%--            
              <td><form action="editCableHead.jsp" method="post">
                  <%--<input name="id" type="text" value="${cable.id}">
                  <a id='sendData' href='#' >Odeslat data</a>
                  </form>
              </td>
--%>
            </tr> 
          </c:forEach>  
        </table>  
      </div>
    </div>
    <!-- vytvoření kabelové hlavy start -->  
    <div class="container">
      <h2>Založení nové kabelové hlavy</h2>
      <form action="newCableWithCableHeads.jsp" method="post">
        <p><label for="name" class="item1">Název kabelové hlavy:</label>
          <input name="name" id="name" type="text" required /></p>
        <p><label for="building" class="item1">Budova:</label>
          <input name="building" id="building" type="text" placeholder="zadej např. 'Ulice 20'" required/></p>
        <p><label for="note" class="item1">Poznámka:</label>
          <input name="note" id="note" type="text" placeholder="zadej např. '1NP, dv. 1, funkčních páry 1-30'" required/></p>
        <p><label for="outputCount" class="item1">Počet výstupů:</label>
          <input name="outputCount" id="outputCount" type="number" min="0" required/></p>
        <div class="mx-auto" style="width: 70px">  
          <button class="btn btn-odeslat" type="submit" >Vytvořit</button>
        </div> 
      </form>
    </div>
    <!-- vytvoření kabelové hlavy END -->
    <!-- Vymazní Kabelové Hlavy start -->
    <div class="container">
      <h2>Vymazání kabelové hlavy</h2>

      <p><input name="id" id="id" type="number" required /></p>
        <div class="mx-auto" style="width: 70px">  
          <button class="btn btn-odeslat" ><a id="deleteCableHead" href="#" >Vymazat</a></button>
        </div> 

    </div>
    <!-- Vymazní Kabelové Hlavy END -->
    <!-- footer start -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer end -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src='js/editCableHeadForJS.js'></script>
    <script src="js/deleteCableHeadForJS.js"></script>
  </body>
</html>