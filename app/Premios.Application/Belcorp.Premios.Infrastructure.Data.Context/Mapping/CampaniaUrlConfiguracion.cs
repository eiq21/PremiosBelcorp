using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class CampaniaUrlConfiguracion : IEntityTypeConfiguration<CampaniaUrl>
    {
        public void Configure(EntityTypeBuilder<CampaniaUrl> builder)
        {
            builder.ToTable("CampaniaUrl");
            builder.HasKey(c => c.CampaniaUrlId);

            builder.HasOne(p => p.Campania)
              .WithMany(b => b.CampaniaUrls)
              .HasForeignKey(p => p.CampaniaId)
              .HasConstraintName("FK_CampaniaUrl_Campania");

            builder.HasOne(p => p.TipoUrl)
              .WithMany(b => b.CampaniaUrls)
              .HasForeignKey(p => p.CampaniaId)
              .HasConstraintName("FK_CampaniaUrl_TipoUrl");
        }
    }
}
