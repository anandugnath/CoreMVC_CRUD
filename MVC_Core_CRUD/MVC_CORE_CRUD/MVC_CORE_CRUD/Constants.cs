using System.Data;

namespace MVC_CORE_CRUD
{
    public class Constants
    {
        public DataTable GetStatus()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Status", typeof(string));
                dt.Columns.Add("StatusID", typeof(int));
                object[] row1 = { "Active", 0 };
                object[] row2 = { "Inactive", 1 };

                dt.Rows.Add(row1);
                dt.Rows.Add(row2);
                return dt;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
