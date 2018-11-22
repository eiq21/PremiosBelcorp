﻿using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class Campania
    {
        public Campania()
        {

            CampaniaUrls = new HashSet<CampaniaUrl>();
            Equipos = new HashSet<Equipo>();
        }

        public int CampaniaId { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }
        public bool Eliminado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime? FechaModificacion { get; set; }


        public ICollection<CampaniaUrl> CampaniaUrls { get; set; }
        public ICollection<Equipo> Equipos { get; set; }

    }
}
