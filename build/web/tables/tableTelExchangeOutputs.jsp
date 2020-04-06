<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tabulka" class="table table-striped table-bordered" cellspacing="0" width="100%" >
    <thead>
      <tr>
        <th>Tel. ústředna</th>
        <th>Název HW pozice</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=telExchange.getHwpositionList() %>" />
        <c:forEach var="output" items="${outputs}">
            <tr> 
                <form action="editTelExchangeOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.telechangeId.name}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.name}
                      </div>
                          <input name="name" type="text" value='${output.name}' required maxlength="59" />
                  </td>
                  <td>
                      <div>
                          ${output.phonenumber}
                      </div>
                      <input name="phonenumber" type="tel" value='${output.phonenumber}' required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />
                  </td>
                  <td>
                    <select name="technologytype" id="technologytype" class="form-control" >
                        <option value="${output.technologytype} ">${output.technologytype}</option>
                        <option value="A">Analog</option>
                        <option value="D">Digital</option>
                    </select>
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
        <th>Tel. ústředna</th>
        <th>Název HW pozice</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </tfoot>
</table>