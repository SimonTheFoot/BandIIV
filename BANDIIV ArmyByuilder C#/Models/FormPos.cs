using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class FormPos
    {
        [Required]
        public Int32 FormposId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

        [Required]
        [MaxLength(50)]
        public String v1 { get; set; }

    }
}
