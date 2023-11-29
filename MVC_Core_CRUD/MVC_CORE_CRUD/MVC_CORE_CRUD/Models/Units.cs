using DAL;
using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Diagnostics.CodeAnalysis;

namespace MVC_CORE_CRUD.Models
{
    public class Units
    {

        [Key]
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
    }
}
