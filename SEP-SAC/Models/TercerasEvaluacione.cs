//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SEP_SAC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TercerasEvaluacione
    {
        public int solicitud_id { get; set; }
        public int archivo_id { get; set; }
        public string resultado { get; set; }
        public System.DateTime created { get; set; }
        public System.DateTime modified { get; set; }
    
        public virtual Archivo Archivo { get; set; }
        public virtual Solicitud Solicitude { get; set; }
    }
}