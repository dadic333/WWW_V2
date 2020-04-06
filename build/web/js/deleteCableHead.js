var CABLEDEL = {
  toDelete: function(id){
    $.ajax({
      url:"deleteCableHead.jsp", data:{ id:id},
      success: function(data){
        alert(data);
      }
    });
  }
};
  
$(document).ready(function() {
  $("#deleteCableHead").click(function(){  
  let id = document.getElementById("deleteId");
  console.log(id);
    CABLEDEL.toDelete(id);
  });
});


