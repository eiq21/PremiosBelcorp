using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.AuthenticationModule.Specifications
{
    public interface IUserSpecification
    {
        bool IsAdministrator(string username);
    }
}
