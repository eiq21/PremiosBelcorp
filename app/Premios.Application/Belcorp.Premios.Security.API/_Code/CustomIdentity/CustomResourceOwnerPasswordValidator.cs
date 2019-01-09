namespace Belcorp.Premios.Security.API.CustomIdentity
{
    using IdentityServer4.Validation;
    using IdentityModel;
    using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
    using System.Threading.Tasks;

    public class CustomResourceOwnerPasswordValidator : IResourceOwnerPasswordValidator
    {
        private readonly IAuthenticationAppService _authenticationAppService;

        public CustomResourceOwnerPasswordValidator(IAuthenticationAppService authenticationAppService)
        {
            _authenticationAppService = authenticationAppService;
        }

        public Task ValidateAsync(ResourceOwnerPasswordValidationContext context)
        {
            if (_authenticationAppService.ValidateUser(context.UserName, context.Password))
            {
                context.Result = new GrantValidationResult(context.UserName, OidcConstants.AuthenticationMethods.Password);
            }

            return Task.FromResult(0);
        }
    }
}
