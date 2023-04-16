using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{

        public class LanguageNames
        {
            [Required]
            public Int32 LanguageNameID { get; set; }

            [Required]
            [MaxLength(50)]
            public String Moniker { get; set; }

            [Required]
            public Int32 LanguageId { get; set; }

            [Required]
            public Int32 NamePosition { get; set; }

        }

}
