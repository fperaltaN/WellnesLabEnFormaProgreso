using DataTicketChart.Models.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models.Dao;
using WebApplication1.Models.Domain;

namespace WebApplication1.Models.Rules
{
    public class ChartDataRules
    {
        public List<TblHistorialPeso> GetChartData(int client)
        {
            ChartDataDao chartData = new ChartDataDao();
            return chartData.getChartData(client);
        }
        
    }
}