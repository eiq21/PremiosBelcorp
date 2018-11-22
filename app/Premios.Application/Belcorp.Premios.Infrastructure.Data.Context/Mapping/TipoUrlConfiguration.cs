using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class TipoUrlConfiguration : IEntityTypeConfiguration<TipoUrl>
    {
        public void Configure(EntityTypeBuilder<TipoUrl> builder)
        {
            builder.ToTable("TipoUrl");
            builder.HasKey(c => c.TipoUrlId);
        }
    }
}
