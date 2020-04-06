<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tabulka" class="table table-striped table-bordered">
    <thead>
      <tr>
        <th>PBX</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=pbx.getPbxoutputList() %>" />
        <c:forEach var="output" items="${outputs}">
            <tr> 
                <form action="editPBXOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.pbxId.name}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.pbxout}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.phonenumber}
                      </div>
                      <input name="phonenumber" type="tel" value='${output.phonenumber}' required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />
                  </td>
                  <td>
                    <select name="technologytype" id="technologytype" class="form-control" >
                        <option value="${output.technologytype}">${output.technologytype}</option>
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
        <th>PBX</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav</th>
      </tr>
    </tfoot>
</table>