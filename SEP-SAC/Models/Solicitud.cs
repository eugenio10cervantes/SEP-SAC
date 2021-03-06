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
    
    public partial class Solicitud
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Solicitud()
        {
            this.Adjuntos = new HashSet<Adjunto>();
        }
    
        public int id { get; set; }
        public string solicitante_id { get; set; }
        public string numero_solicitud { get; set; }
        public int perfil_id { get; set; }
        public string resolucion_final { get; set; }
        public System.DateTime created { get; set; }
        public System.DateTime modified { get; set; }
        public string estatus { get; set; }
        public string entidad_federativa { get; set; }
        public string evaluador_id { get; set; }
    
        public virtual AspNetUsers Solicitante { get; set; }
        public virtual Perfil Perfiles1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Adjunto> Adjuntos { get; set; }
        public virtual PrimerasEvaluacione PrimerasEvaluacione { get; set; }
        public virtual SegundasEvaluacione SegundasEvaluacione { get; set; }
        public virtual TercerasEvaluacione TercerasEvaluacione { get; set; }
        public virtual Evaluador Evaluador { get; set; }
        public virtual SolicitudDeshechada SolicitudesDeshechada { get; set; }
        public virtual ColegioAsignado ColegioAsignado { get; set; }
        public virtual EvaluadoresAsignado EvaluadoresAsignado { get; set; }
    }
}
