function ajaxPostCall(url, data) {
    return $.ajax({
        type: "POST",
        url: url,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}


function getClients() {
    ajaxPostCall("../Dataticket/GetClients", '{ }')
        .done(function (response) {
            $('#client option').remove();
            $('#client').append('<option value=0>Seleccione un Socio...</option>');
            $.each(response, function (item, client) {
                $('#client').append('<option value=' + client.id_socio + '>' + client.num_socio + ' --- ' + client.nombre + ' ' + client.ap_paterno + ' ' + client.ap_materno + '</option>');
            });
        })
        .fail(function (ex) {
            console.log(ex.innerHTML);
        });
}

function getEmployees() {
    ajaxPostCall("../Dataticket/GetEmployees", '{ }')
        .done(function (response) {
            $('#employee option').remove();
            $('#employee').append('<option value=0>Seleccione un Empleado...</option>');
            $.each(response, function (item, employee) {
                $('#employee').append('<option value=' + employee.id_empleado + '>' + employee.num_empleado + ' --- ' + employee.nombre + ' ' + employee.ap_paterno + ' ' + employee.ap_materno + '</option>');
            });
        })
        .fail(function (ex) {
            console.log(ex.innerHTML);
        });
}