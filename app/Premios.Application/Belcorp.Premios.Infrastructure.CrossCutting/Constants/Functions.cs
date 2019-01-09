using System;
using System.Collections.Generic;
using System.Reflection;
using System.Resources;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.Constants
{
    public static class Functions
    {
        public static string GetMessage(string codigo)
        {
            return new ResourceManager("Belcorp.Premios.Infrastructure.CrossCutting.Constants.Messages", Assembly.GetExecutingAssembly()).GetString(codigo);
        }

    }
}
