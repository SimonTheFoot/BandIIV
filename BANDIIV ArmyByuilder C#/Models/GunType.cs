using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class GunType
    {
        [Required]
        public Int32 GunID { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

    }

}
