
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace DataTicketChart.Models.Domain
{

using System;
    using System.Collections.Generic;
    
public partial class TblRecordSocio
{

    public int id_relation { get; set; }

    public Nullable<int> id_socio { get; set; }

    public Nullable<int> id_record { get; set; }



    public virtual TblRecord TblRecord { get; set; }

    public virtual TblSocio TblSocio { get; set; }

}

}
