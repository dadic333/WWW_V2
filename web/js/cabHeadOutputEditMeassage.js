        $(document).ready(function() {
            var type = "<%=type%>";
            var name = "<%=name%>";
            var id = "<%=strId%>";
            var cabHeadName = "<%=cabHeadName%>";
            var delDev = "delete";
            var editDev = "edit";
            var newDev = "new";
            var string;
            
            if(type===delDev){
                string = ("VYMAZÁNA kabelová hlava jménem:  "+name+";   ID: "+id+"  .");
                alert(string);}
            if(type===editDev){
                var entity = ("<div class=\"container py-2 my-2 message\" id=\"message\" style=\"charset=utf-8;\">\"UPRAVEN výstupu číslo:  "+name+";   na Kabelové hlavě: "+cabHeadName+"\"</div>");
                string = ("UPRAVENA kabelová hlava jménem:  "+name+";   ID: "+id+"  .");
                document.getElementById("message").innerHTML = entity;}
            if(type===newDev){
                var entity = ("<div class=\"container py-2 my-2 message\" id=\"message\">\"VYTVOŘENA kabelová hlava jménem: "+name+";   ID: "+id+"\"</div>");
                string = ("VYTVOŘENA kabelová hlava jménem: "+name+";   ID: "+id+"  .");
                document.getElementById("message").innerHTML = entity;}
        });
