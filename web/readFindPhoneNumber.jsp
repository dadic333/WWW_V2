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
        <title>Vyhledané číslo</title>
    </head>
    <body id="body-pozadi">
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String pocetVyskytu = null;
            pocetVyskytu = request.getParameter("pocetVyskytu");

            if (pocetVyskytu == null || pocetVyskytu == "") {
                pocetVyskytu = null;
            } else {
                pocetVyskytu = request.getParameter("pocetVyskytu");
            }
        %>
        <script>
            $(document).ready(function () {
                var pocetVyskytu = "<%=pocetVyskytu%>";

                if (pocetVyskytu !== "" || pocetVyskytu !== null) {
                    var entity = ("<div class=\"container py-1 my-1 message\" id=\"message\">\n\
                                    \"Počet nalezených výskytů:  " + pocetVyskytu + "\"</div>");
                    document.getElementById("message").innerHTML = entity;
                }
            });
        </script>
        <!-- Navbar start-->
        <%@include file="pices/navbar.jsp" %>
        <!-- Navbar end--> 
        <div class="container fixed-top mt-5 pt-5">
        <h2>Vyhledaná klapka</h2>
        </div>
        <div class="container my-3 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
        <div class="container mt-5 mb-3 pt-5 pb-1">

        </div>
        <div id="message"></div>
        <main> 
            <div class="container my-3 py-3">
               <h4>Výpis datových prvků</h4>
               <div class="table-responsive">
               <table class="tabulka table table-striped table-bordered tabulka_modra " cellspacing="0" width="100%">
                   <thead>
                       <tr>
                           <th>Datový prvek</th>
                           <th>Výstup</th>
                           <th>Tel. číslo</th>
                           <th>MAC</th>
                           <th>Poznámka</th>
                           <th>Výstup</th>
                           <th>Datový prvek</th>
                       </tr>
                   </thead>
                   <tbody>
                   <c:set var="outputs" value="<%=request.getSession().getAttribute(
                        "findPhoneNumberDataDeviceOutputs")%>" />
                   <c:forEach var="output" items="${outputs}">
                       <tr> 
                           <td>
                                ${output.deviceId.name}
                           </td>
                           <td>
                                ${output.datadevout}
                           </td>
                           <td>
                               ${output.phonenumber}
                           </td>
                           <td>
                               ${output.mac}
                           </td>
                           <td>
                               ${output.note}
                           </td>
                           <td>
                               <form action="formDataDeviceOutput.jsp" method="get">
                                   <input name="id" value='${output.id}' type="hidden" />
                                   <button class="btn btn-dark w-100" type="submit">Uprav</button>
                               </form>
                           </td>
                           <td>
                               <form action="readDataDeviceOutputs.jsp" method="get">
                                   <input name="id" type="text" value="${output.deviceId.id}" hidden />
                                   <button class="btn btn-dark w-100" type="submit">Přejdi</button>
                               </form>
                           </td>
                       </tr> 
                   </c:forEach>
                   </tbody>
               </table>
            </div>
            </div>
            <div class="container my-3 py-2">
               <h4>Výpis kabelových hlav</h4>
               <div class="table-responsive">
               <table class="tabulka table table-striped table-bordered compact order-column tabulka_modra ">
                   <thead>
                       <tr>
                           <th>Kabelová hlava</th>
                           <th>Výstup</th>
                           <th>Tel. číslo</th>
                           <th>Poznámka</th>
                           <th>Výstup</th>
                           <th>Kabelová hlava</th>
                       </tr>
                   </thead>
                   <tbody>
                   <c:set var="outputs" value="<%=request.getSession().getAttribute(
                        "findPhoneNumberCableHeadOutputs")%>" />
                   <c:forEach var="output" items="${outputs}">
                       <tr> 
                           <td>
                               ${output.cableheadId.name}
                           </td>
                           <td>
                               ${output.cabheadout}
                           </td>
                           <td>
                               ${output.phonenumber}
                           </td>
                           <td>
                               ${output.note}
                           </td>
                           <td>
                               <form action="formCableHeadOutput.jsp" method="get">
                                   <input name="id" value='${output.id}' type="hidden" />
                                   <button class="btn btn-dark w-100" type="submit">Uprav</button>
                               </form>
                           </td>
                           <td>
                               <form action="readCableHeadOutputs.jsp" method="get">
                                   <input name="id" type="text" value="${output.cableheadId.id}" hidden />
                                   <button class="btn btn-dark w-100" type="submit">Přejdi</button>
                               </form>
                           </td>
                       </tr> 
                    </c:forEach>
                    </tbody>
                </table>
               </div>
            </div>
            <div class="container my-3 py-3">
               <h4>Výpis PBX</h4>
               <div class="table-responsive">
               <table class="tabulka table table-striped table-bordered tabulka_modra">
                   <thead>
                       <tr>
                           <th>PBX</th>
                           <th>Výstup</th>
                           <th>Tel. číslo</th>
                           <th>Analog/Digital</th>
                           <th>Poznámka</th>
                           <th>Výstup</th>
                           <th>PBX</th>
                       </tr>
                   </thead>
                   <tbody>
                   <c:set var="outputs" value="<%=request.getSession().getAttribute(
                        "findPhoneNumberPbxOutputs")%>" />
                   <c:forEach var="output" items="${outputs}">
                       <tr>
                           <td>
                               ${output.pbxId.name}
                           </td>
                           <td>
                               ${output.pbxout}
                           </td>
                           <td>
                               ${output.phonenumber}
                           </td>
                           <td>
                               ${output.technologytype}
                           </td>
                           <td>
                                ${output.note}
                           </td>
                           <td>
                               <form action="formPBXOutput.jsp" method="get">
                                   <input name="id" value='${output.id}' type="hidden" /> 
                                   <button class="btn btn-dark w-100" type="submit">Uprav</button>
                               </form>
                           </td>
                           <td>
                               <form action="readPBXOutputs.jsp" method="get">
                                   <input name="id" type="text" value="${output.pbxId.id}" hidden />
                                   <button class="btn btn-dark w-100" type="submit">Přejdi</button>
                               </form>
                           </td>              
                       </tr> 
                   </c:forEach>
                   </tbody>
               </table>
               </div>
            </div>
            <div class="container my-3 py-3">
                <h4>Výpis telefonních ústředen</h4>
                <div class="table-responsive">
                <table class="tabulka table table-striped table-bordered tabulka_modra">
                    <thead>
                        <tr>
                            <th>Tel. ústředna</th>
                            <th>Výstup</th>
                            <th>Jméno</th>
                            <th>Tel. číslo</th>
                            <th>Analog/Digital</th>
                            <th>Poznámka</th>
                            <th>Výstup</th>
                            <th>Telefonní ústředna</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="outputs" value="<%=request.getSession().getAttribute(
                             "findPhoneNumberHwPositions")%>" />
                        <c:forEach var="output" items="${outputs}">
                            <tr> 
                                <td>
                                    ${output.telechangeId.name}
                                </td>
                                <td>
                                    ${output.telexchangeoutput}
                                </td>
                                <td>
                                    ${output.name}
                                </td>
                                <td>
                                    ${output.phonenumber}
                                </td>
                                <td>
                                    ${output.technologytype}
                                </td>
                                <td>
                                    ${output.note}
                                </td>
                                <td>
                                    <form action="formTelExchangeOutput.jsp" method="get">
                                        <input class="form-control" name="id" value='${output.id}' type="hidden" />
                                        <button class="btn btn-dark w-100" type="submit">Uprav</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="readTelExchangeOutputs.jsp" method="get">
                                        <input class="form-control" name="id" value='${output.telechangeId.id}' type="hidden" />
                                        <button class="btn btn-dark w-100" type="submit">Přejdi</button>
                                    </form>
                                </td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
                </div>
            </div>
        </main>
    </body>
</html>
