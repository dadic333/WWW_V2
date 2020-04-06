<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table class="table table-striped table-bordered" cellspacing="0" width="100%" >
    <thead>
      <tr>
        <th>Kabelová hlava</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>Poznámka</th>
        <th>Uprav</th>
        <th>Přejít na->Editace</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=request.getSession().getAttribute("findPhoneNumberCableHeadOutputs") %>" />
        <c:forEach var="output" items="${outputs}">
            <tr> 
                <form action="editCableHeadOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.cableheadId.name}
<%--novinka--%>                          <input name="phoneNumber" value="${output.phonenumber}" type="hidden" />
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
                  <td>
                      <form action="formCableHeadOutputs.jsp" method="get">
                            <%-- <input name="cableHeadFindPN" value="${output.cableheadId.id}" hidden /> --%>
                            <input name="id" type="text" value="${output.cableheadId.id}" hidden />
                            <button class="btn uprav" type="submit" >
                                Přejdi na kabel
                            </button>
                      </form>
                  </td>
            </tr> 
        </c:forEach>
    </tbody>
</table>
                  
<table class="table table-striped table-bordered" cellspacing="0" width="100%" style="background-color: #9fcdff">
    <thead>
      <tr>
        <th>Datový prvek</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>MAC</th>
        <th>Poznámka</th>
        <th>Uprav</th>
        <th>Přejít na->Editace</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=request.getSession().getAttribute("findPhoneNumberDataDeviceOutputs") %>" />
        <c:forEach var="output" items="${outputs}">
            <tr class="edit" data-bindID="${device.id}"> 
                <form action="editDataDeviceOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.deviceId.name}
<%--novinka--%>                          <input name="phoneNumber" value="${output.phonenumber}" type="hidden" />
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
                      <input name="phonenumber" type="number" value='${output.phonenumber}' required  maxlength="9" min="0" max="999999999"/>
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
                  <td>
                      <form action="formDataDeviceOutputs.jsp" method="get">
                        <%-- <input name="cableHeadFindPN" value="${output.cableheadId.id}" hidden /> --%>
                        <input name="id" type="text" value="${output.deviceId.id}" hidden />
                        <button class="btn uprav" type="submit" >
                            Přejdi na datový prvek
                        </button>
                      </form>
                  </td>
            </tr> 
        </c:forEach>
    </tbody>
</table>

<table class="table table-striped table-bordered" cellspacing="0" width="100%" style="background-color: #9fcdff">
    <thead>
      <tr>
        <th>PBX</th>
        <th>Výstup</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav a přejdi->Editace</th>
        <th>Přejít na->Editace</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=request.getSession().getAttribute("findPhoneNumberPbxOutputs") %>" />
        <c:forEach var="output" items="${outputs}">
            <tr> 
                <form action="editPBXOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.pbxId.name}
<%--novinka--%>                          <input name="phoneNumber" value="${output.phonenumber}" type="hidden" />                      
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
                      <input name="phonenumber" type="number" value='${output.phonenumber}' maxlength="9" min="0" max="999999999" required />
                  </td>
                  <td>
                    <select name="technologytype" id="technologytype" class="form-control" >
                        <option value="${output.technologytype}">${output.technologytype}</option>
                        <option value="A"><bold>a</bold>nalog</option>
                        <option value="D"><bold>d</bold>igital</option>
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
                    <td>
                      <form action="formPBXOutputs.jsp" method="get">
                        <input name="id" type="text" value="${output.pbxId.id}" hidden />
                        <button class="btn uprav" type="submit" >
                            Přejdi na PBX
                        </button>
                      </form>
                  </td>              
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
        <th>Uprav a přejdi->Editace</th>
        <th>Přejít na->Editace</th>
      </tr>
    </tfoot>
</table>
                  
<table class="table table-striped table-bordered" cellspacing="0" width="100%" style="background-color: #9fcdff">
    <thead>
      <tr>
        <th>Tel. ústředna</th>
        <th>Výstup</th>
        <th>Jméno</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav a přejdi->Editace</th>
        <th>Přejít na->Editace</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="outputs" value="<%=request.getSession().getAttribute("findPhoneNumberHwPositions") %>" />
        <c:forEach var="output" items="${outputs}">
            <tr> 
                <form action="editTelExchangeOutputs.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${output.id}' type="hidden" />${output.telechangeId.name}
                          <p>output.id...........${output.id}</p>
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.telexchangeoutput}
                      </div>
                  </td>
                  <td>
                      <div>
                          ${output.name}
                      </div>
                          <input name="name" type="text" value='${output.name}' required maxlength="9" />
                  </td>
                  <td>
                      <div>
                          ${output.phonenumber}
                      </div>
                      <input name="phonenumber" type="number" value='${output.phonenumber}' required maxlength="9" min="0" max="999999999" />
                  </td>
                  <td>
                    <select name="technologytype" id="technologytype" class="form-control" >
                        <option value="${output.technologytype}">${output.technologytype}</option>
                        <option value="A"><bold>A</bold> -analog</option>
                        <option value="D"><bold>D</bold> -digital</option>
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
        <th>Výstup</th>
        <th>Jméno</th>
        <th>Tel. číslo</th>
        <th>Analog/Digital</th>
        <th>Poznámka</th>
        <th>Uprav a přejdi->Editace</th>
        <th>Přejít na->Editace</th>
      </tr>
    </tfoot>
</table>