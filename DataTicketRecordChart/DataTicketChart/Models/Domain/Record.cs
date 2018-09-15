using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.Domain
{
    public class Record
    {
        public int IdClient { get; set; }

        public decimal pesoInicial { get; set; }
        public decimal pesoBajado { get; set; }
        public decimal pesoActual { get; set; }

        public decimal circCinturaInicial { get; set; }
        public decimal circCinturaBajado { get; set; }
        public decimal circCinturaActual { get; set; }

        public decimal circCaderaInicial { get; set; }
        public decimal circCaderaBajado { get; set; }
        public decimal circCaderaActual { get; set; }

        public decimal circPechoInicial { get; set; }
        public decimal circPechoBajado { get; set; }
        public decimal circPechoActual { get; set; }

        public decimal altura { get; set; }
        public string talla { get; set; }
        public decimal grasaCorporal { get; set; }

        public decimal edad { get; set; }
        public decimal frecCardicaMaxima { get; set; }
        public decimal frecCardicaReposo { get; set; }
        public decimal porceEntrenamiento { get; set; }

        public decimal imc { get; set; }
        public decimal pie { get; set; }
        public string guia { get; set; }
        public string observaciones { get; set; }
    }
}