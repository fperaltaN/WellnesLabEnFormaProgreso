using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models.Rules;
using WebApplication1.Models.Domain;
using System.Web.Mvc;
using DataTicketChart.Models.Domain;
using DataTicketChart.Models.Rules;

namespace DataTicketChart.Controllers
{
    public class DataTicketController : Controller
    {
        /// <summary>
        /// Variables
        /// </summary>
        Mail objCorreo = new Mail();
        TicketSocioFile objTicket = new TicketSocioFile();
        ClientRules clientRules = new ClientRules();
        EmployeeRules employeeRules = new EmployeeRules();
        PDFTicket pdfticket = new PDFTicket();

        #region Views
        /// <summary>
        /// view para page Index
        /// </summary>
        /// <returns></returns>
        public ActionResult Index() => View();

        /// <summary>
        /// view para page ClientRecord
        /// </summary>
        /// <returns></returns>
        public ActionResult ClientRecord()
        {
            return View("ClientRecord");
        }

        /// <summary>
        /// view para page ClientRecordTicket
        /// </summary>
        /// <returns></returns>
        public ActionResult ClientRecordTicket()
        {
            return View("ClientRecordTicket");
        }
    #endregion Views

    #region Funcionalidad
        /// <summary>
        /// Obtiene el json de clientes para permitir el filtrado de la información por socio
        /// </summary>
        /// <returns></returns>
        public JsonResult GetClients()
        {
            ClientRules clientRules = new ClientRules();
            List<sel_socio_new_Result> listClients = clientRules.getClients();
            return Json(listClients);
        }

        /// <summary>
        /// Obtiene el json de clientes para permitir el filtrado de la información por socio
        /// </summary>
        /// <returns></returns>
        public JsonResult GetEmployees()
        {
            EmployeeRules employeeRules = new EmployeeRules();
            List<sel_empleado_new_result> listEmployees= employeeRules.getEmployees();
            return Json(listEmployees);
        }

        /// <summary>
        /// Guarda los datos del cliente, con ellos tenemos actualizado los valores de los gráficos y de 
        /// calculos actualizados para cuando se génere un nuevo registro
        /// </summary>
        /// <param name="client"></param>
        /// <param name="pesoInicial"></param>
        /// <param name="pesoBajado"></param>
        /// <param name="pesoActual"></param>
        /// <param name="circCinturaInicial"></param>
        /// <param name="circCinturaBajado"></param>
        /// <param name="circCinturaActual"></param>
        /// <param name="circCaderaInicial"></param>
        /// <param name="circCaderaBajado"></param>
        /// <param name="circCaderaActual"></param>
        /// <param name="circPechoInicial"></param>
        /// <param name="circPechoBajado"></param>
        /// <param name="circPechoActual"></param>
        /// <param name="altura"></param>
        /// <param name="talla"></param>
        /// <param name="grasaCorporal"></param>
        /// <param name="imc"></param>
        /// <param name="pie"></param>
        /// <param name="guia"></param>
        /// <param name="observaciones"></param>
        /// <returns></returns>
        public JsonResult SaveRecord(int id_socio, decimal pesoInicial, decimal pesoBajado, decimal pesoActual, decimal circCinturaInicial, decimal circCinturaBajado, decimal circCinturaActual, decimal circCaderaInicial,
            decimal circCaderaBajado, decimal circCaderaActual, decimal circPechoInicial, decimal circPechoBajado, decimal circPechoActual, decimal altura, string talla, decimal grasaCorporal, decimal edad, decimal frecCardicaMaxima,
            decimal frecCardicaReposo, decimal porceEntrenamiento, decimal imc, decimal pie, string guia, string observaciones)
        {
            TblRecord record = new TblRecord
            {
                id_record = id_socio,
                pesoInicial = pesoInicial,
                pesoBajado = pesoBajado,
                pesoActual = pesoActual,

                circCinturaInicial = circCinturaInicial,
                circCinturaBajado = circCinturaBajado,
                circCinturaActual = circCinturaActual,

                circCaderaInicial = circCaderaInicial,
                circCaderaBajado = circCaderaBajado,
                circCaderaActual = circCaderaActual,

                circPechoInicial = circPechoInicial,
                circPechoBajado = circPechoBajado,
                circPechoActual = circPechoActual,

                altura = altura,
                talla = talla,
                grasaCorporal = grasaCorporal,

                edad= edad,
                frecCardicaMaxima = frecCardicaMaxima,
                frecCardicaReposo = frecCardicaReposo,
                porceEntrenamiento = porceEntrenamiento,

                imc = imc,
                pie = pie,
                guia = guia,
                observaciones = observaciones
            };
            RecordRules recordRules = new RecordRules();
            int result = recordRules.SaveRecord(record);
            return Json(result);
        }

