using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Armies
    {
        [Required]

        public Int32 ArmyId { get; set; }

        [Required]
        [MaxLength(50)]
        public String ArmyName { get; set;}

        [Required]
        public Int32 v1 { get; set; }

        [Required]
        public Int32 Language { get; set; }

        [Required]
        public Int32 v3 { get; set; }

        [Required]
        public int Group { get; set; }

    }


}