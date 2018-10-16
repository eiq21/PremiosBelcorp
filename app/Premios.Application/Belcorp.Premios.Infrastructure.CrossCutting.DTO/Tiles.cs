using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class Tiles
    {
        public int TeamUrlId { get; set; }
        public int TeamId { get; set; } 
        public int TypeUrlId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string VideoPreviewValueUrl { get; set; }
        public string ImageValueUrl { get; set; }
    }
}
