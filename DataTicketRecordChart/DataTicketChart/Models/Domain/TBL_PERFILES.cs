
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
    
public partial class TBL_PERFILES
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public TBL_PERFILES()
    {

        this.TBL_USUARIOS = new HashSet<TBL_USUARIOS>();

    }


    public int ID_PERFIL { get; set; }

    public string PERFIL { get; set; }

    public bool ACTIVO { get; set; }

    public System.DateTime CREADO { get; set; }

    public string CREADOPOR { get; set; }

    public System.DateTime ACTUALIZADO { get; set; }

    public string ACTUALIZADOPOR { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<TBL_USUARIOS> TBL_USUARIOS { get; set; }

}

}
