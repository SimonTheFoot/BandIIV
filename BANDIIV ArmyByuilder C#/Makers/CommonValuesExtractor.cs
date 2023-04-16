using BandiIVWebApiGetter.Models;
using System.Collections.Generic;

namespace BandiIVWebApiGetter.Makers
{
    static public class CommonValuesExtractor
    {
        public static List<CompositeList>  extractOfficerDetails( List<ArmyOfficer> armyOfficers)
        {
            List<CompositeList> compositeLists= new List<CompositeList>();

            foreach (var officer in armyOfficers)
            {
                compositeLists.Add(new CompositeList(officer.ArmyOfficerId.ToString(), officer.CommanderId.ToString(), officer.OfficerNameAndRank, true));            
            }
            return compositeLists;

        }
        public static List<CompositeList> extractUnitDetails(List<Unit> units)
        {
            List<CompositeList> compositeLists = new List<CompositeList>();
            foreach (var unit in units)
            {
                compositeLists.Add(new CompositeList(unit.UnitID.ToString(), unit.UnitCommander.ToString(), unit.UnitName, false));
            }
            return compositeLists;

        }
    }
}
