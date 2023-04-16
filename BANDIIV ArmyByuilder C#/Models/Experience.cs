using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Experience
    {
        [Required]
        public Int32 ExperienceId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

        [Required]
        public Int32 v1 { get; set; }

        [Required]
        public Int32 v2 { get; set; }

        [Required]
        public Int32 v3 { get; set; }

        [Required]
        public Int32 v4 { get; set; }

    }


}
