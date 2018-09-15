/**
 * Funciones comunes utilizadas por todos las páginas
 * */

 /*
 * Deshabilita los controles del form si no hay socio seleccionado
 */
    function disableForm() {
        if ($('#client').val() > 0) {
            $('#form :input').prop("disabled", false);
        }
        else {
            $('#form :input').prop("disabled", true);
        }
}
/*
 *  Muestra el mensaje de exito cuando la transacción es completada satisfactoria
 */
function saveAlert(message) {
    $('#message').text(message);
    $('#alert').slideToggle("slow", function () {
        window.setTimeout(function () { $('#alert').slideToggle("slow"); }, 5000);
    });
}

/*
 *  Muestra el mensaje de exito cuando la transacción es completada satisfactoria
 */
function saveAlertError(message) {
    $('#messageError').text("Error al guardar el registro:" + message);
    $('#alertError').slideToggle("slow", function () {
        window.setTimeout(function () { $('#alertError').slideToggle("slow"); }, 8000);
    });
}


/*
 * Realiza la petición para envio de correo
 */
function sendMail(option, complete) {
    var client = $('#client').val();
    var employee = $('#employee').val();
    var param = "";
    param = '{ client:' + client + ', ' +
        ' option:' + option + ', ' +
        ' employee:' + employee + ', ' +
        ' complete:"' + (complete ? 1 : 0) + '"}';
    ajaxPostCall("../DataTicket/sendMail", param)
        .done(function (response) {
            if(data == true) {
                saveAlert("El correo se mando correctamente para el socio:" + num_socio);
            } else { saveAlertError("No se pudo enviar el mail correctamente para el socio:" + client); }
            //alert("El correo se mando correctamente para el socio:" + client);
            console.log("corre enviado para el socio:" + client);
        })
        .fail(function (ex) {
            saveAlertError("error enviando el correo sendMail");
            console.log(ex.innerHTML + "error enviando el correo:sendMail");
        });
}
/*
 * Realiza la petición para salvar el ticket
 */
function saveTicket(option, complete) {
    var client = $('#client').val();
    var employee = $('#employee').val();
    var param = "";
    param = '{ client:' + client + ', ' +
        ' option:' + option + ', ' +
        ' employee:' + employee + ', ' +
        ' complete:"' + (complete ? 1:0) + '"}';
    ajaxPostCall("../DataTicket/saveTicket", param)
        .done(function (response) {
            if (response == true) {
                saveAlert("El ticket se genero correctamente para el socio:" + client);
            } else { saveAlertError("No se pudo guardar el ticket correctamente para el socio:" + client);}
            //alert("El ticket se genero correctamente para el socio:" + client);
            console.log("El ticket se genero correctamente para el socio:" + client);
        })
        .fail(function (ex) {
            saveAlertError("error creando el ticket-saveTicket");
            console.log(ex.innerHTML + "error creando el ticket:saveTicket");
        });
}

/*
 * Habilita o Deshabilita los controles de acuerdo al parametro dado
*/
function enableControlsTicket(enable, option) {
    switch (option) {
        case "custom":
            $("#circPechoInicial").prop('disabled', enable);
            $("#circPechoBajado").prop('disabled', enable);
            $("#circPechoActual").prop('disabled', enable);
            $("#grasaCorporal").prop('disabled', enable);
            $("#frecCardicaMaxima").prop('disabled', enable);
            $("#frecCardicaReposo").prop('disabled', enable);
            $("#porceEntrenamiento").prop('disabled', enable);
            $("#imc").prop('disabled', enable);
            $("#pie").prop('disabled', enable);
            if (enable) {
                $("#customRadioCompleto").prop("checked", !enable);
                $("#customRadioParcial").prop("checked", enable);
            } else {
                $("#customRadioCompleto").prop("checked", !enable);
                $("#customRadioParcial").prop("checked", enable);
            }
            break;
        case "ticket":
            $("#frecuenciaCardiaca").prop('disabled', enable);
            $("#frecuanciArtSisfolica").prop('disabled', enable);
            $("#frecuanciArtDiasfolica").prop('disabled', enable);
            $("#porcentajeCargaPecho").prop('disabled', enable);
            $("#porcentajeCargaPierna").prop('disabled', enable);
            $("#metabolismoBasal").prop('disabled', enable);
            if (enable) {
                $("#radioTicketCompleto").prop("checked", !enable);
                $("#radioTicketParcial").prop("checked", enable);
            } else {
                $("#radioTicketCompleto").prop("checked", !enable);
                $("#radioTicketParcial").prop("checked", enable);
            }
            break;
        case "optionCustom":
            $("#customRadioCompleto").prop("disabled", enable);
            $("#customRadioParcial").prop("disabled", enable);
            $("#printTicket").prop("disabled", enable);
            $("#sendTicket").prop("disabled", enable);
            break;
        case "optionTicket":
            $("#radioTicketCompleto").prop("disabled", enable);
            $("#radioTicketParcial").prop("disabled", enable);
            $("#printTicketClient").prop("disabled", enable);
            $("#sendTicketClient").prop("disabled", enable);
            break;
        case "Hombre":
            $("#customRadioHombre").prop("checked", !enable);
            $("#customRadioMujer").prop("checked", enable);
            break;
        case "Mujer":
            $("#customRadioHombre").prop("checked", !enable);
            $("#customRadioMujer").prop("checked", enable);
            break;
        default:
            break;
    }
}