using Belcorp.Premios.Infrastructure.Data.Context;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Belcorp.Premios.Application.Context.AuthenticationModule.Specifications
{
    public class UserSpecification : IUserSpecification
    {

        private readonly IUnitOfWork<PremiosContext> _unitOfWork;

        public UserSpecification(IUnitOfWork<PremiosContext> unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public bool IsAdministrator(string username)
        {
            bool isAdministrator = false;

            var user = (from u in _unitOfWork.DbContext.UsuarioAdmin
                         where u.CodUsuario.ToUpper() == username.ToUpper()
                         && !u.Eliminado
                         select u).FirstOrDefault();

            if (user != null)
            {
                isAdministrator = true;
            }

            return isAdministrator;
        }
    }
}
