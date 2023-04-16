namespace BandiIVWebApiGetter.Helpers
{
    using Models;
    public static class ChangeNodeHelper
    {
        public static List<Unit> UpdateParent(List<Unit> target, Guid newParent, Guid nodeId)
        {
            foreach (var item in target)
            {
                if (item.UnitID == nodeId)
                {
                    item.UnitCommander = newParent;
                }
            }
            return target;
        }
        public static List<ArmyOfficer> UpdateParent(List<ArmyOfficer> target, Guid newParent, Guid nodeId)
        {
            foreach (var item in target)
            {
                if (item.ArmyOfficerId == nodeId)
                {
                    item.CommanderId = newParent;
                }
            }
            return target;
        }
        public static List<CompositeList>UpdateList(List<CompositeList> target,Unit newVersion )
        {
            CompositeList itemToUpdate =target.Single(r=> r.Id==newVersion.UnitID.ToString());
            target.Remove(itemToUpdate);
            itemToUpdate.Text = newVersion.UnitName;
            target.Add(itemToUpdate);
            return target;
        }


    }
}