        /// <summary>
        /// Obtiene los valores que permiten la generación de los gráficos
        /// </summary>
        /// <param name="client"></param>
        /// <returns></returns>
        public JsonResult GetChartData(int client)
        {
            ChartDataRules chartDataRules = new ChartDataRules();
            List<TblHistorialPeso> chartData = chartDataRules.GetChartData(client);
            return Json(chartData);
        }

        /// <summary>
        /// Obtienes los valores para génerar el ticket
        /// </summary>
        /// <param name="client"></param>
        /// <returns></returns>
        public JsonResult getTicket(int client)
        {
            List<TblRecordTicket> recordTicketData = clientRules.getDataClientTicket(client);
            return Json(recordTicketData);
        }

        /// <summary>
        /// Obtiene el json por el socio elegido
        /// </summary>
        /// <param name="client"></param>
        /// <returns></returns>
        public JsonResult getRecord(int client)
        {
            List<Record> recordTicketData = clientRules.getDataClientRecord(client);
            return Json(recordTicketData);
        }

        /// <summary>
        /// Guarda el calculo del muscular del cliente
        /// </summary>
        /// <param name="client"></param>
        /// <param name="pliegueTricipal"></param>
        /// <param name="pliegueEscapular"></param>
        /// <param name="trigliceridos"></param>
        /// <param name="Colesterol"></param>
        /// <param name="Glucosa"></param>
        /// <param name="frecuenciaCardiaca"></param>
        /// <param name="frecuanciArtSisfolica"></param>
        /// <param name="frecuanciArtDiasfolica"></param>
        /// <param name="porcentajeCargaPecho"></param>
        /// <param name="porcentajeCargaPierna"></param>
        /// <param name="metabolismoBasal"></param>
        /// <returns></returns>
        public JsonResult saveMuscularCal(int client, decimal pliegueTricipal,
                    decimal pliegueEscapular, decimal trigliceridos, decimal Colesterol, decimal Glucosa,
                    decimal frecuenciaCardiaca, decimal frecuanciArtSisfolica, decimal frecuanciArtDiasfolica,
                    decimal porcentajeCargaPecho, decimal porcentajeCargaPierna, decimal metabolismoBasal)
        {
            try
            {
                TblRecordTicket recordTicketData = new TblRecordTicket();
                recordTicketData.id_socio = client;
                recordTicketData.pliegueTricipal = pliegueTricipal;
                recordTicketData.pliegueEscapular = pliegueEscapular;
                recordTicketData.trigliceridos = trigliceridos;
                recordTicketData.Colesterol = Colesterol;
                recordTicketData.Glucosa = Glucosa;
                recordTicketData.frecuenciaCardiaca = frecuenciaCardiaca;
                recordTicketData.frecuanciArtSisfolica = frecuanciArtSisfolica;
                recordTicketData.frecuanciArtDiasfolica = frecuanciArtDiasfolica;
                recordTicketData.porcentajeCargaPecho = porcentajeCargaPecho;
                recordTicketData.porcentajeCargaPierna = porcentajeCargaPierna;
                recordTicketData.metabolismoBasal = metabolismoBasal;

                int result = clientRules.SaveRecordClientTicket(recordTicketData);
                return Json(result);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        /// <summary>
        /// Guarda el Ticket del socio en formato txt
        /// </summary>
        /// <param name="client"></param>
        /// <returns></returns>
        public JsonResult saveTicket(int client, int option, int employee ,int complete)
        {
            Console.WriteLine("Mensaje a mostrar");
            //System.Windows.Forms.MessageBox.Show("Hola, mundo");
            switch (option)
            {
                case 1:
                    return Json(saveClientRecordTicket(client, (complete != 1 ? false : true),  employee));
                case 2:
                    return Json(saveClientRecord(client, (complete != 1 ? false : true),  employee));
                default:
                    return Json("Error opcion no valida para guardar el Ticket.");
            }
        }

        /// <summary>
        /// Envia un correo en formato del socio en formato html
        /// </summary>
        /// <param name="client"></param>
        /// <returns></returns>
        public JsonResult sendMail(int client, int option, int employee, int complete)
        {
            switch (option)
            {
                case 1:
                    return Json(sendMailRecordTicket(client, (complete != 1 ? false : true),  employee));
                case 2:
                    return Json(sendMailRecord(client, (complete != 1 ? false : true),  employee));
                default:
                    return Json("Error opcion no valida para guardar enviar el mail.");
            }
        }

        /// <summary>
        /// Guarda el ultimo registro del ticket del socio dado de alta "Custom"
        /// </summary>
        /// <param name="socio"></param>
        /// <returns></returns>
        private bool saveClientRecord(int socio, bool complete, int employee)
        {
            List<TblSocio> socioData = clientRules.getSocioById(socio);
            List<TblEmpleado> empleadoData = employeeRules.getEmployeeById(employee);
            List<Record> recordTicketData = clientRules.getDataClientRecord(socio);
            //bool impreso = objTicket.printTicketCustom(complete,socioData[0].num_socio.ToString(),
            //    socioData[0].nombre + " " + socioData[0].ap_materno + " " + socioData[0].ap_paterno, empleadoData[0].nombre + " " + empleadoData[0].ap_materno + " " + empleadoData[0].ap_paterno, recordTicketData[0]);
            bool impreso = pdfticket.printTicketCustom(complete, socioData[0].num_socio.ToString(),
                socioData[0].nombre + " " + socioData[0].ap_materno + " " + socioData[0].ap_paterno, empleadoData[0].nombre + " " + empleadoData[0].ap_materno + " " + empleadoData[0].ap_paterno, recordTicketData[0]);

            return impreso;
        }

        /// <summary>
        /// Guarda el ultimo registro del ticket del socio dado de alta "ClientRecordTicket"
        /// </summary>
        /// <param name="socio"></param>
        /// <returns></returns>
        public bool saveClientRecordTicket(int socio, bool complete, int employee) { 
            List<TblSocio> socioData = clientRules.getSocioById(socio);
            List<TblEmpleado> empleadoData = employeeRules.getEmployeeById(employee);
            List<TblRecordTicket> recordTicketData = clientRules.getDataClientTicket(socio);
            //bool impreso = objTicket.printTicketClientRecord(complete, socioData[0].num_socio.ToString(), 
            //    socioData[0].nombre + " " + socioData[0].ap_materno + " " + socioData[0].ap_paterno, empleadoData[0].nombre + " " + empleadoData[0].ap_materno + " " + empleadoData[0].ap_paterno, recordTicketData[0]);
            bool impreso = objTicket.printTicketClientRecord(complete, socioData[0].num_socio.ToString(),
                socioData[0].nombre + " " + socioData[0].ap_materno + " " + socioData[0].ap_paterno, empleadoData[0].nombre + " " + empleadoData[0].ap_materno + " " + empleadoData[0].ap_paterno, recordTicketData[0]);

            return impreso;
        }

        /// <summary>
        /// Envia el ultimo registro del mail del socio dado de alta "Custom"
        /// </summary>
        /// <param name="socio"></param>
        /// <returns></returns>
        private JsonResult sendMailRecord(int socio, bool complete, int employee)
        {
            List<TblSocio> socioData = clientRules.getSocioById(socio);
            List<TblEmpleado> empleadoData = employeeRules.getEmployeeById(employee);
            List<Record> recordTicketData = clientRules.getDataClientRecord(socio);
            String tempProgreso = objCorreo.descriptionProgressCustom(complete, socioData[0].num_socio.ToString(),
                socioData[0].nombre + " " + socioData[0].ap_materno + " " + socioData[0].ap_paterno, empleadoData[0].nombre + " " + empleadoData[0].ap_materno + " " + empleadoData[0].ap_paterno, recordTicketData[0]);
            objCorreo = new Mail(tempProgreso);
            objCorreo.mail = String.IsNullOrEmpty(socioData[0].mail) ? "" : socioData[0].mail;
            return Json(objCorreo.send(false));
        }

        /// <summary>
        /// Envia el ultimo registro del mail del socio dado de alta "ClientRecordTicket"
        /// </summary>
        /// <param name="socio"></param>
        /// <returns></returns>
        public JsonResult sendMailRecordTicket(int socio, bool complete, int employee)
        {
            List<TblSocio> socioData = clientRules.getSocioById(socio);
            List<TblEmpleado> empleadoData = employeeRules.getEmployeeById(employee);
            List<TblRecordTicket> recordTicketData = clientRules.getDataClientTicket(socio);
            String tempProgreso = objCorreo.descriptionProgressRecord(complete, socioData[0].num_socio.ToString(),
                socioData[0].nombre + " " + socioData[0].ap_materno + " " + socioData[0].ap_paterno, empleadoData[0].nombre + " " + empleadoData[0].ap_materno + " " + empleadoData[0].ap_paterno, recordTicketData[0]);
            objCorreo = new Mail(tempProgreso);
            objCorreo.mail = String.IsNullOrEmpty(socioData[0].mail) ? "" : socioData[0].mail;
            return Json(objCorreo.send(false));
        }

        
        #endregion Funcionalidad
    }
}