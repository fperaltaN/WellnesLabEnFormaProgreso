/**
 * Funciones para view Index
 * */
$(document).ready(function () {
    $('#alert').hide();
    $('#alertError').hide();
    $('#client').focus();

    $('#client').on('change', function () {
        getChartData();
    });

    getClients();

    getChartData()

});

/*
 * obtiene los valores para obtener los gráficos
 */
function getChartData() {
    var num_socio = $('#client').val();
    num_socio = num_socio == null ? 1 : num_socio;
    ajaxPostCall("../DataTicket/GetChartData", '{client: ' + num_socio + '}')
        .done(function (response) {
            var datapeso = [];
            var dataalto = [];
            var databajo = [];
            var datapecho = [];

            $.each(response, function (item, datachart) {
                datapeso.push(datachart.prev_peso);
                dataalto.push(datachart.prev_alto);
                databajo.push(datachart.prev_bajo);
                datapecho.push(datachart.prev_pecho);
            });

            google.charts.load('current', { 'packages': ['corechart'] });
            google.charts.setOnLoadCallback(drawChart1);
            google.charts.setOnLoadCallback(drawChart2);
            google.charts.setOnLoadCallback(drawChart3);
            google.charts.setOnLoadCallback(drawChart4);
            function drawChart1() {
                var data = google.visualization.arrayToDataTable([
                    ['Previo', 'Peso'],
                    ['Previo 5', datapeso[4]],
                    ['Previo 4', datapeso[3]],
                    ['Previo 3', datapeso[2]],
                    ['Previo 2', datapeso[1]],
                    ['Previo 1', datapeso[0]]
                ]);
                var options = {
                    title: 'Peso',
                    legend: { position: 'bottom' }
                };
                var chart = new google.visualization.LineChart(document.getElementById('chartPeso'));
                chart.draw(data, options);
            }

            function drawChart2() {
                var data = google.visualization.arrayToDataTable([
                    ['Mes', 'Adbomen Alto'],
                    ['Previo 5', dataalto[4]],
                    ['Previo 4', dataalto[3]],
                    ['Previo 3', dataalto[2]],
                    ['Previo 2', dataalto[1]],
                    ['Previo 1', dataalto[0]]
                ]);
                var options = {
                    title: 'Adbomen Alto',
                    legend: { position: 'bottom' }
                };
                var chart = new google.visualization.LineChart(document.getElementById('chartAbdAlto'));
                chart.draw(data, options);
            }

            function drawChart3() {
                var data = google.visualization.arrayToDataTable([
                    ['Mes', 'Adbomen Bajo'],
                    ['Previo 5', databajo[4]],
                    ['Previo 4', databajo[3]],
                    ['Previo 3', databajo[2]],
                    ['Previo 2', databajo[1]],
                    ['Previo 1', databajo[0]]
                ]);
                var options = {
                    title: 'Adbomen Bajo',
                    legend: { position: 'bottom' }
                };
                var chart = new google.visualization.LineChart(document.getElementById('chartAbdBajo'));
                chart.draw(data, options);
            }

            function drawChart4() {
                var data = google.visualization.arrayToDataTable([
                    ['Mes', 'Pecho'],
                    ['Previo 5', datapecho[4]],
                    ['Previo 4', datapecho[3]],
                    ['Previo 3', datapecho[2]],
                    ['Previo 2', datapecho[1]],
                    ['Previo 1', datapecho[0]]
                ]);
                var options = {
                    title: 'Pecho',
                    legend: { position: 'bottom' }
                };
                var chart = new google.visualization.LineChart(document.getElementById('chartPecho'));
                chart.draw(data, options);
            }
        })
        .fail(function (ex) {
            saveAlertError("eerror Onteniendo la información de las gráficas getChartData"); 
            console.log(ex.innerHTML + "error Onteniendo la información de las gráficas:getChartData");
        });
}