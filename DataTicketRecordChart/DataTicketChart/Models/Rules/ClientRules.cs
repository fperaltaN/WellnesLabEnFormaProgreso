using DataTicketChart.Models.Dao;
using DataTicketChart.Models.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models.Dao;
using WebApplication1.Models.Domain;

namespace WebApplication1.Models.Rules
{
    public class ClientRules
    {
        public List<sel_socio_new_Result> getClients()
        {
            ClientDao clients = new ClientDao();
            return clients.getClients();
        }
        public List<TblSocio> getSocioByNumber(int number)
        {
            ClientDao clientData = new ClientDao();
            return clientData.getSocioByNumber(number);
        }

        public List<TblSocio> getSocioById(int number)
        {
            ClientDao clientData = new ClientDao();
            return clientData.getSocioById(number);
        }

        public List<Record> getDataClientRecord(int number)
        {
            RecordDao recordData = new RecordDao();
            return recordData.getDataClientRecord(number);
        }

        public int SaveRecordClientTicket(TblRecordTicket clientTicket)
        {
            ClientRecordTicketDAO clients = new ClientRecordTicketDAO();
            return clients.SaveRecordClientTicket( clientTicket);
        }
        public List<TblRecordTicket> getDataClientTicket(int number)
        {
            ClientRecordTicketDAO clientData = new ClientRecordTicketDAO();
            return clientData.getDataClientTicket(number);
        }
    }
}