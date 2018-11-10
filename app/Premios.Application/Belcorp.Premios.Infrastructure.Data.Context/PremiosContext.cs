using Belcorp.Premios.Infrastructure.Data.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Security.Claims;
using System.Security.Principal;
using System.Linq;
using Belcorp.Premios.Infrastructure.Data.Context.Mapping;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;

namespace Belcorp.Premios.Infrastructure.Data.Context
{
    public class PremiosContext : DbContext
    {
        private readonly IPrincipal _principal;

        public PremiosContext(DbContextOptions<PremiosContext> options, IPrincipal principal) : base (options)
        {
            _principal = principal as IPrincipal;
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.EnableAutoHistory(null);
            #region Configuraciones

            modelBuilder.ApplyConfiguration(new TipoUrlConfiguration());
            modelBuilder.ApplyConfiguration(new CampaniaConfiguration());
            modelBuilder.ApplyConfiguration(new CampaniaUrlConfiguracion());
            modelBuilder.ApplyConfiguration(new UsuarioAdminConfiguration());
            modelBuilder.ApplyConfiguration(new EquipoConfiguration());
            modelBuilder.ApplyConfiguration(new EquipoUrlConfiguration());
            modelBuilder.ApplyConfiguration(new VotacionConfiguration());
            modelBuilder.ApplyConfiguration(new UsuarioExternoConfiguration());

            #endregion

            base.OnModelCreating(modelBuilder);
        }
        public virtual DbSet<Campania> Campania { get; set; }
        public virtual DbSet<UsuarioAdmin> UsuarioAdmin { get; set; }
        public virtual DbSet<CampaniaUrl> CampaniaUrl { get; set; }
        public virtual DbSet<TipoUrl> TipoUrl { get; set; }
        public virtual DbSet<Equipo> Equipo { get; set; }
        public virtual DbSet<EquipoUrl> EquipoUrl { get; set; }
        public virtual DbSet<Votacion> Votacion { get; set; }
        public virtual DbSet<UsuarioExterno> UsuarioExterno { get; set; }

        public override int SaveChanges()
        {
            this.AuditEntities();
            return base.SaveChanges();
        }

        private void AuditEntities()
        {
            string userName = _principal.Identity.Name;
            DateTime now = DateTime.Now;

            foreach (EntityEntry entry in ChangeTracker.Entries())
            {
                // If the entity was added.
                if (entry.State == EntityState.Added)
                {
                    if (entry.Properties.Where(p => p.Metadata.Name.ToLower() == "UsuarioCreacion".ToLower()).Any())
                    {
                        entry.Property("UsuarioCreacion").CurrentValue = userName;
                    }
                    if (entry.Properties.Where(p => p.Metadata.Name.ToLower() == "UsuarioCreacion".ToLower()).Any())
                    {
                        entry.Property("FechaCreacion").CurrentValue = now;
                    }
                    if (entry.Properties.Where(p => p.Metadata.Name.ToLower() == "UsuarioModificacion".ToLower()).Any())
                    {
                        entry.Property("UsuarioModificacion").CurrentValue = userName;
                    }
                    if (entry.Properties.Where(p => p.Metadata.Name.ToLower() == "FechaModificacion".ToLower()).Any())
                    {
                        entry.Property("FechaModificacion").CurrentValue = now;
                    }
                }
                else if (entry.State == EntityState.Modified) // If the entity was updated
                {
                    entry.Property("FechaCreacion").IsModified = false;
                    entry.Property("UsuarioCreacion").IsModified = false;
                    if (entry.Properties.Where(p => p.Metadata.Name.ToLower() == "UsuarioModificacion".ToLower()).Any())
                    {
                        entry.Property("UsuarioModificacion").CurrentValue = userName;
                    }
                    if (entry.Properties.Where(p => p.Metadata.Name.ToLower() == "FechaModificacion".ToLower()).Any())
                    {
                        entry.Property("FechaModificacion").CurrentValue = now;
                    }
                }
            }
        }
    }
}
