using DAL;
using Microsoft.CodeAnalysis.FlowAnalysis.DataFlow;
using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Diagnostics.CodeAnalysis;

namespace MVC_CORE_CRUD.Models
{
    public class Units
    {

        [Key]
        [Display(Name = "Unit ID")]
        public int UnitID { get; set; }
        [Display(Name = "Unit Name")]
        public string Unit_Name { get; set; }
        [MaybeNull]
        public string Status { get; set; }

        Constants Obj_Constants = new Constants();
        public DataTable GetStatus()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = Obj_Constants.GetStatus();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            return dt;
        }

        public List<Units>GetAll()
        {
            try
            {
                List<Units> obj_List=new List<Units>();
                DAL_Units obj = new DAL_Units();
             DataTable  dt=  obj.Getall();
                foreach(DataRow dtr in  dt.Rows)
                {
                    Units objUnit=new Units { Unit_Name = dtr["Unit_Name"].ToString(),Status= dtr["Status"].ToString(),
                    UnitID=int.Parse(dtr["UnitID"].ToString())
                    };
                    obj_List.Add(objUnit);
                }


                return obj_List;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool AddToDB()
        {
            try
            {
                DAL_Units obj_DAL = new DAL_Units();
               if( obj_DAL.AddToDB(Unit_Name,Status)>0)
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

        public bool UpdateToDB()
        {
            try
            {
                DAL_Units obj_DAL = new DAL_Units();
                if (obj_DAL.UpdateToDB(Unit_Name, Status,UnitID))
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

        public Units GetfromDB(int ID)
        {
            Units obj = new Units();
            try
            {
                DAL_Units obj_Dal = new DAL_Units();
                DataTable dt = obj_Dal.GetFromDB(ID);
                if (dt.Rows.Count > 0)
                {
                    obj.Unit_Name = dt.Rows[0]["Unit_Name"].ToString();
                    obj.UnitID =int.Parse( dt.Rows[0]["UnitID"].ToString());
                    obj.Status =  dt.Rows[0]["Status"].ToString()  ;
                }

                return obj;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public bool DeleteFromDB(int id)
        {
            try
            {
                DAL_Units obj_DAL = new DAL_Units();
                if (obj_DAL.DeleteFromDB(id))
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
