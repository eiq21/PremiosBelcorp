using Belcorp.Premios.API._Code.ExceptionHandling;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API.Controllers
{
    //[ServiceFilter(typeof(ApiActionFilter))]
    [ServiceFilter(typeof(ApiExceptionFilter))]
    [Route("api/[controller]/[action]")]
    [EnableCors("AllowAllCORS")]
    [Authorize]
    public class BaseController : Controller
    {

    }
}
