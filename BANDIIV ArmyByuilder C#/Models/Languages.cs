using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace BandiIVWebApiGetter.Models
{
    class Languages
    {
        [Required]
        [JsonPropertyName("LanguageId")]
        public int LanguageId { get; set; }
        [Required]
        [JsonPropertyName("LanguageName")]
        public string LanguageName { get; set; }

    }
}
