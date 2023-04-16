using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Types
    {
        [Required]
        public Int32 TypeID { get; set; }

        [Required]
        [MaxLength(50)]
        public String Description { get; set; }

        [Required]
        [MaxLength(50)]
        public String SubUnit { get; set; }

        [Required]
        [MaxLength(50)]
        public String SPlural { get; set; }

        [Required]
        [MaxLength(50)]
        public String ISingular { get; set; }


        [Required]
        [MaxLength(50)]
        public String IPlural { get; set; }



        [Required]
        public Int32 BaseMovement { get; set; }

        [Required]
        public Int32 v2 { get; set; }

        [Required]
        public Int32 v3 { get; set; }

    }

}
