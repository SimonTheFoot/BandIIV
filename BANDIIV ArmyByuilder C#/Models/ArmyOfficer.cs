

//using BandiIVWebApiGetter.AbstractClasses;

namespace BandiIVWebApiGetter.Models
{
    [Serializable]
    public class ArmyOfficer //:ForceDroppable
    {
        public string OfficerName { get; set; }
        public string OfficerRankDescription { get; set; }
        public string OfficerNameAndRank => OfficerRankDescription.Trim() + " " + OfficerName;
        public int OfficerRole { get; set; }
        public string OfficerRoleDescription { get; set; }
        public int OfficerNameLanguage { get; set; }
        public string OfficerLanguage { get; set; }
        public int ArmyId { get; set; }
        public int OfficerRank { get; set; }
        public int OfficerAbility { get; set; }
        public int OfficerInfluence { get; set; }
        public int OfficerLoyal { get; set; }
        public int OfficerBrave { get; set; }
        public int OfficerType { get; set; }
        public int OfficerPopularity { get; set; }
        public int OfficerWounds { get; set; }
        public int Colours { get; set; }
        public int AnimalCount { get; set; }
        public int OfficerWith { get; set; }
        public int TroopType { get; set; }
        public int Armour { get; set; }
        public int TroopClass { get; set; }
        public int TroopExperience { get; set; }
        public int OriginalMorale { get; set; }
        public int Steadfastness { get; set; }
        public int FireDiscipline { get; set; }
        public int CommandControl { get; set; }
        public int BasicMoveDistance { get; set; }
        //public int NumberSubUnits { get; set; }
        //public int AOriginalGuns { get; set; }
        //public int AcceptableFormations { get; set; }
        public int Weapon { get; set; }
        public int MeleeWeapon { get; set; }
        public int OriginalStrength { get; set; }
        public int MoraleLoss { get; set; }
        //public int GunsLost { get; set; }
        public int Ammunition { get; set; }
        public int Casualties { get; set; }
        public int CurrentFormation { get; set; }
        public int DistanceMoved { get; set; }
        public int Disorganisation { get; set; }
        public int Committment { get; set; }
        public int WorstMorale { get; set; }
        public int CUrrentMorale { get; set; }
        //public int GunsFired { get; set; }
        public int MenInUnit { get; set; }
        public int CurrentOrder { get; set; }
        //public int MovesSinceShotAt { get; set; }
        //public int PercentageWeapon { get; set; }
        //public int SubUnitsFired { get; set; }
        //public int AmmunitionWith { get; set; }
        public int TerrainIn { get; set; }
        public int Agression { get; set; }
        public int ArtilleryTarget { get; set; }
        //public int ChargingThisTurn { get; set; }
        public int MoraleAtStartofMove { get; set; }
        public int RateOfFire { get; set; }
        public int EffectiveRange { get; set; }
        public int LongRange { get; set; }
        public int Efficiency { get; set; }
        public int LockType { get; set; }
        //public int ShellEffect { get; set; }
        public int MeleeVsInfantry { get; set; }
        public int MeleeVsCavalry { get; set; }
        public int StaffOfficerWith { get; set; }
        public int FiredThisMoveOrEver { get; set; }
        public int ComittmentFactor { get; set; }
        //public int GunsOrPercentageSecondWeapon { get; set; }
        //public int RateOfFireSecondWeapon { get; set; }
        //public int EffectiveRangeSecondWeapon { get; set; }
        //public int LongRangeSecondWeapon { get; set; }
        //public int EfficiencyOfSecondWeapon { get; set; }
        //public int LockTypeOfSecondWeapon { get; set; }
        //public int PerceivedThreat { get; set; }
        //public int ShellEffectSecondWeapon { get; set; }
        //public int SecondWeapon { get; set; }
        public string UnitName { get; set; }
        public Guid ArmyOfficerId { get; set; }
        public Guid CommanderId { get; set; }

        public ArmyOfficer()
        {
        }
    }
}
