using System.Data;
using BandiIVWebApiGetter.Models;
using Dapper;

namespace BandiIVWebApiGetter.Data
{
   public static class PropertiesMaker
    {
        //public static DynamicParameters GetArmyProperties(ArmiesFrontEnd army)
        //{
        //    var pArmies = new DynamicParameters();
        //    var ArmyType = typeof(Models.Armies);
        //    var properties = ArmyType.GetProperties();
 
        //    foreach (var field in properties)
        //    {
        //        pArmies.Add("@"+field.Name,field.GetValue(army,null)) ;
        //    }
        //    return pArmies;
        //}

        //public static ArmiesFrontEnd SetArmyProperties(String[] values,int group)
        //{
        //    var army=new ArmiesFrontEnd();
        //    var ArmyType = typeof(Models.Armies);
        //    var properties = ArmyType.GetProperties();
        //    int index = 0;
        //    foreach (var field in properties)
        //    {
        //        if(index==0)
        //        { field.SetValue(army,values[index].Trim());}
        //        else if (index == 4)
        //        {
        //            field.SetValue(army, group);
                    
        //        }
        //        else
        //        { field.SetValue(army, Convert.ToInt32(values[index])); }
        //        index++;
        //    }
        //    return army;
        //}

        //internal static DynamicParameters GetListProperties(MG mg)
        //{
        //    var pMG = new DynamicParameters();
        //    var MGType = typeof(Models.MG);
        //    var properties = MGType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pMG.Add("@" + field.Name, field.GetValue(mg, null));
        //    }
        //    return pMG;
        //}

        //internal static DynamicParameters GetListProperties(Chopper chopper)
        //{
        //    var pChopper = new DynamicParameters();
        //    var chopperType = typeof(Models.Chopper);
        //    var properties = chopperType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pChopper.Add("@" + field.Name, field.GetValue(chopper, null));
        //    }
        //    return pChopper;
        //}

        //internal static DynamicParameters GetListProperties(Experience experience)
        //{
        //    var pExperience = new DynamicParameters();
        //    var experienceType = typeof(Models.Experience);
        //    var properties = experienceType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pExperience.Add("@" + field.Name, field.GetValue(experience, null));
        //    }
        //    return pExperience;
        //}

        //internal static DynamicParameters GetListProperties(Musketry musketry)
        //{
        //    var pmusketry = new DynamicParameters();
        //    var vmusketryType = typeof(Models.Musketry);
        //    var properties = vmusketryType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pmusketry.Add("@" + field.Name, field.GetValue(musketry, null));
        //    }
        //    return pmusketry;
        //}

        //internal static DynamicParameters GetListProperties(Officer officer)
        //{
        //    var pofficer = new DynamicParameters();
        //    var vofficerType = typeof(Models.Officer);
        //    var properties = vofficerType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pofficer.Add("@" + field.Name, field.GetValue(officer, null));
        //    }
        //    return pofficer;
        //}

        //internal static DynamicParameters GetListProperties(Who who)
        //{
        //    var pwho = new DynamicParameters();
        //    var vwhoType = typeof(Models.Who);
        //    var properties = vwhoType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pwho.Add("@" + field.Name, field.GetValue(who, null));
        //    }
        //    return pwho;
        //}

        //internal static DynamicParameters GetListProperties(Gunnery gunnery)
        //{
        //    var pgunnery = new DynamicParameters();
        //    var gunneryType = typeof(Models.Gunnery);
        //    var properties = gunneryType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pgunnery.Add("@" + field.Name, field.GetValue(gunnery, null));
        //    }
        //    return pgunnery;
        //}

        //internal static DynamicParameters GetListProperties(FormPos formPos)
        //{
        //    var pFormPos = new DynamicParameters();
        //    var commitType = typeof(Models.FormPos);
        //    var properties = commitType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pFormPos.Add("@" + field.Name, field.GetValue(formPos, null));
        //    }
        //    return pFormPos;
        //}

        //internal static DynamicParameters GetListProperties(Commit commit)
        //{
        //    var pcommit = new DynamicParameters();
        //    var commitType = typeof(Models.Commit);
        //    var properties = commitType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pcommit.Add("@" + field.Name, field.GetValue(commit, null));
        //    }
        //    return pcommit;
        //}

