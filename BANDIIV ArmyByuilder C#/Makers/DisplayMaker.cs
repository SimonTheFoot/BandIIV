using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BandiIVWebApiGetter.Helpers;
using Unit = BandiIVWebApiGetter.Models.Unit;

namespace BandiIVWebApiGetter.Makers
{
    class DisplayMaker
    {
        public static string[] MakeList<T>(T subject,string dictionary="")
        {

            var SubjectType = typeof(T);
            var properties = SubjectType.GetProperties();
            Dictionary<string,string>propertiesToShow=new Dictionary<string, string>();
            bool useDictionary = false;
            switch (dictionary)
            {
                case "Officer":
                    propertiesToShow = OfficerDictionaryHelper.OfficerDictionary;
                    useDictionary = true;
                    break;
                    
            }
          List<string>lines= new List<string>();
            if (useDictionary)
            {
                foreach (var field in properties)
                {
                    if (propertiesToShow.ContainsKey(field.Name))
                    {
                        lines.Add(propertiesToShow[field.Name] + ",     " + field.GetValue(subject, null));
                    }
                }
            }
            else
            {
                foreach (var field in properties)
                {
                    lines.Add(field.Name + ",     " + field.GetValue(subject, null));
                }
            }
            return lines.ToArray();
        }

    }
}
