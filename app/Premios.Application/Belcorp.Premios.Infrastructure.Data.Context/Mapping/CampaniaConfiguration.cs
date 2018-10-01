using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
 

namespace Belcorp.Premios.Infrastructure.Data.Context.Mapping
{
    public class CampaniaConfiguration : IEntityTypeConfiguration<Campania>
    {
        public void Configure(EntityTypeBuilder<Campania> builder)
        {
            builder.ToTable("Campania");
            builder.HasKey(c => c.CampaniaId);
        }
    }
}
