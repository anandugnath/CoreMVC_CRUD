using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Configuration;
using Microsoft.Extensions.Configuration.Json;

namespace DAL
{
 public class DbConnection
    {
        protected static string strConnect;
        static DbConnection()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory())
          .AddJsonFile("appsettings.json");
            var configuration = builder.Build();
            var connectionString = configuration.GetConnectionString("Conn");
            strConnect = connectionString;// ConfigurationSettings.AppSettings["SqlConnect"];
        }
    }
}
