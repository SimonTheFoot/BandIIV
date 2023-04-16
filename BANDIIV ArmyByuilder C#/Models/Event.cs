using BandiIVWebApiGetter.Helpers;

namespace BandiIVWebApiGetter.Models
{
    public class Event
    {
        public int sequence;
        public string page;
        public Enums.Actions action;
        public string target;
        public string oldValue;
        public string newValue;

    }
}
