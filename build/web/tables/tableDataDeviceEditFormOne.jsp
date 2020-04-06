<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<table id="tabulka" class="table table-striped table-bordered" cellspacing="0" width="100%" >
    <thead>
        <tr>
            <th colspan="5">Datový prvek</th>
            <th colspan="2">Výstupy</th>
        </tr>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>Datový prvek</th>
        <th>Počet</th>
        <th>Uprav</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="device" value="<%= request.getSession().getAttribute("newDataDevice")%>" />
            <tr class="edit" data-bindID="${device.id}"> 
            <form action="editDataDeviceForm.jsp" method="get">
              <td>
                  <input name="id" value="${device.id}" type="hidden" />
                  <div>
                      ${device.id}
                  </div>
                  <input name="dataDeviceOne" value="${device.id}" type="hidden" />
              </td>

              <td>
                  <div>
                      ${device.name}
                  </div>
                      <input name="name" type="text" value='${device.name}' required maxlength="59" />
              </td>
              <td>
                  <div>
                      ${device.building}
                  </div>
                      <input name="building" type="text" value='${device.building}' required maxlength="49" />
              </td>
              <td>
                  <div>
                      ${device.note}
                  </div>
                      <input name="note" type="text" value='${device.note}' required maxlength="149" />
              </td>
              <td>
                  <button class="btn uprav" type="submit" >
                      Uprav
                  </button>
              </td>
            </form>
            <form action="formDataDeviceOutputs.jsp" method="post">
                <td>
                    <input name="id" value='${device.id}' type="hidden" />
                    <div>
                        ${device.outputcount}
                    </div>
                </td>
                <td>
                    <button class="btn uprav" type="submit" >
                        <div>
                            Uprav
                        </div>
                    </button>
                </td>
            </form>
        </tr> 
    </tbody>
</table>

