using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Who
    {
        [Required]
        public Int32 WhoId { get; set; }

        [Required]
        [MaxLength(50)]
        public String v1 { get; set; }

    }
}
