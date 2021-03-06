
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
    
public partial class TblSocio
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public TblSocio()
    {

        this.TblHistorialPeso = new HashSet<TblHistorialPeso>();

        this.TblRecordsSocio = new HashSet<TblRecordsSocio>();

        this.TblRecordTicket = new HashSet<TblRecordTicket>();

    }


    public int id_socio { get; set; }

    public int num_socio { get; set; }

    public string nombre { get; set; }

    public string ap_paterno { get; set; }

    public string ap_materno { get; set; }

    public string direccion { get; set; }

    public System.DateTime fecha_registro { get; set; }

    public System.DateTime fecha_baja { get; set; }

    public bool activo { get; set; }

    public System.DateTime fecha_modificacion { get; set; }

    public string telefono { get; set; }

    public System.DateTime fecha_nacimiento { get; set; }

    public string compEstudios { get; set; }

    public string mail { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<TblHistorialPeso> TblHistorialPeso { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<TblRecordsSocio> TblRecordsSocio { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<TblRecordTicket> TblRecordTicket { get; set; }

}

}
