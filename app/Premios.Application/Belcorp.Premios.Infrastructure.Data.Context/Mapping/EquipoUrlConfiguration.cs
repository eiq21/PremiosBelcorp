using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class EquipoUrlConfiguration : IEntityTypeConfiguration<EquipoUrl>
    {
        public void Configure(EntityTypeBuilder<EquipoUrl> builder)
        {
            builder.ToTable("EquipoUrl");
            builder.HasKey(c => c.EquipoUrlId);

            builder.HasOne(p => p.Equipo)
                 .WithMany(b => b.EquipoUrls)
                 .HasForeignKey(p => p.EquipoId)
                 .HasConstraintName("FK_EquipoUrl_Equipo");

            builder.HasOne(p => p.TipoUrl)
                 .WithMany(b => b.EquipoUrls)
                 .HasForeignKey(p => p.TipoUrlId)
                 .HasConstraintName("FK_EquipoUrl_TipoUrl");
        }
    }
}
