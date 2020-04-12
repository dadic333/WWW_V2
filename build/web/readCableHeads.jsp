<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
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
    <%
      String type = request.getParameter("type");
      String name = request.getParameter("name");
      String strId = request.getParameter("exportId");
    %>
    <script type="text/javascript">
        $(document).ready(function() {
            var type = "<%=type%>";
            var name = "<%=name%>";
            var id = "<%=strId%>";
            var delDev = "delete";
            var editDev = "edit";
            var newDev = "new";
            
            if(type===delDev){
                var string = ("Kabelová hlava jménem: "+name+"; ID: "+id+"; byla vymazána.");
                alert(string);}
            if(type===editDev){
                var string = ("Kabelová hlava jménem: "+name+"; ID: "+id+"; byla upravena.");
                alert(string);}
            if(type===newDev){
                var string = ("Kabelová hlava jménem: "+name+"; ID: "+id+"; byla vytvořena.");
                alert(string);}
            
        });
    </script>
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <%--
    <div class="container sticky-top mt-4">

        <h1 style="position: absolute; top: 80px; background-color: #B0BED9; z-index: 3; border-radius: 0.9rem;">KABELOVÉ HLAVY - Výpis</h1>
    </div>    
    --%>
    <div class="container-fluid fixed-top mt-5 pt-5">
        <h1>KABELOVÉ HLAVY</h1>
    </div>
    <div class="container my-3 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
<!-- fixování nadpisu
    <div class="rounded-bottom bg-white fixed-top mt-5"><h1>Odstavec.</h1></div>

    <h1 style="position:fixed; background-color: #B0BED9; z-index: 3; border-radius: 0.9rem;">Editace KABELOVÉ HLAVY</h1>

    <div class="container-fluid">
        <h1 style="position:fixed; background-color: #B0BED9; z-index: 3; border-radius: 0.9rem;">Vytvořená kabelová hlava</h1>
    </div>
-->
    <div class="container mt-5 mb-3 pt-5 pb-1">
      <div class="d-flex justify-content-center">
        <a href="formCableHeadNew.jsp" class="btn btn-info col-4">
          Založit novou kabelovou hlavu
        </a>
      </div>
    </div>
    <div class="container my-5 py-3 rounded-pill bg-light">
<!--
    <div class="container my-5">
    <div class="container my-5 py-3 rounded-lg" style="background-color: whitesmoke">
    <div class="container my-5 py-3 rounded-pill" style="background-color: whitesmoke">
-->
        <!-- Výpis Kabelové Hlavy START -->
        <h2>Výpis kabelové hlavy</h2>
        <form action="readCableHeadOutputs.jsp" method="get">
            <select name="id" class="form-control" required>
                <option value="">--- Vyber kabelovou hlavu pro výpis ---</option>
                <c:forEach var="item" items="<%=moje.appLayer.CableHeadBO.getAllCableHeads()%>">
                    <option value="${item.id}">
                        ID:&nbsp&nbsp&nbsp  ${item.id};&nbsp&nbsp&nbsp&nbsp&nbsp;
                        NÁZEV:&nbsp&nbsp&nbsp  ${item.name};&nbsp&nbsp&nbsp&nbsp&nbsp;
                        UMÍSTĚNÍ:&nbsp&nbsp&nbsp  ${item.building};
                    </option>
                </c:forEach>
            </select>
            <div class="d-flex justify-content-center mt-3" >
              <button class="btn btn-dark px-5 py-2 " type="submit" >Vypiš</button>
            </div> 
        </form>
    </div>
    <!-- Výpis Kabelové Hlavy END -->  
    <main> 
      <h2>Výpis kabelových hlav</h2>
      <div class="container mb-3">
        <table id="tabulka" class="table table-striped table-bordered compact order-column " style="background-color: #80bdff;">
            <thead>
              <tr>
                <th>ID</th>
                <th>Název</th>
                <th>Budova</th>
                <th>Poznámka</th>
                <th>Kab. hlava</th>
                <th>Výstupy / Edituj</th>
                <th>Odstraň</th>
              </tr>
            </thead>
            <tbody>
                <c:set var="devices" value="<%= moje.appLayer.CableHeadBO.getAllCableHeads() %>"/>
                <c:forEach var="device" items="${devices}">
                    <tr> 
                        <td>
                            ${device.id}
                        </td>
                        <td>
                            ${device.name}
                        </td>
                        <td>
                            ${device.building}
                        </td>
                        <td>
                            ${device.note}
                        </td>
                        <td>
                            <form action="formCableHeadEdit.jsp" method="get">
                                <input  name="id" value='${device.id}' type="hidden" />
                                <button class="btn btn-dark w-100" type="submit">Uprav</button>
                            </form>
                        </td>
                        <td>
                            <form action="readCableHeadOutputs.jsp" method="post">
                                <input name="id" value='${device.id}' type="hidden" />  
                                <button class="btn btn-dark w-100" type="submit" >
                                    ${device.outputcount} / Uprav
                                </button> 
                            </form>
                        </td>
                        <td>
                            <button class="btn btn-danger w-100" onclick="confirmDelete(this)" data-name="${device.name}" data-id="${device.id}">
                                Odstraň
                            </button>
                        </td>
                    </tr> 
                </c:forEach>
            </tbody>
            <tfoot>
              <tr>
                <th>ID</th>
                <th>Název</th>
                <th>Budova</th>
                <th>Poznámka</th>
                <th>Kab. hlava</th>
                <th>Výstupy / Edituj</th>
                <th>Odstraň</th>
              </tr>
            </tfoot>
        </table>
      </div>
    </main>
    <script>
        function confirmDelete(toDel){
            var name = toDel.getAttribute("data-name");
            var id = toDel.getAttribute("data-id");
            if (window.confirm("Odstranit kabelovou hlavu?\nnázvem: "+name+";\nID:          "+id+";")){
                var odkaz = ("deleteCableHead.jsp?id="+id);
                window.location=odkaz;    
            } 
        } 
    </script>
  </body>
</html>