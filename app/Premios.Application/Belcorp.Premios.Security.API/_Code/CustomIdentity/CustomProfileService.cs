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
            UserDetailProfile udp = _authenticationAppService.getDetailProfile(context.Subject.GetSubjectId());

            var claims = new List<Claim>
            {
                new Claim("name", context.Subject.GetSubjectId()),
                new Claim("external", udp.IsExternal.ToString()),
                new Claim("admin", udp.IsAdministrator.ToString())
            };


            //var claims = new List<Claim>
            //{
            //    new Claim("name", context.Subject.GetSubjectId()),
            //    new Claim("external", true.ToString()),
            //    new Claim("admin", true.ToString())
            //};

            context.IssuedClaims = claims;
        }

        public async Task IsActiveAsync(IsActiveContext context)
        {
            context.IsActive = true;
            /*var user = _authenticationAppService.GetUserById(int.Parse(context.Subject.GetSubjectId()));
            context.IsActive = user != null;*/
        }
    }
}