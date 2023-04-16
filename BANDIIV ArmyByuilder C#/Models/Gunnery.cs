using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Gunnery
    {
        [Required]
        public Int32 GunId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Name { get; set; }

        [Required]
        public Int32 ServiceDate { get; set;}

        [Required]
        public Int32 ROF { get; set; }

        [Required]
        public Int32 ER { get; set; }

        [Required]
        public Int32 LR { get; set; }

        [Required]
        public Int32 Eff { get; set; }

        [Required]
        public Int32 Type { get; set; }

        [Required]
        public Int32 ShellEffect { get; set; }

    }

}
