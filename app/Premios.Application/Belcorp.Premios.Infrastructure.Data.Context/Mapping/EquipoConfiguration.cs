using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class EquipoConfiguration : IEntityTypeConfiguration<Equipo>
    {
        public void Configure(EntityTypeBuilder<Equipo> builder)
        {
            builder.ToTable("Equipo");
            builder.HasKey(c => c.EquipoId);

            builder.HasOne(p => p.Campania)
                 .WithMany(b => b.Equipos)
                 .HasForeignKey(p => p.CampaniaId)
                 .HasConstraintName("FK_Equipo_Campania");

        }
    }
}
