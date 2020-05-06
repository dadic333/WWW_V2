<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tabulka" class="display" >
    <thead>
      <tr>
        <th>Datový prvek</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>MAC</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=dataDevice.getDataoutputList() %>" />
        <c:forEach var="output" items="${outputs}">
            <tr class="edit" data-bindID="${device.id}"> 
                <form action="editDataDeviceOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.deviceId.name}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.datadevout}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.phonenumber}
                      </div>
                      <input name="phonenumber" type="tel" value='${output.phonenumber}' required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />
                  </td>
                  <td>
                      <div>
                          ${output.mac}
                      </div>
                          <input name="mac" type="text" value='${output.mac}' required maxlength="17" />
                  </td>
                  <td>
                      <div>
                          ${output.note}
                      </div>
                          <input name="note" type="text" value='${output.note}' required maxlength="99" />
                  </td>
                  <td>
                      <button class="btn uprav" type="submit" >
                          Uprav
                      </button>
                  </td>
                </form>
            </tr> 
        </c:forEach>
    </tbody>
    <tfoot>
      <tr>
        <th>Datový prvek</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>MAC</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </tfoot>
</table>