        //internal static Gunnery SetGunneryValues(string line)
        //{
        //    var gunnery = new Gunnery();
        //    var gunneryType = typeof(Models.Gunnery);
        //    var properties = gunneryType.GetProperties();
        //    int index = 0;
        //    string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
        //    foreach (var field in properties)
        //    {
        //        if (index == 1)
        //        {
        //            field.SetValue(gunnery, lines[index].Trim().Replace("\"",""));
        //        }
        //        else
        //        {
        //            field.SetValue(gunnery, Convert.ToInt32(lines[index]));
        //        }
        //        index++;
        //    }
        //    return gunnery;
        //}

        //internal static DynamicParameters GetListProperties(Types types)
        //{
        //    var ptypes = new DynamicParameters();
        //    var vtypesType = typeof(Models.Types);
        //    var properties = vtypesType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        ptypes.Add("@" + field.Name, field.GetValue(types, null));
        //    }
        //    return ptypes;
        //}

        //internal static DynamicParameters GetListProperties(MusketType musketType)
        //{
        //    var pmusketType = new DynamicParameters();
        //    var vmusketTypeType = typeof(Models.MusketType);
        //    var properties = vmusketTypeType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pmusketType.Add("@" + field.Name, field.GetValue(musketType, null));
        //    }
        //    return pmusketType;
        //}

        //internal static DynamicParameters GetListProperties(MGType mgType)
        //{
        //    var pmgType = new DynamicParameters();
        //    var vmgTypeType = typeof(Models.MGType);
        //    var properties = vmgTypeType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pmgType.Add("@" + field.Name, field.GetValue(mgType, null));
        //    }
        //    return pmgType;
        //}

        //internal static FormPos SetFormPosValues(string line)
        //{
        //    var formPos = new FormPos();
        //    var formPosType = typeof(Models.FormPos);
        //    var properties = formPosType.GetProperties();
        //    string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
        //    properties[0].SetValue(formPos,Convert.ToInt32(lines[0]));
        //    properties[1].SetValue(formPos, lines[1]);
        //    lines[0] = "";
        //    lines[1] = "";
        //    properties[2].SetValue(formPos,String.Join(",",lines).Substring(2));

        //    return formPos;
        //}

        //internal static DynamicParameters GetListProperties(vClass vclass)
        //{
        //    var pvclass = new DynamicParameters();
        //    var vclassType = typeof(Models.vClass);
        //    var properties = vclassType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pvclass.Add("@" + field.Name, field.GetValue(vclass, null));
        //    }
        //    return pvclass;
        //}
        //internal static DynamicParameters GetListProperties(GunType gunType)
        //{
        //    var pGunType = new DynamicParameters();
        //    var vGunType = typeof(Models.GunType);
        //    var properties = vGunType.GetProperties();

        //    foreach (var field in properties)
        //    {
        //        pGunType.Add("@" + field.Name, field.GetValue(gunType, null));
        //    }
        //    return pGunType;
        //}

        //internal static Who SetWhoValues(string line)
        //{
        //    var who = new Who();
        //    var whoType = typeof(Models.Who);
        //    var properties = whoType.GetProperties();
        //    string[] lines = line.Split(new string[] {","}, StringSplitOptions.None);
        //    foreach (var field in properties)
        //    {
        //        switch (field.Name)
        //        {
        //            case "WhoId":
        //                field.SetValue(who, Convert.ToInt32(lines[0]));
        //                break;

        //            case "v1":
        //                field.SetValue(who, lines[1]); //.Trim().Substring(1, lines[0].Length - 5));
        //                break;

        //        }
        //    }
        //    return who;
        //}

        //internal static Commit SetCommitValues(string line)
        //{
        //    var commit = new Commit();
        //    var commitType = typeof(Models.Commit);
        //    var properties = commitType.GetProperties();
        //    string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
        //    foreach (var field in properties)
        //    {
        //        switch (field.Name)
        //        {
        //            case "Description":
        //                field.SetValue(commit, lines[1].Replace("\"",""));
        //                break;
        //            case "CommitId":
        //                field.SetValue(commit, Convert.ToInt32(lines[0]));
        //                break;
        //            case "v1":
        //                field.SetValue(commit, Convert.ToInt32(lines[2]));;
        //                break;
        //            case "v2":
        //                field.SetValue(commit, Convert.ToInt32(lines[3]));
        //                break;
        //            case "v3":
        //                field.SetValue(commit, Convert.ToInt32(lines[4]));
        //                break;
        //            case "v4":
        //                field.SetValue(commit, Convert.ToInt32(lines[5]));
        //                break;

