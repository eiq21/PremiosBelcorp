using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class PagedParameter
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}
