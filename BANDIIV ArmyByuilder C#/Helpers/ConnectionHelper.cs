using System;
using System.Data;
using System.Data.SqlClient;
namespace BandiIVWebApiGetter.Helpers
{
    public static class ConnectionHelper
    {
        public static R Connect<R>(string connString, Func<IDbConnection, R> f)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                return f(conn);
            }
        }
    }
}
