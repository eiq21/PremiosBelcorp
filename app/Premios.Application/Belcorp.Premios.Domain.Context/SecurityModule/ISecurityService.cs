using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Domain.Context.SecurityModule
{
    public interface ISecurityService
    {
        bool IsAdministrator(string username);

    }
}
