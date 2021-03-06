<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tabulka" class="table table-striped table-bordered" cellspacing="0" width="100%" >
    <thead>
      <tr>
        <th>Kabelová hlava</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=cabHead.getCabheadoutputList() %>" />
        <c:forEach var="output" items="${outputs}">
            <tr class="edit" data-bindID="${device.id}"> 
                <form action="editCableHeadOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.cableheadId.name}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.cabheadout}
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
        <th>Kabelová hlava</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </tfoot>
</table>