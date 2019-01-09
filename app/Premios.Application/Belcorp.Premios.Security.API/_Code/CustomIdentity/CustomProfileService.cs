namespace Belcorp.Premios.Security.API.CustomIdentity
{
    using System.Security.Claims;
    using System.Threading.Tasks;
    using IdentityServer4.Extensions;
    using IdentityServer4.Models;
    using IdentityServer4.Services;
    using Microsoft.Extensions.Logging;
    using System.Collections.Generic;
    using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
    using System.Linq;
    using Belcorp.Premios.Infrastructure.CrossCutting.DTO;

    public class CustomProfileService : IProfileService
    {
        protected readonly ILogger Logger;
        private readonly IAuthenticationAppService _authenticationAppService;

        public CustomProfileService( 
            ILogger<CustomProfileService> logger, 
            IAuthenticationAppService authenticationAppService)
        {
            Logger = logger;
            _authenticationAppService = authenticationAppService;
        }




        public async Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            UserDetailProfile udp = null;

            await Task.Run(() => {
                udp = _authenticationAppService.getDetailProfile(context.Subject.GetSubjectId());
            });
            

            var claims = new List<Claim>
            {
                new Claim("name", context.Subject.GetSubjectId()),
                new Claim("external", udp.IsExternal.ToString()),
                new Claim("admin", udp.IsAdministrator.ToString())
            };
            context.IssuedClaims = claims;
        }

        public async Task IsActiveAsync(IsActiveContext context)
        {
            await Task.Run(() => {
                context.IsActive = true;
            });

        }
    }
}