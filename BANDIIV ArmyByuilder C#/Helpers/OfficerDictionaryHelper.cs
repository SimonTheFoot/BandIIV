namespace BandiIVWebApiGetter.Helpers
{
    public static class OfficerDictionaryHelper
    {
        private static Dictionary<string, string> _officerDictionary;


        static OfficerDictionaryHelper()
        {
            _officerDictionary = new Dictionary<string, string>
            {
                { "OfficerNameAndRank","Officer"},
                {"OfficerRoleDescription","Role" },
                {"OfficerLanguage","Language spoken" },
                {"OfficerAbility","Ability" },
                {"OfficerInfluence", "Influence" },
                {"OfficerLoyal","Loyalty" },
                {"OfficerBrave", "Bravery" },
                { "OfficerPopularity","Popularity"}
            };
        }

        public static Dictionary<string, string>OfficerDictionary => _officerDictionary;
    }
}
