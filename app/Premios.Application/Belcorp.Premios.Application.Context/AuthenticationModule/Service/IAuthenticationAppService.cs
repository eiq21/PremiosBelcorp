using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.AuthenticationModule.Service
{
    public interface IAuthenticationAppService
    {
        bool ValidateUser(string username, string password);

        UserDetailProfile getDetailProfile(string username);
    }
}
