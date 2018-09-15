using agenda_ssw_dtic.Models.Utils;
using DataTicketChart.Models.Domain;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models.Domain;

namespace WebApplication1.Models.Dao
{
    public class ChartDataDao
    {
        public List<TblHistorialPeso> getChartData(int idClient)
        {
            string nameStoredProcedure = "sel_HistorialPeso";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            cmd.Parameters.Add(new SqlParameter("@id_socio", idClient));
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<TblHistorialPeso> listPesos = SqlUtils.sqlToList<TblHistorialPeso>(sdr);
            conn.Close();
            return listPesos;
        }
    }
}