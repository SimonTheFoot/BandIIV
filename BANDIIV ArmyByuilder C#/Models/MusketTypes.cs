using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class MusketType
    {
        [Required]
        public Int32 MusketID { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

    }
}
