using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace BandiIVWebApiGetter.Helpers
{
   public static class EnumExtensions
    {
        public static string GetDisplayName(this Enum enumValue)
        {
            return enumValue.GetType()
                .GetMember(enumValue.ToString())
                .First()
                .GetCustomAttribute<DisplayAttribute>()
                .GetName();
        }
        public static List<String>GetAllDisplayNames<e>()
        {
            List<string> result = new List<string>();
            var enumValues = Enum.GetValues(typeof(e)).OfType<e>().ToList<e>();;
            foreach (e value in enumValues)
            {
                result.Add(GetDisplayName(value as Enum));
            }
            return result;
        }

    }
}
