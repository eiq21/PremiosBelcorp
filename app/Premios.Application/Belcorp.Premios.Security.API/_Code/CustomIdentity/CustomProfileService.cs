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
            var esAdmin = _authenticationAppService.IsAdministrator(context.Subject.GetSubjectId());

            var claims = new List<Claim>
            {
                //new Claim("sub", user.UserId.ToString()),
                //new Claim("name", user.Username),
                //new Claim("givenname", user.FirstName),
                //new Claim("surname", user.LastName),
                //new Claim("preferred_username", user.Username),
                //new Claim("username", user.Username),
                //new Claim("email", user.Email),
                //new Claim("admin", user.ToString())
                 
                //new Claim("name", "Miguel Salvador"),
                new Claim("admin", esAdmin.ToString())
            };
          
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