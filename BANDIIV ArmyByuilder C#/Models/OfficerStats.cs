using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class OfficerStats
    {
        [Required]
        public Int32 ArmyId { get; set; }

        [Required]
        [MaxLength(100)]
        public String v1 { get; set; }

    }
}
