using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
using Belcorp.Premios.Application.Context.AuthenticationModule.Specifications;
using Belcorp.Premios.Domain.Context.SecurityModule;
using Belcorp.Premios.Infrastructure.Agents.LDAP;
using Belcorp.Premios.Security.API._Code.ExceptionHandling;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.Security.API.InstanceProviders
{
    public static class ContainerProvider
    {
        public static IServiceCollection ConfigureDI(
            this IServiceCollection services)
        {
            ConfigureContainer(services);
            ConfigureFactories();
            ConfigureProviders(services);

            return services;
        }

        static void ConfigureContainer(IServiceCollection services)
        {
            services.AddTransient<IAuthenticationAppService, AuthenticationAppService>();
            services.AddTransient<ISecurityService, SecurityService>();
            //services.AddTransient<IUserAdapter, UserAdapter>();
            services.AddTransient<IUserSpecification, UserSpecification>();

            services.AddScoped<ApiExceptionFilter>();
            //services.AddScoped<IInfoRequest, InfoRequest>();
            //services.AddScoped<ApiActionFilter>();

            services.AddScoped<ILDAPAgent, LDAPAgent>();
        }

        static void ConfigureFactories()
        {

        }

        static void ConfigureProviders(IServiceCollection services)
        {

        }
    }
}
