using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using BandiIVWebApiGetter.Data;
using BandiIVWebApiGetter.Helpers;
using BandiIVWebApiGetter.Models;

namespace BandiIVWebApiGetter.Makers
{
    class UnitOfficerMaker
    {
        private static readonly List<Skill> _skills=new List<Skill>();
        private static readonly List<OfficerStats> _OfficerStats = new List<OfficerStats>();
        private static readonly List<OfficerRank> _officerRanks = new List<OfficerRank>();

        static UnitOfficerMaker()
        {
            _skills= AsyncHttpCalls.GetIt<Skill>("OfficerSkills/");
            _OfficerStats = AsyncHttpCalls.GetIt<OfficerStats>("OfficerAbilities/");
            _officerRanks = AsyncHttpCalls.GetIt<OfficerRank>("OfficerRanks/");

        }

        private static string[] GetAbilityRange(int armyId)
        {
            // get values corresponding to armyId
           var values = _OfficerStats.FirstOrDefault(c => c.ArmyId== armyId);
            string[] range = values.v1.Split(',');
            return range;
        }

        public static Unit MakeUnitOfficer(Unit unit)
        {
            unit= AddDefaultRank(unit);
            unit = GetUnitOfficerAbility(unit);
            unit = GetOfficerLoyalty(unit);
            unit = GetOfficerInfluence(unit);
            unit = GetOfficerBravery(unit);
            unit.OfficerType = 6;
            unit.OfficerPopularity = 100;
            return unit;
        }

        private static Unit AddDefaultRank(Unit unit)
        {
            var rank = _officerRanks.First(c => c.OfficerRankId == unit.OfficerRank).Description;
            unit.OfficerName = rank.Trim() + " " + unit.OfficerName;
            return unit;
        }

        private static Unit GetUnitOfficerAbility(Unit unit)
        {
            var abilities = GetAbilityRange(unit.ArmyId);
            var value = (int) (RNG.xs * 18) + 1;
            var oft = 11 - Convert.ToInt16(abilities[value]);
            oft = Math.Max(oft, 1);
            oft = Math.Min(oft, 10);
            var ofa = Convert.ToInt32((_skills.First(c => c.SkillId == oft).Value * RNG.x1));
            unit.OfficerAbility = ofa;
            return unit;
        }

        private static Unit GetOfficerLoyalty(Unit unit)
        {
            var ofl = 70 * RNG.xs + 30;
            unit.OfficerLoyal = Convert.ToInt16(ofl);
            return unit;
        }

        private static Unit GetOfficerBravery(Unit unit)
        {
            var ofb = 70 * RNG.xs + 30;
            unit.OfficerBrave = Convert.ToInt16(ofb);
            return unit;
        }


        private static Unit GetOfficerInfluence(Unit unit)
        {
            var baseInfluence = _officerRanks.First(c => c.OfficerRankId == unit.OfficerRank).Influence;
            unit.OfficerInfluence = Convert.ToInt16((100 - baseInfluence) * RNG.xs + baseInfluence);
            return unit;
        }
    }
}







//  ofp = 100

//  rendom
//  i = officer(ofr, 2)
//  ofi = (100 - i) * xs + i
//  off$ = off$ + "                              "
//  off$ = LEFT$(off$, 40)
//  '
//  MID$(m$, 1) = off$
//  MID$(m$, 45) = CHR$(oftyp)
//  MID$(m$, 41) = CHR$(ofr)
//  MID$(m$, 42) = CHR$(ofa)
//  MID$(m$, 43) = CHR$(ofi)
//  MID$(m$, 44) = CHR$(ofl)
//  MID$(m$, 86) = CHR$(ofp)

