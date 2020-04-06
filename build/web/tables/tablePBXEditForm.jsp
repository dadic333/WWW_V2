<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tabulka" class="table table-striped table-bordered">
    <thead>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>PBX</th>
        <th>Výstupy / Edituj</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="devices" value="<%= moje.appLayer.PbxBO.getAllPbx() %>"/>
        <c:forEach var="device" items="${devices}">
            <tr class="edit" data-bindID="${device.id}"> 
                <form action="editPBXForm.jsp" method="get">
                  <td>
                      <div class="form-group">
                          <input class="form-control" name="id" value='${device.id}' type="hidden" />${device.id}
                      </div>
                  </td>
                  <td>${device.name}
                      <div class="form-group">
                          <input class="form-control" name="name" type="text" value='${device.name}' required maxlength="59" style="width: 100%; height: 100%" />
                      </div>
                  </td>
                  <td>${device.building}
                      <div class="form-group">
                          <input class="form-control" name="building" type="text" value='${device.building}' required maxlength="49" style="width: 100%; height: 100%" />
                      </div>
                  </td>
                  <td>${device.note}
                      <div class="form-group">
                          <input class="form-control" name="note" type="text" value='${device.note}' required maxlength="149" style="width: 100%; height: 100%" />
                      </div>
                  </td>
                  <td>
                      <button class="btn uprav" type="submit">Uprav</button>
                  </td>
                </form>
                <form action="formPBXOutputs.jsp" method="post">
                    <td>
                        <div class="form-group">
                            
                            <button class="btn uprav " type="submit" >
                                <input class="form-control-lg" name="id" value='${device.id}' type="hidden" />${device.outputcount}
                                <div>Uprav</div>
                            </button>
                        </div>
                    </td>
                </form>
            </tr> 
        </c:forEach>
    </tbody>
    <tfoot>
      <tr>
        <th>Index</th>
        <th>Název</th>
        <th>Budova</th>
        <th>Poznámka</th>
        <th>PBX</th>
        <th>Výstupy / Edituj</th>
      </tr>
    </tfoot>
</table>
                                
<%--                                 
                 <table>
      <tr>
       <th>Pořadí</th>
       <th>Index</th>
       <th>Název</th>
       <th>Budova</th>
       <th>Poznámka</th>
       <th>Počet výstupů</th>
       <th>Edituj výstupy</th>
      </tr>
      <% int i =0; %>
      <c:set var="devices" value="<%= moje.appLayer.PbxBO.getAllPbx() %>"/>
      <c:forEach var="device" items="${devices}">
        <tr class="edit" data-bindID="${device.id}"> 
        <form action="editPBXForm.jsp" method="get" >
          <td><%= i=i+1 %> </td>
          <td><input name="id" value='${device.id}' type="hidden" />${device.id}
          </td>
          <td><div>${device.name}</div>
              <input name="name" type="text" value='${device.name}' required style="width: 100%; height: 100%" />
          </td>
          <td><div>${device.building}</div>
              <input name="building" type="text" value='${device.building}' required style="width: 100%; height: 100%" />
          </td>
          <td><div>${device.note}</div>
              <input name="note" type="text" value='${device.note}' required style="width: 100%; height: 100%" />
          </td>
          <td>${device.outputcount}</td>
          <td><button type="submit" style="width: 100%; height: 100%">Uprav</button></td>
               

 
        </form>
        </tr> 
      </c:forEach>  
    </table>   
              
              --%>