        //        }
        //    }
        //    return commit;
        //}

        //internal static Types SetTypeValues(string line)
        //{
        //    var type = new Types();
        //    var typeType = typeof(Models.Types);
        //    var properties = typeType.GetProperties();
        //    string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
        //    foreach (var field in properties)
        //    {
        //        switch (field.Name)
        //        {
        //            case "TypeID":
        //                field.SetValue(type, Convert.ToInt32(lines[0]));
        //                break;

        //            case "Description":
        //                field.SetValue(type, lines[1]);//.Trim().Substring(1, lines[0].Length - 5));
        //                break;
                        
        //            case "SubUnit":
        //                field.SetValue(type, lines[2]);//.Trim().Substring(1, lines[0].Length - 5));
        //                break;

        //            case "SPlural":
        //                field.SetValue(type, lines[3]);//.Trim().Substring(1, lines[0].Length - 5));
        //                break;

        //            case "ISingular":
        //                field.SetValue(type, lines[4]);//.Trim().Substring(1, lines[0].Length - 5));
        //                break;

        //            case "IPlural":
        //                field.SetValue(type, lines[5]);//.Trim().Substring(1, lines[0].Length - 5));
        //                break;

        //            case "v1":
        //                field.SetValue(type, Convert.ToInt32(lines[6]));
        //                break;
        //            case "v2":
        //                field.SetValue(type, Convert.ToInt32(lines[7]));
        //                break;
        //            case "v3":
        //                field.SetValue(type, Convert.ToInt32(lines[8]));
        //                break;
        //        }

        //    }
        //    return type;

        //}

        //internal static Officer SetOfficerValues(string line)
        //{
        //    var officer = new Officer();
        //    var officerType = typeof(Models.Officer);
        //    var properties = officerType.GetProperties();
        //    string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
        //    foreach (var field in properties)
        //    {
        //        switch (field.Name)
        //        {
        //            case "Description":
        //                field.SetValue(officer, lines[0].Trim().Substring(1, lines[0].Length - 5));
        //                break;

        //            case "OfficerId":
        //                field.SetValue(officer, Convert.ToInt32(lines[1]));
        //                break;

        //            case "v1":
        //                field.SetValue(officer, Convert.ToInt32(lines[2]));
        //                break;

        //            case "v2":
        //                field.SetValue(officer, Convert.ToInt32(lines[3]));
        //                break;
        //        }

        //    }
        //    return officer;
        //}

        internal static MusketType SetMusketTypeValues(string line)
        {
            var musketType = new MusketType();
            var musketTypeType = typeof(Models.MusketType);
            var properties = musketTypeType.GetProperties();
            string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if (field.Name == "Description")
                {
                    field.SetValue(musketType, lines[1].Trim().Substring(1, lines[1].Length - 5));
                }
                else
                {
                    field.SetValue(musketType, Convert.ToInt32(lines[index]));
                }
                index++;

            }
            return musketType;

        }

        internal static DynamicParameters GetOfficerProperties(int troopId, string officers)
        {
            var pOP = new DynamicParameters();
            pOP.Add("@ArmyId",troopId,DbType.Int32);
            pOP.Add("@v1", officers,DbType.String);
            return pOP;
        }

        internal static Musketry SetMusketryValues(string line)
        {
            var musketry = new Musketry();
            var musketryType = typeof(Models.Musketry);
            var properties = musketryType.GetProperties();
            string[] lines = line.Split(new string[] {","}, StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if (field.Name == "Name")
                {
                    field.SetValue(musketry, lines[1].Trim().Substring(1, lines[1].Length - 5));
                }
                else
                {
                    field.SetValue(musketry, Convert.ToInt32(lines[index]));
                }
                index++;

            }
            return musketry;
        }

