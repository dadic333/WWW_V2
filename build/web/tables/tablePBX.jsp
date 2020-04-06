<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tabulka" class="table table-striped table-bordered" cellspacing="0" width="100%" >
    <thead>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>Počet výstupů</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="devices" value="<%= moje.appLayer.PbxBO.getAllPbx()%>"/>
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
                    ${device.outputcount}
                </td>
            </tr> 
        </c:forEach>
    </tbody>
    <tfoot>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>Počet výstupů</th>
      </tr>
    </tfoot>
</table>