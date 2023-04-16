using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Fate
    {
        [Required]
        public Int32 FateId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

    }
}
