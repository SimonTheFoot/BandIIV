namespace BandiIVWebApiGetter.Models
{
    public class ArmiesAvailable
    {
        public string aPath { get; set; }
        public string aName { get; set; }
        public ArmiesAvailable(string Apath, string Aname)
        {
            aPath = Apath;
            aName = Aname;
        }
    }
}
