$(document).ready(function() {
    $("#tabulka").DataTable( {
        stateSave: true,
        "language": {
            "lengthMenu": "Zobraz záznamů _MENU_",
            "zeroRecords": "Žádné záznamy nebyly nalezeny",
            "info": "Strana _PAGE_. z celkem _PAGES_ stran",
            "infoEmpty": "Záznam neexistuje",
            "infoFiltered": "(filtrováno z celkem _MAX_ záznamů)",
            "search": "Hledat:",
            "paginate": {
                "first":      "První",
                "last":       "Poslední",
                "next":       "Další",
                "previous":   "Předchozí"
            }
        }
    } );
    $(".tabulka").DataTable( {
        stateSave: true,
        "language": {
            "lengthMenu": "Zobraz záznamů _MENU_",
            "zeroRecords": "Žádné záznamy nebyly nalezeny",
            "info": "Strana _PAGE_. z celkem _PAGES_ stran",
            "infoEmpty": "Záznam neexistuje",
            "infoFiltered": "(filtrováno z celkem _MAX_ záznamů)",
            "search": "Hledat:",
            "paginate": {
                "first":      "První",
                "last":       "Poslední",
                "next":       "Další",
                "previous":   "Předchozí"
            }
        }
    } );
} );


