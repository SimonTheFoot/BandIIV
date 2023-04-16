using BandiIVWebApiGetter.Models;
using Syncfusion.Blazor.Data;

namespace BandiIVWebApiGetter.Helpers
{
    public static class UndoHelper
    {
        // this is not threadsafe?
        public static List<Event> Events= new List<Event>();
        public static Event lastEvent=new Event();
        public static void Undo()
        {
            //lastEvent = Events.OrderBy(x => x.sequence).LastOrDefault();
            //switch(lastEvent.action)
            //{
            //    case Enums.Actions.Add:
            //        switch (lastEvent.page) {
            //             default:
            //        break;
            //        }
            //}
        }
        public static void Add(string newvalue, string oldvalue,string page)
        {
            //Event newEvent=new Event();
            //newEvent.newValue = newvalue;
            //newEvent.oldValue = oldvalue;
            //newEvent.page = page;
            //newEvent.
            //newEvent.sequence=Events.Count+1;
            //Events.Add(newEvent);
        }

    }
}
