<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <table id="tabulka" class="table table-striped table-bordered" cellspacing="0" width="100%" style="background-color: #9fcdff"> --%>
<table id="tabulka" class="table table-striped table-bordered">     
    <thead>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>Kab. hlava</th>
        <th>Výstupy / Edituj</th>
      </tr>
    </thead>
    <tbody>
    <c:set var="device" value="<%= moje.appLayer.CableHeadBO.getCableheadByID(Integer.parseInt(request.getParameter("id"))) %>"/>
        <tr> 
            <form action="editCableHeadForm.jsp" method="get">
              <td>
                  <input  name="id" value='${device.id}' type="hidden" />${device.id}
              </td>
              <td>
                ${device.name}
                <input  name="name" type="text" value='${device.name}' required maxlength="59" />
              </td>
              <td>
                      ${device.building}
                      <input  name="building" type="text" value='${device.building}' required maxlength="49" />
              </td>
              <td>
                      ${device.note}
                      <input  name="note" type="text" value='${device.note}' required maxlength="149" />
              </td>
              <td>
                  <button class="btn uprav" type="submit">Uprav</button>
              </td>
            </form>
            <form action="formCableHeadOutputs.jsp" method="post">
                <td>
                    <input class="form-control-lg" name="id" value='${device.id}' type="hidden" />  
                    <button class="btn uprav " type="submit" >
                        ${device.outputcount}
                        Uprav
                    </button>
                </td>
            </form>
        </tr> 
    </tbody>
    <tfoot>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>Kab. hlava</th>
        <th>Výstupy / Edituj</th>
      </tr>
    </tfoot>
</table>