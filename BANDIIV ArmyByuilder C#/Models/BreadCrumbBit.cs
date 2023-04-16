namespace BandiIVWebApiGetter.Models
{

    public class BreadCrumbBit
    {
        public string bcbText { get; set; }
        public string bcbUri { get; set; }
        public BreadCrumbBit(string BcbText, string BcbUri)
        {
            bcbText = BcbText;
            bcbUri = BcbUri;
        }
    }
}
