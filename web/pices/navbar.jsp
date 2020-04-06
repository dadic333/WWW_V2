<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navbar start-->
<nav class="navbar navbar-expand-lg navbar-dark navbar-vlastniNav sticky-top z-index-1031">
    <a class="navbar-brand" href="index.jsp">
        <img src="pices/Logo_Kab1.jpg" width="110" height="50" rounded="8px" style="border: 4px; border-radius: 9px" class="d-inline-block align-top" alt="Logo">
    </a>   
        <!--
        <div id="logo">
            <a class="navbar-brand" href="index.jsp">
                <span style="font-size: 1.2rem">Kabelová kniha</span>
            </a>
        </div>
        -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarObsah" aria-controls="navbarObsah" aria-expanded="false" aria-label="Toggle navigation">             
    <span class="navbar-toggler-icon"></span>      
  </button>       
  <div class="collapse navbar-collapse" id="navbarObsah">             
    <ul class="navbar-nav ml-auto">  
<!--   položka navbar "Domů"
      <li class="nav-item active">                         
        <a class="nav-link" href="index.jsp">Domů<span class="sr-only">(current)</span></a>                  
      </li
-->     
        <li class="nav-item active">
          <a class="nav-link" href="readCableHeadsExp.jsp">Kabelové hlavy pokusný</a>                                          
        </li>  
        <li class="nav-item active">
          <a class="nav-link" href="readCableHeads.jsp">Kabelové hlavy</a>                                          
        </li>                     
        <li class="nav-item ">                         
          <a class="nav-link" href="readDataDevices.jsp">Datové prvky</a>                                           
        </li>  
        <li class="nav-item">                         
        <a class="nav-link" href="readPBXs.jsp">PBX</a>                                           
        </li>
        <li class="nav-item">                         
          <a class="nav-link" href="readTelExchanges.jsp">Telefonní ústředny</a>                                          
        </li>             
    </ul>             
    <form class="form-inline my-lg-0" action="findPhoneNumber.jsp">                   
        <input class="form-control mr-sm-2" type="tel" name="phoneNumber" placeholder="Vyhledat klapku" aria-label="Vyhledat" required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />                   
      <button class="btn btn-vyhledat my-2 my-sm-0" type="submit">
          Vyhledat             
      </button>   
    </form>       
  </div>
</nav> 
<!-- Navbar end--> 
