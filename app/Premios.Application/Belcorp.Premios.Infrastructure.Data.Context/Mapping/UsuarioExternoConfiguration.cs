using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class UsuarioExternoConfiguration : IEntityTypeConfiguration<UsuarioExterno>
    {
        public void Configure(EntityTypeBuilder<UsuarioExterno> builder)
        {
            builder.ToTable("UsuarioExterno");
            builder.HasKey(c => c.UsuarioExternoId);
        }
    }
}
