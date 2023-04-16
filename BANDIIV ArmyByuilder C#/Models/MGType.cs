using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class MGType
    {
        [Required]
        public Int32 TypeId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

    }

}
