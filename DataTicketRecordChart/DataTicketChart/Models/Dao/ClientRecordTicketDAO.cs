using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DataTicketChart.Models.Domain;
using agenda_ssw_dtic.Models.Utils;

namespace DataTicketChart.Models.Dao
{
    public class ClientRecordTicketDAO
    {
        public int SaveRecordClientTicket(TblRecordTicket clientTicket)
        {
            int result = -1;
            string nameStoredProcedure = "add_HistorialTicketSocio";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id_socio", clientTicket.id_socio));
            cmd.Parameters.Add(new SqlParameter("@pliegueTricipal", clientTicket.pliegueTricipal));
            cmd.Parameters.Add(new SqlParameter("@pliegueEscapular", clientTicket.pliegueEscapular));
            cmd.Parameters.Add(new SqlParameter("@trigliceridos", clientTicket.trigliceridos));
            cmd.Parameters.Add(new SqlParameter("@Colesterol", clientTicket.Colesterol));
            cmd.Parameters.Add(new SqlParameter("@Glucosa", clientTicket.Glucosa));
            cmd.Parameters.Add(new SqlParameter("@frecuenciaCardiaca", clientTicket.frecuenciaCardiaca));
            cmd.Parameters.Add(new SqlParameter("@frecuanciArtSisfolica", clientTicket.frecuanciArtSisfolica));
            cmd.Parameters.Add(new SqlParameter("@frecuanciArtDiasfolica", clientTicket.frecuanciArtDiasfolica));
            cmd.Parameters.Add(new SqlParameter("@porcentajeCargaPecho", clientTicket.porcentajeCargaPecho));
            cmd.Parameters.Add(new SqlParameter("@porcentajeCargaPierna", clientTicket.porcentajeCargaPierna));
            cmd.Parameters.Add(new SqlParameter("@metabolismoBasal", clientTicket.metabolismoBasal));

            conn.Open();
            result = cmd.ExecuteNonQuery();
            conn.Close();
            return result;
        }

        public List<TblRecordTicket> getDataClientTicket(int idClient)
        {
            string nameStoredProcedure = "sel_HistorialTicketSocio";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            cmd.Parameters.Add(new SqlParameter("@id_socio", idClient));
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<TblRecordTicket> listTicket = SqlUtils.sqlToList<TblRecordTicket>(sdr);
            conn.Close();
            return listTicket;
        }
    }
}