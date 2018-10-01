using Belcorp.Premios.API._Code.ExceptionHandling;
using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
using Belcorp.Premios.Application.Context.MaintenanceModule.Service;
using Belcorp.Premios.Application.Core.Adapters;
using Belcorp.Premios.Domain.Context.SecurityModule;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API.InstanceProviders
{
    public static class ContainerProvider
    {

        public static IServiceCollection ConfigureDI(
            this IServiceCollection services)
        {
            ConfigureContainer(services);
            return services;
        }

        private static void ConfigureContainer(IServiceCollection services)
        {
            services.AddTransient<IAuthenticationAppService, AuthenticationAppService>();
            services.AddTransient<ICampaignAppService, CampaignAppService>();

            services.AddTransient<ICampaignAdapter, CampaignAdapter>();
            

            services.AddScoped<ApiExceptionFilter>();
        }
    }
}
