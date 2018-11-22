using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class VotacionConfiguration : IEntityTypeConfiguration<Votacion>
    {
        public void Configure(EntityTypeBuilder<Votacion> builder)
        {
            builder.ToTable("Votacion");
            builder.HasKey(c => c.VotacionId);

            builder.HasOne(p => p.Equipo)
                 .WithMany(b => b.Votacions)
                 .HasForeignKey(p => p.EquipoId)
                 .HasConstraintName("FK_Votacion_Equipo");

        }
    }
}
