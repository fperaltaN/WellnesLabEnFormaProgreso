/**
 * Funciones para view ClientRecord
 * */
$.validator.setDefaults({
    submitHandler: function () {
        if ($('#client').val() == 0) {
            $('#client').focus();
        } else if ($('#employee').val() == 0) {
            $('#employee').focus();
        } else {
            saveRecord();
        }
    }
});
/*
 * Carga las validaciónes y despliegas los datos iniciales con los que trabajar la aplicación
 */
$(document).ready(function () {
    //Obtenes la página para mandar las peticiones correspondientes.
    //var value = '@Request.RequestContext.HttpContext.Session["someKey"]';
    var msg = " Este campo es requerido...";

    $('#form :input').prop("disabled", true);
    enableControlsTicket(true, "optionCustom");

    $('#client').focus();

    $('#client').on('change', function () {
        getTextBoxData();        
    });
    $('#frecCardicaReposo').val('220');

    $('.calc').change(function () {
        $('.calc').each(function () {
            if ($(this).val() != '') {
                autoCalculate($(this).attr("id"));
            }
        });

    });


    $("#printTicket").click(function () {
        if ($('#employee').val() > 0) {
            saveTicket(2, $('#customRadioCompleto').is(':checked'));
        } else { saveAlertError(" Seleccione quien realiza el registro...");}
    });

    $("#sendTicket").click(function () {
        if ($('#employee').val() > 0) {
            sendMail(2, $('#customRadioCompleto').is(':checked'));
        } else { saveAlertError(" Seleccione quien realiza el registro..."); }
    });

    $("#customRadioCompleto").click(function () {
        enableControlsTicket(false,"custom");
    });

    $("#customRadioParcial").click(function () {
        enableControlsTicket(true, "custom");
    });

    $("#customRadioHombre").click(function () {
        enableControlsTicket(false, "Hombre");
        autoCalculate("frecCardicaReposo");
    });

    $("#customRadioMujer").click(function () {
        enableControlsTicket(true, "Mujer");
        autoCalculate("frecCardicaReposo");
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
            pesoInicial: { required: msg },
            pesoBajado: { required: msg },
            pesoActual: { required: msg },
            circCinturaInicial: { required: msg },
            circCinturaBajado: { required: msg },
            circCinturaActual: { required: msg },
            circCaderaInicial: { required: msg },
            circCaderaBajado: { required: msg },
            circCaderaActual: { required: msg },
            circPechoInicial: { required: msg },
            circPechoBajado: { required: msg },
            circPechoActual: { required: msg },
            altura: { required: msg },
            talla: { required: msg },
            grasaCorporal: { required: msg },
            edad: { required: msg },
            frecCardicaMaxima: { required: msg },
            frecCardicaReposo: { required: msg },
            porceEntrenamiento: { required: msg },
            imc: { required: msg },
            pie: { required: msg },
            guia: { required: msg },
            observaciones: { required: msg }
        }
    });
    $('#alert').hide();
    $('#alertError').hide();
    $('#client').focus();
    getClients();
    getEmployees();
});


/*
 * Esta Función salva los nuevos valores para el progreso de socios
 */
function saveRecord() {
    var id_socio = $('#client').val();
    var pesoInicial = $('#pesoInicial').val();
    var pesoBajado = $('#pesoBajado').val();
    var pesoActual = $('#pesoActual').val();
    var circCinturaInicial = $('#circCinturaInicial').val();
    var circCinturaBajado = $('#circCinturaBajado').val();
    var circCinturaActual = $('#circCinturaActual').val();
    var circCaderaInicial = $('#circCaderaInicial').val();
    var circCaderaBajado = $('#circCaderaBajado').val();
    var circCaderaActual = $('#circCaderaActual').val();
    var circPechoInicial = $('#circPechoInicial').val();
    var circPechoBajado = $('#circPechoBajado').val();
    var circPechoActual = $('#circPechoActual').val();
    var altura = $('#altura').val();
    var talla = $('#talla').val();
    var grasaCorporal = $('#grasaCorporal').val();
    var edad = $('#edad').val();
    var frecCardicaMaxima = $('#frecCardicaMaxima').val();
    var frecCardicaReposo = $('#frecCardicaReposo').val();
    var porceEntrenamiento = $('#porceEntrenamiento').val();
    var imc = $('#imc').val();
    var pie = $('#pie').val();
    var guia = $('#guia').val();
    var observaciones = $('#observaciones').val();

    var param = "";
    param = '{ id_socio:' + id_socio + ', ' +
        ' pesoInicial:' + pesoInicial + ', ' +
        ' pesoBajado:' + pesoBajado + ', ' +
        ' pesoActual:' + pesoActual + ', ' +
        ' circCinturaInicial:' + circCinturaInicial + ', ' +
        ' circCinturaBajado:' + circCinturaBajado + ', ' +
        ' circCinturaActual:' + circCinturaActual + ', ' +
        ' circCaderaInicial:' + circCaderaInicial + ', ' +
        ' circCaderaBajado:' + circCaderaBajado + ', ' +
        ' circCaderaActual:' + circCaderaActual + ', ' +
        ' circPechoInicial:' + circPechoInicial + ', ' +
        ' circPechoBajado :' + circPechoBajado + ', ' +
        ' circPechoActual:' + circPechoActual + ', ' +
        ' altura:' + altura + ', ' +
        ' talla:"' + talla + '", ' +
        ' grasaCorporal:' + grasaCorporal + ', ' +
        ' edad:' + edad + ', ' +
        ' frecCardicaMaxima:' + frecCardicaMaxima + ', ' +
        ' frecCardicaReposo:' + frecCardicaReposo + ', ' +
        ' porceEntrenamiento:' + porceEntrenamiento + ', ' +
        ' imc:' + imc + ', ' +
        ' pie:' + pie + ', ' +
        ' guia:"' + guia + '", ' +
        ' observaciones:"' + observaciones + '"}';
    ajaxPostCall("../DataTicket/SaveRecord", param)
        .done(function (response) {
            console.log(response);
            if (response == -1) {
                $('#client').focus();
                $('#client').val(0);
                $('#form')[0].reset();
                enableControlsTicket(true, "optionCustom");
                disableForm();
                saveAlert("Registro Agregado con éxito");
            }
        })
        .fail(function (ex) {
            saveAlertError("error guardando el registro SaveRecord");
            console.log(ex.innerHTML + "error guardando el registro:SaveRecord");
             //console.log(ex.responseJSON);
            console.log(ex.responseText);
        });
}


