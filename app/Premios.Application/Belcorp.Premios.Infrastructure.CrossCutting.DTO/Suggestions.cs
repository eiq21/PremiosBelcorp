using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class Suggestions
    {
        public int TeamId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ValueUrl { get; set; }
    }
}
