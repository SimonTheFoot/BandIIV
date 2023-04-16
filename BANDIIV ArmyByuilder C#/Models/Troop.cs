using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Models
{
    public class Troop{

        [Required]
        public Int32 ArmyID { get; set; }

        [Required]
        public Int32 TroopID { get; set; }

        [Required]
        [MaxLength(50)]
        public String TroopName { get; set; }

        [Required]
        public Int32 TroopType { get; set; }

        [Required]
        public Int32 TroopClass { get; set; }

        [Required]
        public Int32 Experience { get; set; }

        [Required]
        public Int32 Formation { get; set; }

        [Required]
        public Int32 SubUnits { get; set; }

        [Required]
        public Int32 MeninSubUnit { get; set; }

        [Required]
        public Int32 NumberofGuns { get; set; }

        [Required]
        public Int32 PercentageWithPrimaryWeapon { get; set; }

        [Required]
        public Int32 SecondaryMissileWeapon { get; set; }

        [Required]
        public Int32 Armour { get; set; }

        [Required]
        public Int32 CommandControl { get; set; }

        [Required]
        public Int32 Confidence { get; set; }

        [Required]
        public Int32 Steadyness { get; set; }

        [Required]
        public Int32 Aggression { get; set; }

        [Required]
        public Int32 OfficerRank { get; set; }

        [Required]
        public Int32 PrimaryMissileWeapon { get; set; }

        [Required]
        public Int32 MeleeWeapon { get; set; }

        [Required]
        public Int32 FireDiscipline { get; set; }

        [Required]
        public Int32 Language { get; set; }

        [Required]
        public Int32 Ammo { get; set; }

    }
 
  
 
}
