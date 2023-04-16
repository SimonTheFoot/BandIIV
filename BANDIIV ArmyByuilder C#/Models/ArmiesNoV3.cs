using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace BandiIVWebApiGetter.Models
{
    public class ArmiesNoV3
    {
        [Required]
        [JsonPropertyName("armyId")]
        public Int32 ArmyId { get; set; }

        [Required]
        [JsonPropertyName("armyName")]
        [MaxLength(50)]
        public String ArmyName { get; set; }

        [Required]
        [JsonPropertyName("v1")]
        public Int32 v1 { get; set; }

        [Required]
        [JsonPropertyName("language")]
        public Int32 Language { get; set; }

        [Required]
        [JsonPropertyName("type")]
        public Int32 Type { get; set; }

        [Required]
        [JsonPropertyName("group")]
        public int Group { get; set; }
    }
}
