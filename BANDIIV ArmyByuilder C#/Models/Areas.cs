using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace BandiIVWebApiGetter.Models
{
    public class Areas
    {
        [Required]
        [JsonPropertyName("areaName")]
        public string AreaName { get; set; }
        [Required]
        [JsonPropertyName("areaId")]
        public int AreaId { get; set; }

    }
}
