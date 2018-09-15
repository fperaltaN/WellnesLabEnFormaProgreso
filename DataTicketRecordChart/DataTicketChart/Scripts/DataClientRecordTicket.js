/**
 * Funciones para view ClientRecordTicket
 * */
$.validator.setDefaults({
    submitHandler: function () {
        if ($('#client').val() == 0) {
            $('#client').focus();
        }else if ($('#employee').val() == 0) {
            $('#employee').focus();
        }
        else {
            saveRecordTicket();
        }
    }
});
/*
 * Carga las validaciónes y despliegas los datos iniciales con los que trabajar la aplicación
 */
$(document).ready(function () {
    var msg = " Este campo es requerido...";

    $('#form :input').prop("disabled", true);
    enableControlsTicket(true, "optionTicket");

    $('#client').on('change', function () {
        getTicket();
    });

    $("#saveClientTicketRecord").click(function () {
        saveRecordTicket();
    });


    $("#printTicketClient").click(function () {
        if ($('#employee').val() > 0) {
            saveTicket(1, $('#radioTicketCompleto').is(':checked'));
        } else { saveAlertError(" Seleccione quien realiza el registro..."); }
    });

    $("#sendTicketClient").click(function () {
        if ($('#employee').val() > 0) {
            sendMail(1, $('#radioTicketCompleto').is(':checked'));
        } else { saveAlertError(" Seleccione quien realiza el registro..."); }
    });

    $("#radioTicketCompleto").click(function () {
        enableControlsTicket(false,"ticket");
    });

    $("#radioTicketParcial").click(function () {
        enableControlsTicket(true, "ticket");
    });

    var validator = $("#form").validate({
        errorPlacement: function (error, element) {
            $(element)
                .closest("form")
                .find("label[for='" + element.attr("id") + "']")
                .append(error);
        },
        errorElement: "span",
        messages: {
            client: { required: msg },
            pliegueTricipal: { required: msg },
            pliegueEscapular: { required: msg },
            trigliceridos: { required: msg },
            Colesterol: { required: msg },
            Glucosa: { required: msg },
            frecuenciaCardiaca: { required: msg },
            frecuanciArtSisfolica: { required: msg },
            frecuanciArtDiasfolica: { required: msg },
            porcentajeCargaPecho: { required: msg },
            porcentajeCargaPierna: { required: msg },
            metabolismoBasal: { required: msg }
        }
    });
    $('#alert').hide();
    $('#alertError').hide();
    $('#client').focus();
    getClients();
    getEmployees();
});


/*
 * Realiza la petición para obtner el ultimo registro guardado
 */
function getTicket() {
    var client = $('#client').val();
    $('#form')[0].reset();
    ajaxPostCall("../DataTicket/getTicket", '{client: ' + client + '}')
        .done(function (response) {
            $('#form')[0].reset();
            enableControlsTicket(false, "optionTicket");
            disableForm();
            $.each(response, function (item, dataTicket) {
                $('#pliegueTricipal').val(dataTicket.pliegueTricipal);
                $('#pliegueEscapular').val(dataTicket.pliegueEscapular);
                $('#trigliceridos').val(dataTicket.trigliceridos);
                $('#Colesterol').val(dataTicket.Colesterol);
                $('#Glucosa').val(dataTicket.Glucosa);
                $('#frecuenciaCardiaca').val(dataTicket.frecuenciaCardiaca);
                $('#frecuanciArtSisfolica').val(dataTicket.frecuanciArtDiasfolica);
                $('#frecuanciArtDiasfolica').val(dataTicket.frecuanciArtDiasfolica);
                $('#porcentajeCargaPecho').val(dataTicket.porcentajeCargaPecho);
                $('#porcentajeCargaPierna').val(dataTicket.porcentajeCargaPierna);
                $('#metabolismoBasal').val(dataTicket.metabolismoBasal);
            });

        })
        .fail(function (ex) {
            saveAlertError("error al obtener el ultimo regitro de Calculos Musculares."); 
            console.log(ex.innerHTML + "error al obtener el ultimo regitro de Calculos Musculares.");
        });
}
/*
 * Realiza la petición para salvar los nuevos registro de progreso
 */
function saveRecordTicket() {
    var client = $('#client').val();
    var pliegueTricipal = $('#pliegueTricipal').val();
    var pliegueEscapular = $('#pliegueEscapular').val();
    var trigliceridos = $('#trigliceridos').val();
    var Colesterol = $('#Colesterol').val();
    var Glucosa = $('#Glucosa').val();
    var frecuenciaCardiaca = $('#frecuenciaCardiaca').val();
    var frecuanciArtSisfolica = $('#frecuanciArtSisfolica').val();
    var frecuanciArtDiasfolica = $('#frecuanciArtDiasfolica').val();
    var porcentajeCargaPecho = $('#porcentajeCargaPecho').val();
    var porcentajeCargaPierna = $('#porcentajeCargaPierna').val();
    var metabolismoBasal = $('#metabolismoBasal').val();

    var param = "";
    param = '{ client: ' + client + ', ' +
        ' pliegueTricipal:' + pliegueTricipal + ', ' +
        ' pliegueEscapular:' + pliegueEscapular + ', ' +
        ' trigliceridos:' + trigliceridos + ', ' +
        ' Colesterol:' + Colesterol + ', ' +
        ' Glucosa:' + Glucosa + ', ' +
        ' frecuenciaCardiaca: ' + frecuenciaCardiaca + ', ' +
        ' frecuanciArtSisfolica:' + frecuanciArtSisfolica + ', ' +
        ' frecuanciArtDiasfolica:' + frecuanciArtDiasfolica + ', ' +
        ' porcentajeCargaPecho:' + porcentajeCargaPecho + ', ' +
        ' porcentajeCargaPierna: ' + porcentajeCargaPierna + ', ' +
        ' metabolismoBasal :' + metabolismoBasal + '}';
    ajaxPostCall("../DataTicket/saveMuscularCal", param)
        .done(function (response) {
            console.log(response);
            if (response) {
                $('#client').focus();
                $('#client').val(0);
                $('#form')[0].reset();
                enableControlsTicket(true, "optionTicket");
                disableForm();
                saveAlert("Registro Agregado con éxito");
            }
        })
        .fail(function (ex) {
            saveAlertError("error salvando la información saveMuscularCal");
            console.log(ex.innerHTML + "error salvando la información:saveMuscularCal");
        });
}


