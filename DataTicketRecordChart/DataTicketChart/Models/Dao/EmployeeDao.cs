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

namespace DataTicketChart.Models.Dao
{
    public class EmployeeDao
    {
        public List<TblEmpleado> getEmpleadoById(Int32 id_empleado)
        {
            string nameStoredProcedure = "[sel_byId_empleado]";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn);
            SqlParameter param = new SqlParameter();
            param.ParameterName = "@id_empleado";
            param.Value = id_empleado;
            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<TblEmpleado> listEmpleado = SqlUtils.sqlToList<TblEmpleado>(sdr);
            conn.Close();
            return listEmpleado;
        }

        public List<sel_empleado_new_result> getEmployees()
        {
            string nameStoredProcedure = "[sel_empleado_new]";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringSSW"].ConnectionString);
            SqlCommand cmd = new SqlCommand(nameStoredProcedure, conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            List<sel_empleado_new_result> listEmpleados = SqlUtils.sqlToList<sel_empleado_new_result>(sdr);
            conn.Close();
            return listEmpleados;
        }
    }
}