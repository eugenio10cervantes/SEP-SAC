//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SEP_SAC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Adjunto
    {
        public int archivo_id { get; set; }
        public int solicitud_id { get; set; }
        public int requerimiento_id { get; set; }
    
        public virtual Requerimiento Requerimiento { get; set; }
        public virtual Solicitud Solicitude { get; set; }
        public virtual Archivo Archivo { get; set; }
    }
}
