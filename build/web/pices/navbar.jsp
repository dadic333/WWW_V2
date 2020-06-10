<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navbar start-->
<nav class="navbar navbar-expand-lg navbar-dark navbar-vlastniNav sticky-top z-index-1031">
    <a class="navbar-brand" href="index.jsp">
        <img src="pices/Logo_Kab1.jpg" class="rounded " width="110" height="50" rounded="8px" alt="Logo">
    </a>   
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarObsah" aria-controls="navbarObsah" aria-expanded="false" aria-label="Toggle navigation">             
    <span class="navbar-toggler-icon"></span>      
  </button>   
  <div class="collapse navbar-collapse" id="navbarObsah">             
    <div class="navbar-nav d-flex flex-fill"> 
        <a href="readCableHeads.jsp" class="nav-link btn flex-fill btn-dark m-2" role="button">Kabelové hlavy</a>
        <a href="readDataDevices.jsp" class="nav-link btn flex-fill btn-dark m-2" role="button">Datové prvky</a>
        <a href="readPBXs.jsp" class="nav-link btn flex-fill btn-dark m-2" role="button">PBX</a>
        <a href="readTelExchanges.jsp" class="nav-link btn flex-fill btn-dark m-2" role="button">Telefonní ústředny</a>
    </div> 
    <div class=" m-2">
        <div class=" m-2">
            <form class="form-inline d-flex" action="findPhoneNumber.jsp">   
                  <div class="input-group flex-fill">
                    <input class="form-control" type="tel" name="phoneNumber" placeholder="Vyhledat klapku" aria-label="Vyhledat" required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />
                    <div class="input-group-append">
                      <button class="btn btn-success" type="submit">Vyhledat</button>  
                     </div>
                  </div>
            </form>  
        </div>
    <!--    <form class="form-inline my-lg-0" action="findPhoneNumber.jsp">                   
            <input class="form-control mr-sm-2" type="tel" name="phoneNumber" placeholder="Vyhledat klapku" aria-label="Vyhledat" required pattern="[0-9]{1,9}" title="Telefonní číslo má 1 - 9 číslic." />                   
          <button class="btn btn-vyhledat my-2 my-sm-0 mx-auto mx-sm-0" type="submit">
              Vyhledat             
          </button>   
        </form>  
    -->
    </div>
  </div>
</nav> 
<!-- Navbar end--> 
