
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------


namespace DataTicketChart.Models.Domain
{

using System;
    using System.Collections.Generic;
    
public partial class TblEmpleado
{

    public int id_empleado { get; set; }

    public int num_empleado { get; set; }

    public string nombre { get; set; }

    public string ap_paterno { get; set; }

    public string ap_materno { get; set; }

    public string direccion { get; set; }

    public System.DateTime fecha_registro { get; set; }

    public System.DateTime fecha_baja { get; set; }

    public bool activo { get; set; }

    public System.DateTime fecha_modificacion { get; set; }

    public int id_perfil { get; set; }

    public string telefono { get; set; }

}

}
