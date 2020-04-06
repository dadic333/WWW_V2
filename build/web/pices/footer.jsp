<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <!-- footer start -->
  <footer class="footer rounded-top">
      <p style="margin-bottom: 0px">&copy; Jan Vrána 2019 
      <br>
      <script>
        datum = new Date();
        mesic = datum.getMonth() + 1;
        den = datum.getDate();
        rok = datum.getFullYear();
        hodina = datum.getHours();
        minuta = datum.getMinutes();
        sekunda = datum.getSeconds();
        document.write("Stránka byla vygenerována " + den + "." + mesic + "." + rok + ", " + hodina + ":" + minuta + ":" + sekunda + " hodin.");
      </script>
    </p> 
  </footer>
  <!-- footer end -->
