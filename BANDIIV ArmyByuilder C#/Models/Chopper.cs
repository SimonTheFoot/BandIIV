using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Chopper
    {
        [Required]
        public Int32 ChopperId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description1 { get; set; }

        [Required]
        public Int32 vsInfantry { get; set; }

        [Required]
        public Int32 VsCavalry { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description2 { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description3 { get; set; }

    }

}
