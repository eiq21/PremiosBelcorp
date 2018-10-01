using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belcorp.Premios.Infrastructure.Data.Context;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Belcorp.Premios.Infrastructure.Data.Core.Extensions;
using Belcorp.Premios.Security.API.InstanceProviders;
using Belcorp.Premios.Security.API._Code.ExceptionHandling;
using Belcorp.Premios.Infrastructure.Security.CORS;
using System.Security.Cryptography.X509Certificates;
using System.IO;
using Belcorp.Premios.Security.API.CustomIdentity;

namespace Belcorp.Premios.Security.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IHostingEnvironment env)
        {
            Configuration = configuration;
            _environment = env;
        }


        private readonly IHostingEnvironment _environment;
        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services
                .AddDbContext<PremiosContext>(opt => opt.UseSqlServer(Configuration.GetConnectionString("PremiosDatabase")))
                .AddUnitOfWork<PremiosContext>();

            services.ConfigureDI();
            services.AddOptions();

            //services.Configure<LdapService>(Configuration.GetSection("ldap"));
            services.AddSecurity(Configuration);

            var cert = new X509Certificate2(
                Path.Combine(_environment.ContentRootPath, Configuration["IdentityServer:CertificateFile"]),
                Configuration["IdentityServer:CertificatePassword"],
                X509KeyStorageFlags.MachineKeySet);

            ConfigIdentity.Init(Configuration);

            services.AddIdentityServer()
                .AddSigningCredential(cert)
                .AddInMemoryIdentityResources(ConfigIdentity.GetIdentityResources())
                .AddInMemoryApiResources(ConfigIdentity.GetApiResources())
                .AddInMemoryClients(ConfigIdentity.GetClients())
                .AddCustomUserStore();

            //services.AddAuthentication("Bearer")
            //   .AddIdentityServerAuthentication(options =>
            //   {
            //       options.Authority = Configuration["IdentityServer:IdentityUrl"];
            //       options.RequireHttpsMetadata = false;
            //       options.ApiName = Constants.IdentityServer.API_RESOURCE_SECURITY;
            //   });

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseApiExceptionHandler();
            app.UseAllowAllCORS();
            app.UseIdentityServer();
            app.UseAuthentication();
            app.UseStaticFiles();

            app.UseMvc();
        }
    }
}
