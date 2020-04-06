<%@page import="moje.entity.Cabheadoutput"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<%    
    Integer intId = Integer.parseInt(request.getParameter("id"));
    
    if(intId==null){
        
    }
    
    moje.entity.Cabheadoutput cabHeadOutput = moje.appLayer.CabHeadOutputBO.findCableHeadOutputById(intId);
    moje.entity.Cablehead cabHead = cabHeadOutput.getCableheadId();
    
    HttpSession sess = request.getSession();
    sess.setAttribute("sessCabHeadOutput", cabHeadOutput) ; 
    

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
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
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
    <div class="d-block fixed-top mt-5 pt-4">
        <h1>Výstupy KABELOVÉ HLAVY - Editace</h1>
    </div>
    <div class="container my-4 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
    <c:set var="output" value="<%=cabHeadOutput %>" />
    <div class="container my-5 pt-5">
      <h2>Editace výstupu kabelové hlavy</h2>
      <form action="editCableHeadOutput.jsp" method="get"> <!-- <form action="editCableHeadOutputs.jsp" method="get"> -->
        <input name="id" value="${output.id}" type="hidden" />  
        <div class="form-group">
            <label for="cableHeadName">Kabelová hlava</label>
            <input class="form-control" name="name" id="cableHeadName" value='${output.cableheadId.name}' type="text" readonly />
        </div>
        <div class="form-group">
            <label for="poradiVystupu" >Výstup</label>
            <input class="form-control" name="outputNumber" id="poradiVystupu" type="text" value='${output.cabheadout}' readonly />
        </div>
        <div class="form-group">
            <label for="telCislo">Telefonní číslo</label>
            <input class="form-control" type="tel" name="phonenumber" value="${output.phonenumber}" required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />
        </div>
        <div class="form-group">
            <label for="note" >Poznámka:</label>
            <input class="form-control" name="note"  id="note" type="text" value='${output.note}' required maxlength="99" />
        </div>
        <div class="d-flex justify-content-between mt-3" >
            <button class="btn btn-dark col-4 col-sm-3 p-2" type="submit" >Odešli</button>
            <button class="btn btn-danger col-4 col-sm-3 p-2 mx-1" type="reset" >Zruš změny</button>
            <form action="readCableHeadOutputs.jsp" method="post">
                <input name="id" value='${cabHead.id}' type="hidden" />  
                <button class="btn btn-info col-4 col-sm-3 p-2" type="submit" >
                    Zpět
                </button> 
            </form>
        </div>
      </form>
    </div>
  </body>
</html>