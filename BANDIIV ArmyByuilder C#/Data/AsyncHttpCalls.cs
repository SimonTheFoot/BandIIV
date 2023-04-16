using System;
using System.Net.Http.Headers;
using Newtonsoft.Json;


namespace BandiIVWebApiGetter.Data
{
    public static class AsyncHttpCalls
    {
        private static readonly HttpClient Client = new HttpClient();
        private static string BaseUri= "https://www.luddites4all.co.uk/fixed/"; //todo make configurable  

        static AsyncHttpCalls()
        {

            Client.DefaultRequestHeaders.Accept.Add(new
            MediaTypeWithQualityHeaderValue("application/json"));
 //           var byteArray = new UTF8Encoding().GetBytes("AUser:Fred");
            //Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray));
            //if (ConfigurationManager.AppSettings["Live"] == "True")
            //{
            //    BaseUri = Configuration["BaseUriLive"];
            //}
            //else
            //{
            //    BaseUri = ConfigurationManager.AppSettings["BaseUriDebug"];
            //}
        }
        public static List<T> GetIt<T>(string target)
        {
            string uri = Path.Combine(BaseUri, target);
                HttpResponseMessage response = Client.GetAsync(uri).Result;
                string strJson = response.Content.ReadAsStringAsync().Result;

            List<T> obj = JsonConvert.DeserializeObject<List<T>>(strJson);   //  JsonSerializer.Deserialize<List<T>>(strJson);

                return obj;
        }
    }
}

