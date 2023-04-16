using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    class OfficerRank
    {

            [Required]
            public Int32 OfficerRankId { get; set; }

            [Required]
            [MaxLength(50)]
            public String Description { get; set; }

            [Required]
            public Int32 v1 { get; set; }

            [Required]
            public Int32 Influence { get; set; }

    }
}
