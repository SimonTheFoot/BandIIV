namespace BandiIVWebApiGetter.Models
{
    public class Officer //: AbstractClasses.ForceDroppable
    {
        private Guid OfficerId { get; }
        public List<BriefDetails> UnitsCommanded { get; }
        public List<BriefDetails> MyCommander{get; }
        public int OfficerType { get; set; }
        public string CommandDescription { get; set; }
        public int ArmyId { get; set; }
        //tryp = 0
        //typ = 0
        //CALL officrs

        Officer()
        {
            OfficerId = Guid.NewGuid();
        }
        public void AddCommandedUnit(BriefDetails unit)
        {
            UnitsCommanded.Add(unit);
        }

        public void RemoveCommandedUnit(BriefDetails unit)
        {
            UnitsCommanded.Remove(unit);
        }
        public void AddCommander(BriefDetails unit)
        {
            MyCommander.Add(unit);
        }

        public void RemoveCommander(BriefDetails unit)
        {
            MyCommander.Remove(unit);
        }


    }
}
