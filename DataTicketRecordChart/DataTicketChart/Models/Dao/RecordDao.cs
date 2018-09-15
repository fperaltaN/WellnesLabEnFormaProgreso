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
    public class RecordDao
    {
        public int SaveRecord(TblRecord client) {
            int result=-1;
            string nameStoredProcedure = "add_HistorialPesoSocio";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id_socio", client.id_record));
            cmd.Parameters.Add(new SqlParameter("@pesoInicial", client.pesoInicial));
            cmd.Parameters.Add(new SqlParameter("@pesoBajado", client.pesoBajado));
            cmd.Parameters.Add(new SqlParameter("@pesoActual", client.pesoActual));
            cmd.Parameters.Add(new SqlParameter("@circCinturaInicial", client.circCinturaInicial));
            cmd.Parameters.Add(new SqlParameter("@circCinturaBajado", client.circCinturaBajado));
            cmd.Parameters.Add(new SqlParameter("@circCinturaActual", client.circCinturaActual));
            cmd.Parameters.Add(new SqlParameter("@circCaderaInicial", client.circCaderaInicial));
            cmd.Parameters.Add(new SqlParameter("@circCaderaBajado", client.circCaderaBajado));
            cmd.Parameters.Add(new SqlParameter("@circCaderaActual", client.circCaderaActual));
            cmd.Parameters.Add(new SqlParameter("@circPechoInicial", client.circPechoInicial));
            cmd.Parameters.Add(new SqlParameter("@circPechoBajado", client.circPechoBajado));
            cmd.Parameters.Add(new SqlParameter("@circPechoActual", client.circPechoActual));
            cmd.Parameters.Add(new SqlParameter("@altura", client.altura));
            cmd.Parameters.Add(new SqlParameter("@talla", client.talla)); 
            cmd.Parameters.Add(new SqlParameter("@grasaCorporal", client.grasaCorporal) );
            cmd.Parameters.Add(new SqlParameter("@edad", client.edad));
            cmd.Parameters.Add(new SqlParameter("@frecCardicaMaxima", client.frecCardicaMaxima));
            cmd.Parameters.Add(new SqlParameter("@frecCardicaReposo", client.frecCardicaReposo));
            cmd.Parameters.Add(new SqlParameter("@porceEntrenamiento", client.porceEntrenamiento));
            cmd.Parameters.Add(new SqlParameter("@imc", client.imc));
            cmd.Parameters.Add(new SqlParameter("@pie", client.pie));
            cmd.Parameters.Add(new SqlParameter("@guia", client.guia));
            cmd.Parameters.Add(new SqlParameter("@observaciones", client.observaciones));

            conn.Open();
            result = cmd.ExecuteNonQuery();
            conn.Close();
            return result;
        }
        public List<Record> getDataClientRecord(int idClient)
        {
            string nameStoredProcedure = "sel_HistorialPesoSocio";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            cmd.Parameters.Add(new SqlParameter("@id_socio", idClient));
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<Record> listTicket = SqlUtils.sqlToList<Record>(sdr);
            conn.Close();
            return listTicket;
        }
    }
}