var CABLEDEL = {
  toDelete: function(id){

    $.ajax({
      url:"deleteCableHeadForJS.jsp", 
      data:{ id:id},
      success: function(data){
        alert(data);
      }
    });
  }
};
  
$(document).ready(function() {
  $("#deleteCableHead").click(function(){  
  let id = document.getElementById("id").value;
    CABLEDEL.toDelete(id);
  });
});
