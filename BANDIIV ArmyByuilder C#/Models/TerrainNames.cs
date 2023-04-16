using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
        public class TerrainNames

        {
            [Required]
            public Int32 TerrainNameKey { get; set; }

            [Required]
            [MaxLength(50)]
            public String TerrainName { get; set; }

        }

}
