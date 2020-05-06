<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <div style="overflow-x:auto;">   --%>
    <table id="tabulka" class="table table-striped table-bordered compact order-column " style="background-color: #80bdff;">
        <thead>
          <tr>
            <th>Index</th>
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
                            <button class="btn btn-dark" type="submit">Uprav</button>
                        </form>
                    </td>
                    <td>
                        <form action="formCableHeadOutputs.jsp" method="post">
                            <input class="form-control-lg" name="id" value='${device.id}' type="hidden" />  
                            <button class="btn btn-dark" type="submit" >
                                ${device.outputcount}
                                / Uprav
                            </button> 
                        </form>
                    </td>
                    <td><button class="btn btn-dark" type="submit">Odstraň</button></td>
                </tr> 
            </c:forEach>
        </tbody>
        <tfoot>
          <tr>
            <th>Index</th>
            <th>Název</th>
            <th>Budova</th>
            <th>Poznámka</th>
            <th>Kab. hlava</th>
            <th>Výstupy / Edituj</th>
            <th>Odstraň</th>
          </tr>
        </tfoot>
    </table>
                                <%--</div>--%>