<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="error.jsp" %>
<%    
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    Integer intId = Integer.parseInt(request.getParameter("id"));
   
    moje.entity.Cabheadoutput cabHeadOutput = moje.appLayer.CabHeadOutputBO.findCableHeadOutputById(intId); // výstup
    moje.entity.Cablehead cabHead = cabHeadOutput.getCableheadId();                                         // vlastník výstupu
%>
<c:set var="idSess" scope="session" value="<%=intId%>"/>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/mujTableScript.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Kabelová hlava</title>
    </head>
    <body id="body-pozadi">
      <!-- Navbar start-->
      <%@include file="pices/navbar.jsp" %>
      <!-- Navbar end--> 
      <div class="container fixed-top mt-5 pt-5 rounded">
          <h2>Editace výstupu KABELOVÉ HLAVY</h2>
      </div>
      <div class="container my-5 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
      <div class="container mt-5 py-5">
      <c:set var="output" value="<%=cabHeadOutput %>" />
        <form action="editCableHeadOutput.jsp" method="get"> <!-- <form action="editCableHeadOutputs.jsp" method="get"> -->
          <input name="id" value="${output.id}" type="hidden" />  
          <div class="form-group">
              <label for="name" class="item1">Kabelová hlava</label>
              <input class="form-control" name="name" id="name" value='${output.cableheadId.name}' type="text" readonly />
          </div>
          <div class="form-group">
              <label for="poradiVystupu" class="item1">Výstup</label>
              <input class="form-control" name="outputNumber" id="poradiVystupu" type="text" value='${output.cabheadout}' readonly />
          </div>
          <div class="form-group">
              <label for="telCislo" class="item1">Telefonní číslo</label>
              <input class="form-control" type="tel" name="phonenumber" id="telCislo" value="${output.phonenumber}" pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />
          </div>
          <div class="form-group">
              <label for="note" class="item1">Poznámka:</label>
              <input class="form-control" name="note"  id="note" type="text" value='${output.note}' required maxlength="99" />
          </div>
          <div class="d-flex justify-content-between mt-5" >
              <button class="btn btn-dark col-4 col-sm-3 p-2" type="submit" >Odešli</button>
              <button class="btn btn-danger col-4 col-sm-3 p-2 mx-1" type="reset" >Zruš změny</button>
              <button class="btn btn-info col-4 col-sm-3 p-2" onclick="goToCableHead(this)" data-id="<%=cabHead.getId()%>" type="button">Zpět</button>
          </div>
        </form>
      </div>
      <script>
          function goToCableHead(data){
              var id = data.getAttribute("data-id");
              var odkaz = ("readCableHeadOutputs.jsp?id="+id);
              window.location=odkaz;    
          } 
      </script>
    </body>
</html>