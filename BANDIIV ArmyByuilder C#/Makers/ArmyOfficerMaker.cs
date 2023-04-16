using System;
using System.Collections.Generic;
using System.Linq;

using System.Text;
using System.Threading;
using System.Threading.Tasks;
using BandiIVWebApiGetter.Data;
using BandiIVWebApiGetter.Helpers;
using BandiIVWebApiGetter.Models;
using BandiIVWebApiGetter.Makers;
using BandiIVWebApiGetter.Makers.BandiIVWebApiGetter.Makers;

namespace BandiIVWebApiGetter.Makers
{
    class ArmyOfficerMaker
    {
        private static readonly List<Skill> _skills = new List<Skill>();
        private static readonly List<OfficerStats> _OfficerStats = new List<OfficerStats>();
        private static readonly List<OfficerRank> _officerRanks = new List<OfficerRank>();

        static ArmyOfficerMaker()
        {
            _skills = AsyncHttpCalls.GetIt<Skill>("OfficerSkills/");
            _OfficerStats = AsyncHttpCalls.GetIt<OfficerStats>("OfficerAbilities");
            _officerRanks = AsyncHttpCalls.GetIt<OfficerRank>("OfficerRanks/");

        }

        private static string[] GetAbilityRange(int armyId)
        {
            // get values corresponding to armyId
            var values = _OfficerStats.FirstOrDefault(c => c.ArmyId == armyId);
            string[] range = values.v1.Split(',');
            return range;
        }

        public static ArmyOfficer MakeArmyOfficer(ArmyOfficer armyOfficer, int officerRank, int officerArmy, int officerLanguage)
        {
            //return armyOfficer;
            armyOfficer.OfficerRank = officerRank;
            armyOfficer.ArmyId = officerArmy;
            armyOfficer.OfficerName = NameMaker.Make(officerLanguage, 1)[0];
            armyOfficer = AddRank(armyOfficer);
            armyOfficer = GetArmyOfficerAbility(armyOfficer);
            armyOfficer = GetOfficerLoyalty(armyOfficer);
            armyOfficer = GetOfficerInfluence(armyOfficer);
            armyOfficer = GetOfficerBravery(armyOfficer);
            armyOfficer.OfficerType = 6;
            armyOfficer.OfficerPopularity = 100;
            armyOfficer.OfficerNameLanguage = officerLanguage;
            return armyOfficer;
        }

        private static ArmyOfficer AddRank(ArmyOfficer armyOfficer)
        {
            var rank = _officerRanks.First(c => c.OfficerRankId == armyOfficer.OfficerRank).Description;
            armyOfficer.OfficerRankDescription = rank;
            return armyOfficer;
        }

        private static ArmyOfficer GetArmyOfficerAbility(ArmyOfficer armyOfficer)
        {
            var abilities = GetAbilityRange(armyOfficer.ArmyId);
            var value = (int)(RNG.xs * 18) + 1;
            var oft = 11 - Convert.ToInt16(abilities[value]);
            oft = Math.Max(oft, 1);
            oft = Math.Min(oft, 10);
            var ofa = Convert.ToInt32((_skills.First(c => c.SkillId == oft).Value * RNG.x1));
            armyOfficer.OfficerAbility = ofa;
            return armyOfficer;
        }

        private static ArmyOfficer GetOfficerLoyalty(ArmyOfficer armyOfficer)
        {
            var ofl = 70 * RNG.xs + 30;
            armyOfficer.OfficerLoyal = Convert.ToInt16(ofl);
            //todo
            //IF area = 1 AND trype = 6 THEN
            //    IF ODD(ofl) THEN
            //    ofl = ofl + 1
            //END IF
            //END IF
            return armyOfficer;
        }

        private static ArmyOfficer GetOfficerBravery(ArmyOfficer armyOfficer)
        {
            var ofb = 70 * RNG.xs + 30;
            armyOfficer.OfficerBrave = Convert.ToInt16(ofb);
            return armyOfficer;
        }


        private static ArmyOfficer GetOfficerInfluence(ArmyOfficer armyOfficer)
        {
            var baseInfluence = _officerRanks.First(c => c.OfficerRankId == armyOfficer.OfficerRank).Influence;
            armyOfficer.OfficerInfluence = Convert.ToInt16((100 - baseInfluence) * RNG.xs + baseInfluence);
            return armyOfficer;
        }

        internal static ArmyOfficer MakeArmyOfficer(int officerRank, int officerArmy, int officerLanguage)
        {
            var armyOfficer = new ArmyOfficer();
            armyOfficer.ArmyOfficerId = Guid.NewGuid();
            armyOfficer = MakeArmyOfficer(armyOfficer, officerRank, officerArmy, officerLanguage);
            return armyOfficer;
        }
    }
}


//IF trype = 0 THEN
//  mstring
//  END IF


//  IF nlang< 1 THEN
//    natchek
//  END IF
//  IF offname = true THEN
//    off$ = autoname(nlang)
//ELSE
//    header
//    PRINT TAB(5); "What is the name of the officer ";
//   off$ = ""
//   DO UNTIL LEN(off$) > 0 AND LEN(off$) < 41
//      LINE INPUT off$
//   LOOP
//   n1$ = off$
//  END IF
//  IF typ > 0 THEN
//  ELSE
//    offrank
//  END IF

//  ofp = 100
//  header
//  of$ = officer$(ofr)
//  chap$ = trim$(of$) + " " + trim$(off$)
//  rendom
//  k = INT(18 * xs) + 1
//  oft = 11 - force(1, k)
//  oft = MAX(oft, 1)
//  oft = MIN(oft, 10)
//  ofa = INT(obase(oft) * x1)

//  rendom
//  IF chofa THEN
//    IF allofa THEN
//  CALL chofal
//    ELSE
//      IF trype = 0 THEN
//      CALL chofal
//      END IF
//    END IF
//  END IF
//  '
//  IF chofl THEN
//    IF allofl THEN
//      chofla
//    ELSE
//      IF trype = 0 THEN
//        chofla
//      END IF
//    END IF
//  ELSE
//    rendom
//    ofl = (100 - 30) * xs + 30
//    IF area = 1 AND trype = 6 THEN
//      IF ODD(ofl) THEN
//        ofl = ofl + 1
//      END IF
//    END IF
//  END IF

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

//  IF trype = 0 THEN
//    '
//    mr = MAX(ofl* 3 / 2, 75)
//    mo = mr
//    stead = MAX((120 - ofl) / 4, 5)
//    cc = force(2, 11)
//    pw = ofa / 20 + 2

//    MID$(m$, 51) = CHR$(trype)
//    MID$(m$, 54) = CHR$(mr)
//    MID$(m$, 55) = CHR$(stead)
//    MID$(m$, 57) = CHR$(cc)
//    MID$(m$, 76) = CHR$(mr)
//    MID$(m$, 80) = CHR$(10)
//    MID$(m$, 82) = CHR$(pw)

//    MID$(m$, 111) = "Staff Headquarters"
//    upv! = Points!
//    PRINT " Newly Created Officer :"
//    PRINT
//   PRINT " "; trim$(officer$(ofr)); " "; trim$(off$); ", points value: "; upv!


//    wate
//    header
//  END IF