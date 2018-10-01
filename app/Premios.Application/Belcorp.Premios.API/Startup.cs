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
using Belcorp.Premios.API.InstanceProviders;
using Belcorp.Premios.Infrastructure.Security.CORS;
using Belcorp.Premios.API._Code.ExceptionHandling;
using Microsoft.AspNetCore.Http;
using System.Security.Principal;
using Belcorp.Premios.Infrastructure.CrossCutting.Constants;

namespace Belcorp.Premios.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddTransient<IPrincipal>(
                provider => provider.GetService<IHttpContextAccessor>().HttpContext.User);

            services
                .AddDbContext<PremiosContext>(opt => opt.UseSqlServer(Configuration.GetConnectionString("PremiosDatabase")))
                .AddUnitOfWork<PremiosContext>();
         
            services.ConfigureDI();
            services.AddOptions();

            services.AddAuthentication("Bearer")
               .AddIdentityServerAuthentication(options =>
               {
                   options.Authority = Configuration["IdentityServer:IdentityUrl"];
                   options.RequireHttpsMetadata = false;

                   options.ApiName = Constants.IdentityServer.API_RESOURCE_PROTOCOLS;
               });

            services.AddCors(o => o.AddPolicy("CorsPolicy", builder =>
            {
                builder
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .WithOrigins(Configuration["ClientSettings:ClientUrl"]);
            }));

            services.AddMvc()
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1)
                .AddJsonOptions(options =>
                {
                    options.SerializerSettings.ContractResolver = new Newtonsoft.Json.Serialization.DefaultContractResolver();
                });
            //services.AddDefaultAWSOptions(Configuration.GetAWSOptions());
            //services.AddAWSService<IAmazonS3>();
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
            app.UseCors("CorsPolicy");
            app.UseAuthentication();
            app.UseStaticFiles();
            app.UseMvc();
        }
    }
}
