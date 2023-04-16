using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BandiIVWebApiGetter.Data;
using BandiIVWebApiGetter.Helpers;
using BandiIVWebApiGetter.Models;
using Unit = BandiIVWebApiGetter.Models.Unit;

namespace BandiIVWebApiGetter.Makers
{
    public static class UnitMaker
    {
        private static List<Types>_types=new List<Types>();
        private static List<Musketry> _muskets = new List<Musketry>();
        private static List<Gunnery> _guns = new List<Gunnery>();
        private static List<MG> _mg = new List<MG>();
        private static List<Chopper> _choppers=new List<Chopper>();


        static UnitMaker()
        {
            _types= Data.AsyncHttpCalls.GetIt<Types>("Types");
            _muskets = AsyncHttpCalls.GetIt<Musketry>("Musketry");
            _guns = AsyncHttpCalls.GetIt<Gunnery>("Gunnery");
            _mg = AsyncHttpCalls.GetIt<MG>("MG");
            _choppers = AsyncHttpCalls.GetIt<Chopper>("MeleeWeapons");
        }
        public static Unit MakeNewUnit(Models.Troop troop)
        {
            var unit = new Unit();
            unit.ArmyId = troop.ArmyID;
            unit.TroopType = troop.TroopType;
            unit.OfficerRank = troop.OfficerRank;
            unit.AcceptableFormations = troop.Formation;
            unit.TroopClass = troop.TroopClass;
            unit.TroopExperience = troop.Experience;
            unit.NumberSubUnits = troop.SubUnits;
            unit.MenInUnit = troop.SubUnits * troop.MeninSubUnit;
            unit.OriginalGuns = troop.NumberofGuns;
            unit.PercentageWeapon = troop.PercentageWithPrimaryWeapon;
            unit.Committment = troop.Experience;
            if (unit.OriginalGuns > 0)
            {
                unit.GunsOrPercentageSecondWeapon = unit.PercentageWeapon;
                unit.GunsFired = unit.OriginalGuns - unit.GunsOrPercentageSecondWeapon;
                unit.PercentageWeapon = 100;
            }
            else
            {
                unit.GunsFired = 0;
            }
            if (unit.PercentageWeapon == 0)
            {
                unit.PercentageWeapon = 100;
            }
            unit.SecondWeapon = troop.SecondaryMissileWeapon;
            unit.Armour = troop.Armour;
            unit.CommandControl = troop.CommandControl;
            unit.CurrentMorale = troop.Confidence;
            unit.Steadfastness = troop.Steadyness;
            unit.Agression = troop.Aggression;
            unit.Ammunition = troop.Ammo;
            unit.Weapon = troop.PrimaryMissileWeapon;
            unit.MeleeWeapon = troop.MeleeWeapon;
            unit.FireDiscipline = troop.FireDiscipline;
            unit.Ammunition = troop.Ammo;
            unit.Language = troop.Language;
            if (unit.TroopType > 8 && unit.TroopType < 20)
            {
                unit.Amot = unit.Ammunition;
                unit.Ammunition = 180;
            }
            unit.BasicMoveDistance = _types.Where(c => c.TypeID==unit.TroopType).First().BaseMovement;

            unit.UnitName = UnitNameMaker.MakeUnitName(troop.TroopName,unit.Language);
            //todo make language work
            unit.OfficerName = BandiIVWebApiGetter.Makers.NameMaker.Make(unit.Language, 1).First();
            //unit.OfficerName = NameMaker.Make(1, 1).First();
            unit = getWeapons(unit);
            unit = getMeleeWeapons(unit);
            unit = UnitOfficerMaker.MakeUnitOfficer(unit);
            unit = checkElephants(unit); 
            return unit;
        }

        private static Unit checkElephants(Unit unit)
        {
            if (unit.TroopType == 15)
            {
                unit.AnimalCount = Convert.ToInt32(unit.MenInUnit / 10);
                unit.AnimalCount = Math.Max(unit.AnimalCount, unit.OriginalGuns);
            }
            return unit;
        }

        //stpr = 100 - stead

        private static Unit getMeleeWeapons(Unit unit)
        {
            unit.MeleeVsInfantry = _choppers.First(c => c.ChopperId == unit.MeleeWeapon).vsInfantry;
            unit.MeleeVsCavalry = _choppers.First(c => c.ChopperId == unit.MeleeWeapon).VsCavalry;
            return unit;
        }

        private static Unit getWeapons(Unit unit)
        {
            if (unit.TroopType > 0 && unit.TroopType < 9)
            {
                unit = getInfantryWeapons(unit);
            }
            else if (unit.TroopType > 8 && unit.TroopType < 20)
            {
                unit = getArtilleryWeapons(unit);
            }
            else
            {
                unit = getMachineGunWeapons(unit);
            }
            return unit;
        }

