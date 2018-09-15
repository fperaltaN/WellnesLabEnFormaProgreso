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
    public class ClientDao
    {

        public List<sel_socio_new_Result> getClients() {
            string nameStoredProcedure = "sel_socio_new";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<sel_socio_new_Result> listSocios = SqlUtils.sqlToList<sel_socio_new_Result>(sdr);
            conn.Close();
            return listSocios;
        }

        public List<TblSocio> getSocioByNumber(Int32 numberSocio)
        {
            string nameStoredProcedure = "[sel_byNumero_Checador]";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            SqlParameter param = new SqlParameter();
            param.ParameterName = "@num_empleado";
            param.Value = numberSocio;
            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<TblSocio> listSocios = SqlUtils.sqlToList<TblSocio>(sdr);
            conn.Close();
            return listSocios;
        }

        public List<TblSocio> getSocioById(Int32 idSocio)
        {
            string nameStoredProcedure = "[sel_byId_socio]";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            SqlParameter param = new SqlParameter();
            param.ParameterName = "@id_socio";
            param.Value = idSocio;
            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<TblSocio> listSocios = SqlUtils.sqlToList<TblSocio>(sdr);
            conn.Close();
            return listSocios;
        }


    }
}