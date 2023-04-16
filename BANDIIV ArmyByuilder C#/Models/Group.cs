using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Groups
    {
        [Required]
        [MaxLength(50)]
        public String AreaName { get; set; }

        [Required]
        public Int32 AreaID { get; set; }

    }

}

