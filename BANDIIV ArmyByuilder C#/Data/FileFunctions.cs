
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using BandiIVWebApiGetter.Helpers;
using BandiIVWebApiGetter.Models;
using System.Text.Json;
using Syncfusion.Blazor.Navigations;
using BandiIVWebApiGetter.Makers;
using static BandiIVWebApiGetter.Helpers.Enums;

namespace BandiIVWebApiGetter.Data
{
    static public class FileFunctions
    {
        #region saves
        public static void SaveFiles(List<Unit> units, List<ArmyOfficer> officers, string path)
        {
             var extension = Functions.GetSaveTypeExtension(SaveType.UnitsInForce);
            path = Path.ChangeExtension(path, extension);
            WriteToJsonFile(path, units, false);
            extension = Functions.GetSaveTypeExtension(SaveType.OfficersInForce);
            path = Path.ChangeExtension(path, extension);
            WriteToJsonFile(path, officers, false);
        }
        private static void WriteToJsonFile<T>(string filePath, T objectToWrite, bool append = false) where T : new()
        {
            TextWriter writer = null;
            try
            {
                var contentsToWriteToFile = Newtonsoft.Json.JsonConvert.SerializeObject(objectToWrite);
                writer = new StreamWriter(filePath, append);
                writer.Write(contentsToWriteToFile);
            }
            finally
            {
                if (writer != null)
                    writer.Close();
            }
        }
        #endregion



        public static DataSet LoadArmyStructure(List<CompositeList> existingTroops, string path)
        {
            using (DataSet structure = new DataSet())
            {
                //load structure
                var extension = Functions.GetSaveTypeExtension(Enums.SaveType.Force);
                path = Path.ChangeExtension(path, extension);
                structure.ReadXml(path);
                return structure;
            }

        }
        public static List<ArmyOfficer> LoadArmyOfficers(string path)
        {
            using (DataSet structure = new DataSet())
            {
                var extension = Functions.GetSaveTypeExtension(Enums.SaveType.OfficersInForce);
                path = Path.ChangeExtension(path, extension);
                List<ArmyOfficer> officers = ReadFromJsonFile<List<ArmyOfficer>>(path);
                return officers;
            }
        }
        public static List<Unit> LoadArmyUnits(string path)
        {
            using (DataSet structure = new DataSet())
            {
                var extension = Functions.GetSaveTypeExtension(Enums.SaveType.UnitsInForce);
                path = Path.ChangeExtension(path, extension);
                List<Unit> units = ReadFromJsonFile<List<Unit>>(path);
                return units;
            }

        }
        public static List<ArmiesAvailable> GetAvailableArmies(string filePath)
        {

            List<ArmiesAvailable> armies = new List<ArmiesAvailable>();
            var search = "*." + Functions.GetSaveTypeExtension(Enums.SaveType.OfficersInForce);
            foreach (string aPath in Directory.GetFiles(filePath, search)) {
                armies.Add(new ArmiesAvailable(aPath, Path.GetFileName(aPath).Split(".")[0]));
            }


            return armies;
        }
        private static T ReadFromJsonFile<T>(string filePath) where T : new()
        {
            TextReader reader = null;
            try
            {
                reader = new StreamReader(filePath);
                var fileContents = reader.ReadToEnd();
                return JsonSerializer.Deserialize<T>(fileContents);
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
        }
    }
}
