using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_Units:DbConnection
    {
//get All
        public DataTable Getall()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = new SqlConnection(strConnect);
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_Units_GetAll";
                if (con.State == ConnectionState.Closed) { con.Open(); }
                var rdr = cmd.ExecuteReader();

                dt.Load(rdr);


                return dt;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
//AddtoDB
        public int AddToDB(string Unit_Name, String Status)
        {

            try
            {
                SqlConnection con = new SqlConnection(strConnect);
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_Units_AddToDB";
                cmd.Parameters.AddWithValue("@Unit_Name", Unit_Name);
                cmd.Parameters.AddWithValue("@Status", Status);
                SqlParameter returnParameter = new SqlParameter();
                returnParameter.ParameterName = "@ID";
                returnParameter.SqlDbType = SqlDbType.Int;
                returnParameter.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(returnParameter);

                if (con.State == ConnectionState.Closed) { con.Open(); }
                cmd.ExecuteNonQuery();

                if (returnParameter.Value != DBNull.Value)
                {
                    return Convert.ToInt32(returnParameter.Value);
                }
                return -1;



            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
//UpdateToDB
        public bool UpdateToDB(string Unit_Name, String Status, int UnitID)
        {

            try
            {
                SqlConnection con = new SqlConnection(strConnect);
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_Units_UpdateToDB";
                cmd.Parameters.AddWithValue("@Unit_Name", Unit_Name);
                cmd.Parameters.AddWithValue("@Status", Status);
                cmd.Parameters.AddWithValue("@UnitID", UnitID);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                if (cmd.ExecuteNonQuery() > 0)
                {
                    return true;
                }
                return false;



            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public DataTable GetFromDB(int id)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = new SqlConnection(strConnect);
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_Units_GetfromDB";
                cmd.Parameters.AddWithValue("@UnitID", id);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                var rdr = cmd.ExecuteReader();

                dt.Load(rdr);


                return dt;
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        public bool DeleteFromDB(int UnitID)
        {

            try
            {
                SqlConnection con = new SqlConnection(strConnect);
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_Units_Delete_FromDB"; 
                cmd.Parameters.AddWithValue("@UnitID", UnitID);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                if (cmd.ExecuteNonQuery() > 0)
                {
                    return true;
                }
                return false;



            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

