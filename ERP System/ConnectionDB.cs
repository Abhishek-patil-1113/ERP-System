using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ERP_System
{
    public class ConnectionDB
    {
        public SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ERP SystemConnectionString"].ConnectionString);
        public SqlCommand cmd;
        public string q;
        public SqlDataAdapter adapter;
        public SqlDataReader reader;
    }
}