        private static Unit getInfantryWeapons(Unit unit)
        {
            var musket = _muskets.First(c => c.RifleId == unit.Weapon);
            unit.ServiceDate = musket.ServiceDate;
            unit.RateOfFire = musket.RPM;
            unit.EffectiveRange = musket.ER;
            unit.LongRange = musket.LR;
            unit.Efficiency = musket.Eff;
            unit.LockType = musket.Type;
            if (unit.SecondWeapon > 0)
            {
                if (unit.OriginalGuns == 0)
                {
                    var musket2 = _muskets.First(c => c.RifleId == unit.SecondWeapon);
                    unit.SecondServiceDate = musket2.ServiceDate;
                    unit.RateOfFireSecondWeapon = musket2.RPM;
                    unit.EffectiveRangeSecondWeapon = musket2.ER;
                    unit.LongRangeSecondWeapon = musket2.LR;
                    unit.EfficiencyOfSecondWeapon = musket2.Eff;
                    unit.LockTypeOfSecondWeapon = musket2.Type;
                }
                else
                {
                    var mg = _mg.First(c => c.MGId == unit.SecondWeapon);
                    unit.SecondServiceDate = mg.ServiceDate;
                    unit.RateOfFireSecondWeapon = mg.ROF;
                    unit.EffectiveRangeSecondWeapon = mg.ER;
                    unit.LongRangeSecondWeapon = mg.LR;
                    unit.EfficiencyOfSecondWeapon = mg.Eff;
                    unit.LockTypeOfSecondWeapon = mg.Type;
                }
            }
            if (unit.TroopClass > 9 && unit.TroopClass < 14)
            {
                unit.Ammunition = Convert.ToInt16(unit.FireDiscipline * 2 * RNG.x2);
                if (unit.Ammunition > 60)
                {
                    unit.Ammunition = Convert.ToInt16(60 * RNG.x2);
                }
            }

            return unit;
        }
        private static Unit getArtilleryWeapons(Unit unit)
        {
            var gun = _guns.First(c => c.GunId == unit.Weapon);
            unit.ServiceDate =gun.ServiceDate;
            unit.RateOfFire = gun.ROF;
            unit.EffectiveRange = gun.ER;
            unit.LongRange = gun.LR;
            unit.Efficiency = gun.Eff;
            unit.LockType = gun.Type;
            unit.ShellEffect = gun.ShellEffect;

            if (unit.SecondWeapon > 0)
            {
                var gun2 = _guns.First(c => c.GunId == unit.SecondWeapon);
                unit.SecondServiceDate = gun2.ServiceDate;
                unit.RateOfFireSecondWeapon = gun2.ROF;
                unit.EffectiveRangeSecondWeapon = gun2.ER;
                unit.LongRangeSecondWeapon = gun2.LR;
                unit.EfficiencyOfSecondWeapon = gun2.Eff;
                unit.LockTypeOfSecondWeapon = gun2.Type;
                unit.ShellEffectSecondWeapon = gun2.ShellEffect;
            }

            if (unit.TroopClass > 9 && unit.TroopClass < 14)
            {
                unit.Ammunition = Convert.ToInt16(unit.FireDiscipline * 2 * RNG.x2);
                if (unit.Ammunition > 60)
                {
                    unit.Ammunition = Convert.ToInt16(60 * RNG.x2);
                }
            }
            else
            {
                unit.Ammunition = 180;
            }
            return unit;
        }
        private static Unit getMachineGunWeapons(Unit unit)
        {
            var mg = _mg.First(c => c.MGId == unit.Weapon);
            unit.ServiceDate = mg.ServiceDate;
            unit.RateOfFire = mg.ROF;
            unit.EffectiveRange = mg.ER;
            unit.LongRange = mg.LR;
            unit.Efficiency = mg.Eff;
            unit.LockType = mg.Type;
            if (unit.SecondWeapon > 0)
            {
                var mg1 = _mg.First(c => c.MGId == unit.SecondWeapon);
                unit.SecondServiceDate = mg1.ServiceDate;
                unit.RateOfFireSecondWeapon = mg1.ROF;
                unit.EffectiveRangeSecondWeapon = mg1.ER;
                unit.LongRangeSecondWeapon = mg1.LR;
                unit.EfficiencyOfSecondWeapon = mg1.Eff;
                unit.LockTypeOfSecondWeapon = mg1.Type;
            }
            unit.Ammunition = 250;
            return unit;
        }
    }

}