/*
 * Esta Función obtiene los ultimos valores para el progreso de socios
 */
function getTextBoxData() {
    var num_socio = $('#client').val();
    ajaxPostCall("../DataTicket/getRecord", '{client: ' + num_socio + '}')
        .done(function (response) {
            $('#form')[0].reset();
            disableForm();
            enableControlsTicket(false, "optionCustom");
            $.each(response, function (item, dataRecord) {
                $('#pesoInicial').val(dataRecord.pesoInicial);
                $('#pesoBajado').val(dataRecord.pesoBajado);
                $('#pesoActual').val(dataRecord.pesoActual);
                $('#circCinturaInicial').val(dataRecord.circCinturaInicial);
                $('#circCinturaBajado').val(dataRecord.circCinturaBajado);
                $('#circCinturaActual').val(dataRecord.circCinturaActual);
                $('#circCaderaInicial').val(dataRecord.circCaderaInicial);
                $('#circCaderaBajado').val(dataRecord.circCaderaBajado);
                $('#circCaderaActual').val(dataRecord.circCaderaActual);
                $('#circPechoInicial').val(dataRecord.circPechoInicial);
                $('#circPechoBajado').val(dataRecord.circPechoBajado);
                $('#circPechoActual').val(dataRecord.circPechoActual);
                $('#altura').val(dataRecord.altura);
                $('#talla').val(dataRecord.talla);
                $('#grasaCorporal').val(dataRecord.grasaCorporal);
                $('#edad').val(dataRecord.grasaCorporal);
                $('#frecCardicaMaxima').val(dataRecord.grasaCorporal);
                $('#frecCardicaReposo').val(dataRecord.grasaCorporal);
                $('#porceEntrenamiento').val(dataRecord.grasaCorporal);
                $('#imc').val(dataRecord.imc);
                $('#pie').val(dataRecord.pie);
                $('#guia').val(dataRecord.guia);
                $('#observaciones').val(dataRecord.observaciones);
            });
        })
        .fail(function (ex) {
            saveAlertError("error obteniendo la información getTextBoxData");
            console.log(ex.innerHTML + "error obteniendo la información :getTextBoxData");
        });
}
/*
 *  Realiza los cálculos automaticamente, obtieniendo los valores bajados.
 */
function autoCalculate(id) {
    var total = 0;
    switch (id) {
        case "pesoActual":
            total = $('#pesoInicial').val() - $('#pesoActual').val();
            $('#pesoBajado').val(total);
            break;
        case "circCinturaActual":
            total = $('#circCinturaInicial').val() - $('#circCinturaActual').val();
            $('#circCinturaBajado').val(total);
            break;
        case "circCaderaActual":
            total = $('#circCaderaInicial').val() - $('#circCaderaActual').val();
            $('#circCaderaBajado').val(total);
            break;
        case "circPechoActual":
            total = $('#circPechoInicial').val() - $('#circPechoActual').val();
            $('#circPechoBajado').val(total);
            break;
        case "grasaCorporal":
            total = $('#pesoActual').val() / ($('#altura').val() * $('#altura').val());
            $('#imc').val(total);
            break;
        case "frecCardicaReposo": 
            if ($('#customRadioMujer').is(':checked')) {
                total = (226 - $('#edad').val()) * .8;
            } else { total = (220 - $('#edad').val()) * .8 }
            $('#frecCardicaMaxima').val(total);            
            break;
        case "frecCardicaMaxima":
            total = $('#porceEntrenamiento').val() * (($('#frecCardicaMaxima').val() - $('#frecCardicaReposo').val()) / 100)
            total = total + parseInt($('#frecCardicaReposo').val()) ;
            $('#pie').val(total);
            break;
        default:
            total = 0;
    }
}
