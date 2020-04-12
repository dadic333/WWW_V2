var CABLE = {
  init: function(id){
    //var id=4;
    $.ajax({
    url:"getCableHead.jsp",
    data:{ id:id},
    success: function(data){
      console.log(data);
    }
    });
  },
  setData: function(id, name, building, note){
    $.ajax({
      url:"editCableHead.jsp", data:{ id:id, name:name, building:building, note:note},
      success: function(data){
        alert("Byla upravena kabelová hlava:  "+data);
      }
    });
  }
};
  
$(document).ready(function() {
  $("#sendData").click(function(){  
  var tr = $(this).parents("tr");
  var id = tr.attr("data-bindID").val();
  var name = tr.find("._nameCable").val();
  var building = tr.find("._buildingCable").val();
  var note = tr.find("._noteCable").val();
  console.log(id);
    CABLE.setData(id, name, building, note);
  });
});