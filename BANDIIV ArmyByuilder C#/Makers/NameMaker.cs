using BandiIVWebApiGetter.Models;

namespace BandiIVWebApiGetter.Makers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
  //  using System.Runtime.Remoting.Messaging;
  //  using System.Text;
  //  using System.Threading.Tasks;
    using Data;
    using Models;
    using Helpers;

    namespace BandiIVWebApiGetter.Makers
    {
        public static class NameMaker
        {
            private static List<LanguageNames> _languageNames = new List<LanguageNames>();
            private static List<Languages> _languages = new List<Languages>();
            private static Random rng = new Random();
            static NameMaker()
            {
                _languageNames = AsyncHttpCalls.GetIt<LanguageNames>("LanguageNames");
                _languages = AsyncHttpCalls.GetIt<Languages>("Languages");

            }
            public static List<string> Make(int nationality, int count)
            {
                List<string> names = new List<string>();
                switch (nationality)
                {
                    case 1:
                        names = DoBritish(count);
                        break;
                    case 2:
                        names = DoGerman(count);
                        break;
                    case 3:
                        names = DoFrench(count);
                        break;
                    case 4:
                        names = DoItalian(count);
                        break;
                    case 5:
                        names = DoSpanish(count);
                        break;
                    case 6:
                        names = DoRussian(count);
                        break;
                    case 7:
                        names = DoMuslimIndian(count);
                        break;
                    case 8:
                        names = DoHindoostani(count);
                        break;
                    case 9:
                        names = DoSikh(count);
                        break;
                    case 10:
                        names = DoOttoman(count);
                        break;
                    case 11:
                        names = DoWestAfrican(count);
                        break;
                    case 12:
                        names = DoChinese(count);
                        break;
                    case 13:
                        names = DoArab(count);
                        break;
                    case 14:
                        names = DoSouthAfrican(count);
                        break;
                    case 15:
                        names = DoAmericanIndian(count);
                        break;
                    case 16:
                        names = DoGreek(count);
                        break;
                    case 17:
                        names = DoSerbian(count);
                        break;
                    case 18:
                        names = DoPolish(count);
                        break;
                    case 19:
                        names = DoKandyan(count);
                        break;
                    case 20:
                        names = DoDanish(count);
                        break;
                    case 21:
                        names = DoSwedish(count);
                        break;
                    case 22:
                        names = DoDutch(count);
                        break;
                    case 23:
                        names = DoMuslimAfrican(count);
                        break;
                    case 24:
                        names = DoScottish(count);
                        break;
                    case 25:
                        names = DoWelsh(count);
                        break;
                    case 26:
                        names = DoIrish(count);
                        break;
                    case 27:
                        names = DoHungarian(count);
                        break;
                    case 28:
                        names = DoBohemian(count);
                        break;
                    case 29:
                        names = DoRoumanian(count);
                        break;
                    case 30:
                        names = DoBulgarian(count);
                        break;
                    case 31:
                        names = DoPortuguese(count);
                        break;
                    case 32:
                        names = DoAmerican(count);
                        break;
                    case 33:
                        names = DoArmenian(count);
                        break;
                    case 34:
                        names = DoIranian(count);
                        break;
                    case 35:
                        names = DoBurman(count);
                        break;
                    case 36:
                        names = DoJapanese(count);
                        break;
                    case 37:
                        names = DoMaori(count);
                        break;



                        //END SELECT


                }

                return names;
            }

            #region General Functions
            private static string RandomName(List<LanguageNames> languageNames)
            {
                int random = 0;
                do
                {
                    random = rng.Next(0, languageNames.Count());

                } while (String.IsNullOrEmpty(languageNames.ElementAt(random).Moniker));

                return languageNames.ElementAt(random).Moniker;
            }

            private static string RandomNameWithout(List<LanguageNames> languageNames, string without)
            {
                int random = 0;
                do
                {
                    random = rng.Next(0, languageNames.Count());
                } while (languageNames.ElementAt(random).Moniker == without || String.IsNullOrEmpty(languageNames.ElementAt(random).Moniker));

                return languageNames.ElementAt(random).Moniker;
            }

            private static List<LanguageNames> GetOneSetOfNames(int languageId, int position)
            {
                return _languageNames.Where(n => n.LanguageId == languageId && n.NamePosition == position).ToList();
            }
            #endregion


            #region Muslim Indian

            private static List<string> DoMuslimIndian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.MuslimIndian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.MuslimIndian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeMuslimIndian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeMuslimIndian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                return firstName + middleName + lastName;
            }
            #endregion

            #region  Hindoostani

            private static List<string> DoHindoostani(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Hindoostani, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Hindoostani, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeHindoostani(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeHindoostani(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var middleName = RandomName(firstNames);
                var lastName = "";
                var percent = rng.Next(1, 100);



                if (percent < 30)
                {
                    lastName = RandomName(lastNames);
                }
                return firstName + " " + middleName + " " + lastName;
            }
            #endregion

            #region  Sikh

            private static List<string> DoSikh(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Sikh, 1);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeSikh(firstNames));
                }
                return names;
            }

            private static string MakeSikh(List<LanguageNames> firstNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = " Singh";

                return firstName + lastName;
            }
            #endregion

            #region  West African
            private static List<string> DoWestAfrican(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.WestAfrican, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.WestAfrican, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeWestAfrican(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeWestAfrican(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Ottoman
            private static List<string> DoOttoman(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Ottoman, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Ottoman, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeOttoman(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeOttoman(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Chinese
            private static List<string> DoChinese(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Chinese, 1);
                var middleNames = GetOneSetOfNames((int)Enums.Languages.Chinese, 2);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Chinese, 3);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeChinese(firstNames, middleNames, lastNames));
                }
                return names;
            }

            private static string MakeChinese(List<LanguageNames> firstNames, List<LanguageNames> middleNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var middleName = RandomName(middleNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + middleName + " " + lastName;
            }
            #endregion

            #region  Arab
            private static List<string> DoArab(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Arab, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Arab, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeArab(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeArab(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " ibn " + lastName;
            }
            #endregion

            #region  SouthAfrican
            private static List<string> DoSouthAfrican(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.SouthAfrican, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.SouthAfrican, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeSouthAfrican(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeSouthAfrican(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  AmericanIndian
            private static List<string> DoAmericanIndian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.AmericanIndian, 1);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeAmericanIndian(firstNames));
                }
                return names;
            }

            private static string MakeAmericanIndian(List<LanguageNames> firstNames)
            {

                var firstName = RandomName(firstNames);

                return firstName;
            }
            #endregion

            #region  Greek
            private static List<string> DoGreek(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Greek, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Greek, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeGreek(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeGreek(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Serbian
            private static List<string> DoSerbian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Serbian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Serbian, 1);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeSerbian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeSerbian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName + "ović";
            }
            #endregion

            #region  Polish
            private static List<string> DoPolish(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Polish, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Polish, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakePolish(firstNames, lastNames));
                }
                return names;
            }

            private static string MakePolish(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Kandyan
            private static List<string> DoKandyan(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Kandyan, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Kandyan, 1);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeKandyan(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeKandyan(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region Danish
            private static List<string> DoDanish(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Danish, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Danish, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeDanishName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeDanishName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 50) == 1)
                {
                    middleName = " " + RandomNameWithout(firstNames, firstName) + " ";
                }
                return firstName + middleName + lastName;
            }
            #endregion

            #region Swedish
            private static List<string> DoSwedish(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Swedish, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Swedish, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeSwedishName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeSwedishName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 50) == 1)
                {
                    middleName = " " + RandomNameWithout(firstNames, firstName) + " ";
                }
                return firstName + middleName + lastName;
            }
            #endregion

            #region Dutch
            private static List<string> DoDutch(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Dutch, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Dutch, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeDutchName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeDutchName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 50) == 1)
                {
                    middleName = " " + RandomNameWithout(firstNames, firstName) + " ";
                }
                return firstName + middleName + lastName;
            }
            #endregion

            #region  MuslimAfrican
            private static List<string> DoMuslimAfrican(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.MuslimAfrican, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.MuslimAfrican, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeMuslimAfrican(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeMuslimAfrican(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Scottish
            private static List<string> DoScottish(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Scottish, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Scottish, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeScottish(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeScottish(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion



            #region  Welsh
            private static List<string> DoWelsh(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Welsh, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Welsh, 2);
                var middleNames = GetOneSetOfNames((int)Enums.Languages.Welsh, 3);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeWelsh(firstNames, lastNames, middleNames));
                }
                return names;
            }

            private static string MakeWelsh(List<LanguageNames> firstNames, List<LanguageNames> lastNames, List<LanguageNames> middleNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = RandomName(middleNames);

                var percent = rng.Next(1, 100);
                if (percent < 50)
                {
                    firstName = firstName + " " + middleName;
                }


                return firstName + " " + lastName;


            }
            #endregion

            #region  Irish
            private static List<string> DoIrish(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Irish, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Irish, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeIrish(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeIrish(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Hungarian
            private static List<string> DoHungarian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Hungarian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Hungarian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeHungarian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeHungarian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Bohemian
            private static List<string> DoBohemian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Bohemian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Bohemian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeBohemian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeBohemian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Roumanian
            private static List<string> DoRoumanian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Roumanian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Roumanian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeRoumanian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeRoumanian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Bulgarian
            private static List<string> DoBulgarian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Bulgarian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Bulgarian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeBulgarian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeBulgarian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region Portuguese
            private static List<string> DoPortuguese(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Portuguese, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Portuguese, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakePortugueseName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakePortugueseName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 10) == 1)
                {
                    middleName = " " + RandomNameWithout(lastNames, lastName) + " ";
                }
                return firstName + middleName + lastName;
            }
            #endregion

            #region American
            private static List<string> DoAmerican(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.American, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.American, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeAmericanName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeAmericanName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 10) == 1)
                {
                    middleName = " " + RandomNameWithout(firstNames, firstName) + " ";
                }
                return firstName + middleName + lastName;
            }
            #endregion


            #region  Armenian

            private static List<string> DoArmenian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Armenian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Armenian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeArmenian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeArmenian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var percent = rng.Next(1, 100);

                if (percent < 30)
                {
                    firstName = "Melik-" + RandomName(firstNames);
                    if (percent < 10)
                    {
                        firstName = "Ter-" + RandomName(firstNames);
                    }
                }
                return firstName + " " + lastName;
            }
            #endregion

            #region  Iranian
            private static List<string> DoIranian(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Iranian, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Iranian, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeIranian(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeIranian(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);


                return firstName + " " + lastName;

            }
            #endregion

            #region  Burman
            private static List<string> DoBurman(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Burman, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Burman, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeBurman(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeBurman(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 10) == 1)
                {
                    middleName = " " + RandomNameWithout(firstNames, firstName) + " ";
                }
                return firstName + middleName + lastName;
                //  return firstName + " " + lastName;
            }
            #endregion

            #region  Japanese
            private static List<string> DoJapanese(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Japanese, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Japanese, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeJapanese(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeJapanese(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region  Maori
            private static List<string> DoMaori(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.Maori, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.Maori, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeMaori(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeMaori(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);

                return firstName + " " + lastName;
            }
            #endregion

            #region British
            private static List<string> DoBritish(int count)
            {

                var firstNames = GetOneSetOfNames((int)Enums.Languages.English, 1);
                var lastNames = GetOneSetOfNames((int)Enums.Languages.English, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeBritishName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeBritishName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {

                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var middleName = " ";
                if (rng.Next(1, 10) == 1)
                {
                    middleName = " " + RandomNameWithout(firstNames, firstName) + " ";
                }
                return firstName + middleName + lastName;
            }
            #endregion
            #region German
            private static List<string> DoGerman(int count)
            {
                var firstNames = GetOneSetOfNames(2, 1);
                var lastNames = GetOneSetOfNames(21, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeGermanName(firstNames, lastNames));
                }
                return names;


            }

            private static string MakeGermanName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {


                var firstName = RandomName(firstNames);
                var middleName = " ";
                var lastName = RandomName(lastNames);
                var titles = " ";
                if (rng.Next(1, 30) == 1)
                {
                    middleName = "-" + RandomNameWithout(firstNames, firstName) + " ";
                }


                var percent = rng.Next(1, 100);

                if (percent < 50)
                {
                    titles = " von ";
                }
                if (percent > 50 && percent < 65)
                {
                    titles = " Freiherr von ";
                }
                if (percent == 94)
                {
                    titles = " vom und zu ";
                }
                if (percent > 94)
                {
                    titles = " zu ";
                }

                return firstName + middleName + titles + lastName;
            }



            #endregion
            #region French

            private static List<string> DoFrench(int count)
            {
                var firstNames = GetOneSetOfNames(3, 1);
                var lastNames = GetOneSetOfNames(3, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeFrenchName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeFrenchName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {


                var firstName = RandomName(firstNames);
                var middleName = " ";
                var lastName = RandomName(lastNames);
                var titles = " ";
                if (rng.Next(1, 25) == 1)
                {
                    middleName = "-" + RandomNameWithout(firstNames, firstName) + " ";
                }


                var percent = rng.Next(1, 100);

                if (percent < 10)
                {
                    titles = " de ";
                }
                // todo
                // d'
                // du

                return firstName + middleName + titles + lastName;
            }



            #endregion
            #region Italian
            private static List<string> DoItalian(int count)
            {
                var firstNames = GetOneSetOfNames(4, 1);
                var lastNames = GetOneSetOfNames(4, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeItalianName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeItalianName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {


                var firstName = RandomName(firstNames);
                var lastName = RandomName(lastNames);
                var titles = " ";

                var percent = rng.Next(1, 100);

                if (percent < 20)
                {
                    titles = " di ";
                }
                return firstName + titles + lastName;
            }


            #endregion
            #region Spanish
            private static List<string> DoSpanish(int count)
            {
                var firstNames = GetOneSetOfNames(5, 1);
                var lastNames = GetOneSetOfNames(5, 2);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeSpanishName(firstNames, lastNames));
                }
                return names;
            }

            private static string MakeSpanishName(List<LanguageNames> firstNames, List<LanguageNames> lastNames)
            {


                var firstName = RandomName(firstNames);
                var midName = " ";
                var lastName = RandomName(lastNames);
                var addLastName = " ";
                var titles = " ";

                var percent = rng.Next(1, 100);

                if (percent < 30)
                {
                    midName = "-" + RandomNameWithout(firstNames, firstName) + " ";
                }

                percent = rng.Next(1, 100);

                if (percent < 30)
                {
                    addLastName = "-" + RandomNameWithout(lastNames, lastName) + " ";
                }

                percent = rng.Next(1, 100);

                if (percent > 94)
                {
                    titles = " de la Cruz";
                }

                return firstName + midName + lastName + addLastName + titles;
            }




            #endregion
            #region Russian

            private static List<string> DoRussian(int count)
            {
                var firstNames = GetOneSetOfNames(6, 1);
                var middleNames = GetOneSetOfNames(6, 2);
                var lastNames = GetOneSetOfNames(6, 3);
                List<string> names = new List<string>();
                for (int i = 0; i < count; i++)
                {
                    names.Add(MakeRussianName(firstNames, middleNames, lastNames));
                }
                return names;
            }

            private static string MakeRussianName(List<LanguageNames> firstNames, List<LanguageNames> middleNames, List<LanguageNames> lastNames)
            {


                var firstName = RandomName(firstNames);
                var middleName = RandomName(middleNames);
                var lastName = RandomName(lastNames);
                {
                    middleName = " " + middleName + "ovich ";
                }

                return firstName + middleName + lastName;
            }


            #endregion
        }
    }


}
