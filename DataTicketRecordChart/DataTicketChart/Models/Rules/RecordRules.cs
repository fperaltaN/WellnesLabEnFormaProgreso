using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models.Domain;
using WebApplication1.Models.Dao;
using DataTicketChart.Models.Domain;

namespace WebApplication1.Models.Rules
{
    public class RecordRules
    {
        public int SaveRecord(TblRecord client)
        {
            RecordDao record = new RecordDao();
            return record.SaveRecord(client);
        }
    }
}