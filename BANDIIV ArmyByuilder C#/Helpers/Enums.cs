using System.ComponentModel.DataAnnotations;

namespace BandiIVWebApiGetter.Helpers
{
    public  class Enums
    {
        public enum Actions
        {
            Add=1,
            Remove=2,
            ChangeFieldValue=3
        }
        public enum Languages
        {
            Unknown=0,
            English = 1,
            German = 2,
            French = 3,
            Italian = 4,
            Spanish = 5,
            Russian = 6,
            MuslimIndian = 7,
            Hindoostani = 8,
            Sikh = 9,
            Ottoman = 10,
            WestAfrican = 11,
            Chinese = 12,
            Arab = 13,
            SouthAfrican = 14,
            AmericanIndian = 15,
            Greek = 16,
            Serbian = 17,
            Polish = 18,
            Kandyan = 19,
            Danish = 20,
            Swedish = 21,
            Dutch = 22,
            MuslimAfrican = 23,
            Scottish = 24,
            Welsh = 25,
            Irish = 26,
            Hungarian = 27,
            Bohemian = 28,
            Roumanian = 29,
            Bulgarian = 30,
            Portuguese = 31,
            American = 32,
            Armenian = 33,
            Iranian = 34,
            Burman = 35,
            Japanese = 36,
            Maori = 37
        }
        public enum OfficerType
        {
            ArmyCommander=0, //?
            DivisionalCommander=2,
            BrigadeCommander=4, //?
            UnitCommander=8 //?
        }
        public enum SaveType
        {
            UncommandedUnits = 1,
            UnitsInForce = 2,
            UncommandedOfficer = 3,
            OfficersInForce = 4,
            Force=5,
            BattleFile=6,
            CampaignFile=7
        }

        public enum Roles
        {
            [Display(Name = "Army Commander")]
            ArmyCommander,
            [Display(Name="Divisional Commander")]
            DivisionalCommander,
            [Display(Name = "Brigade Commander")]
            BrigadeCommander,
            [Display(Name = "Other Commander")]
            OtherCommander
        }
    }
}
