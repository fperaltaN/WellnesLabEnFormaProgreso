using System;
using System.Collections.Generic;
using DataTicketChart.Models.Domain;
using System.Linq;
using System.Web;
using DataTicketChart.Models.Dao;

namespace DataTicketChart.Models.Rules
{
    public class EmployeeRules
    {
        public List<sel_empleado_new_result> getEmployees()
        {
            EmployeeDao employee = new EmployeeDao();
            return employee.getEmployees();
        }
        public List<TblEmpleado> getEmployeeById(int id_employee)
        {
            EmployeeDao employee = new EmployeeDao();
            return employee.getEmpleadoById(id_employee);
        }
    }
}