using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Skill
    {
        [Required]
        public Int32 SkillId { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

        [Required]
        public Int32 Value { get; set; }
    }
}
