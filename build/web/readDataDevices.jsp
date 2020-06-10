<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/mujTableScript.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Datový prvek</title>
  </head>
  <body id="body-pozadi">
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String type = null;
        String name = null;
        String strId = null;
        moje.entity.Datadevice dataDevice;
        HttpSession sess = request.getSession();
        type = request.getParameter("type");
        name = request.getParameter("name");
        strId = request.getParameter("exportId");

        if(sess.getAttribute("dataDeviceItem")!= null){
        dataDevice = (moje.entity.Datadevice)sess.getAttribute("dataDeviceItem");
        strId = dataDevice.getId().toString();
        name = dataDevice.getName().toString();
        }        
    %>
    <script type="text/javascript">
        $(document).ready(function() {
            var type = "<%=type%>";
            var name = "<%=name%>";
            var id = "<%=strId%>";
            var string;
            
            if(type==="delete"){
                var entity = ("<div class=\"container py-1 my-2 message\" id=\"message\">\n\
                                \"VYMAZÁN datový prvek jménem:  "+name+";   ID: "+id+"\"</div>");
                string = ("VYMAZÁN datový prvek jménem:  "+name+";   ID: "+id);
                document.getElementById("message").innerHTML = entity;} //alert(string);}
            if(type==="edit"){
                var entity = ("<div class=\"container py-1 my-2 message\" id=\"message\">\n\
                                \"UPRAVEN datový prvek jménem:  "+name+";   ID: "+id+"\"</div>");
                string = ("UPRAVENA kabelová hlava jménem:  "+name+";   ID: "+id);
                document.getElementById("message").innerHTML = entity;}
            if(type==="new"){
                var entity = ("<div class=\"container py-1 my-2 message\" id=\"message\">\n\
                                \"VYTVOŘEN datový prvek jménem: "+name+";   ID: "+id+"\"</div>");
                string = ("VYTVOŘENA kabelová hlava jménem: "+name+";   ID: "+id);
                document.getElementById("message").innerHTML = entity;}
        });
    </script>
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="container fixed-top mt-5 pt-5">
        <h2>DATOVÉ PRVKY</h2>
    </div>
    <div class="container my-3 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
    <div class="container mt-5 mb-3 pt-5 pb-1">
      <div class="d-flex justify-content-center">
        <a href="formDataDeviceNew.jsp" class="btn btn-info col-4">
          Založit nový datový prvek
        </a>
      </div>
    </div>
    <!-- Výpis Datového prvku START -->
    <div class="container my-5 py-3 rounded-pill bg-light">
        <h3>Výpis datového prvku</h3>
        <form action="readDataDeviceOutputs.jsp" method="get">
            <select name="id" class="form-control" required>
                <option value="">--- Vyber datový prvek pro výpis ---</option>
                <c:forEach var="item" items="<%=moje.appLayer.DataDeviceBO.getAllDataDevices()%>">
                    <option value="${item.id}">
                        ID:&nbsp;${item.id}&nbsp;&nbsp;&nbsp;NÁZEV:&nbsp;${item.name}&nbsp;&nbsp;&nbsp;UMÍSTĚNÍ:&nbsp;${item.building};
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
      <h3>Výpis datových prvků</h3>
      <div id="message"></div>
      <div class="container mb-3">
        <div class="table-responsive">
        <table id="tabulka" class="table table-striped table-bordered compact order-column ">
            <thead>
              <tr>
                <th>ID</th>
                <th>Název</th>
                <th>Budova</th>
                <th>Poznámka</th>
                <th>Datový prvek</th>
                <th>Výstupy / Edituj</th>
                <th>Odstraň</th>
              </tr>
            </thead>
            <tbody>
                <c:set var="devices" value="<%= moje.appLayer.DataDeviceBO.getAllDataDevices() %>"/>
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
                            <form action="formDataDeviceEdit.jsp" method="get">
                                <input  name="id" value='${device.id}' type="hidden" />
                                <button class="btn btn-dark w-100" type="submit">Uprav</button>
                            </form>
                        </td>
                        <td>
                            <form action="readDataDeviceOutputs.jsp" method="post">
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
                <th>Datový prvek</th>
                <th>Výstupy / Edituj</th>
                <th>Odstraň</th>
              </tr>
            </tfoot>
        </table>
        </div>
      </div>
    </main>
    <script>
        function confirmDelete(toDel){
            var name = toDel.getAttribute("data-name");
            var id = toDel.getAttribute("data-id");
            if (window.confirm("Odstranit datový prvek jmémen:   "+name+";   ID: "+id+"  ?")){
                var odkaz = ("deleteDataDevice.jsp?id="+id);
                window.location=odkaz;    
            } 
        } 
    </script>
  </body>
</html>