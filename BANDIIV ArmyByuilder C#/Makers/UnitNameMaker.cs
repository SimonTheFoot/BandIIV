using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BandiIVWebApiGetter.Makers
{
    public static class UnitNameMaker
    {
        private static int _unitsMadeSoFar;
        public static string MakeUnitName(string troopName, int language)
        {
            var name = string.Empty;
            _unitsMadeSoFar += 1;
            switch (language)
            {
                case 1:
                case 6:
                case 18:
                case 20:
                case 21:
                case 22:
                case 24:
                case 25:
                case 26:
                    name = _unitsMadeSoFar + "th";
                    if (_unitsMadeSoFar % 10 == 1)
                    {
                        name = _unitsMadeSoFar + "st";
                    }
                    if (_unitsMadeSoFar % 10 == 2)
                    {
                        name = _unitsMadeSoFar + "nd";
                    }
                    if (_unitsMadeSoFar % 10 == 3)
                    {
                        name = _unitsMadeSoFar + "rd";
                    }
                    if (_unitsMadeSoFar == 11
                    || _unitsMadeSoFar == 111 
                    || _unitsMadeSoFar == 211
                    || _unitsMadeSoFar == 12
                    || _unitsMadeSoFar == 112 
                    || _unitsMadeSoFar == 212
                    || _unitsMadeSoFar == 13
                    || _unitsMadeSoFar == 113
                    || _unitsMadeSoFar== 213)
                    {
                        name = _unitsMadeSoFar + "th";
                    }
                    name = name + " " + troopName;
                    break;
                case 2:
                    name = troopName + "Nr. " + _unitsMadeSoFar;
                    break;
                case 3:
                    name = _unitsMadeSoFar + "eme" + " " + troopName;
                    break;
                case 4:
                case 5:
                    name = _unitsMadeSoFar + "era" + " " + troopName;
                    break;
                default:
                    name = _unitsMadeSoFar + "s" + " " + troopName;
                    break;
            }
            return name;
        }
    }
}

