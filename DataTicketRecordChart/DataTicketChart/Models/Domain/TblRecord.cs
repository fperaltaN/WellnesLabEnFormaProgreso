
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
    
public partial class TblRecord
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public TblRecord()
    {

        this.TblRecordsSocio = new HashSet<TblRecordsSocio>();

    }


    public int id_record { get; set; }

    public Nullable<decimal> pesoInicial { get; set; }

    public Nullable<decimal> pesoBajado { get; set; }

    public Nullable<decimal> pesoActual { get; set; }

    public Nullable<decimal> circCinturaInicial { get; set; }

    public Nullable<decimal> circCinturaBajado { get; set; }

    public Nullable<decimal> circCinturaActual { get; set; }

    public Nullable<decimal> circCaderaInicial { get; set; }

    public Nullable<decimal> circCaderaBajado { get; set; }

    public Nullable<decimal> circCaderaActual { get; set; }

    public Nullable<decimal> circPechoInicial { get; set; }

    public Nullable<decimal> circPechoBajado { get; set; }

    public Nullable<decimal> circPechoActual { get; set; }

    public Nullable<decimal> altura { get; set; }

    public string talla { get; set; }

    public Nullable<decimal> grasaCorporal { get; set; }

    public Nullable<decimal> edad { get; set; }

    public Nullable<decimal> frecCardicaMaxima { get; set; }

    public Nullable<decimal> frecCardicaReposo { get; set; }

    public Nullable<decimal> porceEntrenamiento { get; set; }

    public Nullable<decimal> imc { get; set; }

    public Nullable<decimal> pie { get; set; }

    public string guia { get; set; }

    public string observaciones { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<TblRecordsSocio> TblRecordsSocio { get; set; }

}

}