        public static DynamicParameters GetGroupProperties(Models.Groups group)
        {
            var pGroups = new DynamicParameters();
            var GroupType = typeof(Models.Groups);
            var properties = GroupType.GetProperties();

            foreach (var field in properties)
            {
                pGroups.Add("@" + field.Name, field.GetValue(group, null));
            }
            return pGroups;
        }

        internal static MGType SetMGTypeValues(string line)
        {
            var MGType = new MGType();
            var MGTypeType = typeof(Models.MGType);
            var properties = MGTypeType.GetProperties();
            string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
            foreach (var field in properties)
            {
                if (field.Name=="Description")
                { field.SetValue(MGType, lines[0].Trim().Substring(1, lines[0].Length - 5)); }
                else
                { field.SetValue(MGType, Convert.ToInt32(lines[1])); }
            }

            return MGType;
        }

        internal static Troop  SetTroopProperties(string[] values,int armyId)
        {
            var troop=new Troop();
            var TroopType = typeof(Models.Troop);
            var properties = TroopType.GetProperties();
            int index = -1;
            foreach (var field in properties)
            {
                if(index==-1)
                { 
                    //do nothing
                }
                else if(index==0)
                { field.SetValue(troop, values[index].Trim()); }
                else
                { field.SetValue(troop, Convert.ToInt32(values[index])); }
                index++;
            }
            troop.ArmyID = armyId;
            return troop;

        }

        public static DynamicParameters GetTroopProperties(Models.Troop troop)
        {
            var pTroup = new DynamicParameters();
            var TroopType = typeof(Models.Troop);
            var properties = TroopType.GetProperties();

            foreach (var field in properties)
            {
                pTroup.Add("@" + field.Name, field.GetValue(troop, null));
            }
            return pTroup;
        }

        internal static MG SetMGValues(string line)
        {
            var MG=new MG();
            var MGType = typeof(Models.MG);
            var properties = MGType.GetProperties();
            string[] lines = line.Split(new string[] {","},StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if(index==1)
                { field.SetValue(MG, lines[index].Trim()); }
                else
                { field.SetValue(MG, Convert.ToInt32(lines[index])); }
                index++;
            }

            return MG;

            
        }

        internal static GunType SetGunType(string line)
        {
            var gunType = new GunType();
            var gunTypeType = typeof(Models.GunType);
            var properties = gunTypeType.GetProperties();
            string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if (index ==1)
                { field.SetValue(gunType, lines[index].Trim()); }
                else
                { field.SetValue(gunType, Convert.ToInt32(lines[index])); }
                index++;
            }

            return gunType;

        }

        internal static Chopper SetChopperValues(string line)
        {
            var chopper  = new Chopper();
            var chopperType = typeof(Models.Chopper);
            var properties = chopperType.GetProperties();
            string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if (index == 1)
                {
                    field.SetValue(chopper, lines[index].Trim().Substring(2, lines[index].Length - 4)); }
                else if (index == 4 || index == 5)
                {
                    field.SetValue(chopper, lines[index].Trim().Substring(1, lines[index].Length - 2));
                }
                else
                {
                    field.SetValue(chopper, Convert.ToInt32(lines[index]));
                    
                }
               

                index++;
            }

            return chopper;
        }

        internal static Experience SetExperienceValues(string line)
        {
            var experience = new Experience();
            var vClassType = typeof(Models.Experience);
            var properties = vClassType.GetProperties();
            string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if (index == 1)
                {
                    field.SetValue(experience, lines[index].Trim().Substring(2, lines[index].Length - 4));
                }
                else
                {
                    field.SetValue(experience, Convert.ToInt32(lines[index].Trim()));

                }

                index++;
            }
            return experience;
        }

        internal static vClass SetClassValues(string line)
        {
            var vclass = new vClass();
            var vClassType = typeof(Models.vClass);
            var properties = vClassType.GetProperties();
            string[] lines = line.Split(new string[] { "," }, StringSplitOptions.None);
            int index = 0;
            foreach (var field in properties)
            {
                if (index == 1)
                {
                    field.SetValue(vclass, lines[index].Trim().Substring(2, lines[index].Length - 4));
                }
                else
                {
                    field.SetValue(vclass, Convert.ToInt32(lines[index]));

                }

                index++;
            }
            return vclass;
        }
    }
}
