using BandiIVWebApiGetter.Helpers;

namespace BandiIVWebApiGetter.Data
{
    public static class Functions
    {
        public static string GetSaveTypeExtension(Enums.SaveType st)
        {
            string extension="";
            switch (st)
            {
                case Enums.SaveType.UncommandedUnits:
                    extension = "BIUCU";
                    break;
                case Enums.SaveType.UnitsInForce:
                    extension = "BIUIF";
                    break;
                case Enums.SaveType.UncommandedOfficer:
                    extension = "BIUCO";
                    break;
                case Enums.SaveType.OfficersInForce:
                    extension = "BIOIF";
                    break;
                case Enums.SaveType.Force:
                    extension = "BIFOR";
                    break;
                case Enums.SaveType.BattleFile:
                    extension = "BIBAT";
                    break;
                case Enums.SaveType.CampaignFile:
                    extension = "BIOIF";
                    break;

            }
            return extension;
        }
        //public static List<TreeNode> GetAllNodes(this TreeView self)
        //{

        //    List<TreeNode> result = new List<TreeNode>();
        //    foreach (TreeNode child in self.Nodes)
        //    {
        //        result.AddRange(child.GetAllNodes());
        //    }
        //    return result;
        //}

        //public static List<TreeNode> GetAllNodes(this TreeNode self)
        //{
        //    List<TreeNode> result = new List<TreeNode>();
        //    result.Add(self);
        //    foreach (TreeNode child in self.Nodes)
        //    {
        //        result.AddRange(child.GetAllNodes());
        //    }
        //    return result;
        }
    }

