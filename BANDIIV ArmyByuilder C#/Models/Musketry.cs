using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{



    public class Musketry
    {

        [Required]
        public Int32 RifleId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Name { get; set; }

        [Required]
        public Int32 ServiceDate { get; set; }

        [Required]
        public Int32 RPM { get; set; }

        [Required]
        public Int32 ER { get; set; }

        [Required]
        public Int32 LR { get; set; }

        [Required]
        public Int32 Eff{ get; set; }

        [Required]
        public Int32 Type { get; set; }

    }
}
