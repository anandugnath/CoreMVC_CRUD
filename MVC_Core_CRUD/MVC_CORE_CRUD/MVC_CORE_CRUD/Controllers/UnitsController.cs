using DAL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using MVC_CORE_CRUD.Models;

namespace MVC_CORE_CRUD.Controllers
{
    public class UnitsController : Controller
    {
        // GET: UnitsController
        public ActionResult Index()
        {
            Units model_units=new Units();
            List<Units> lst = new List<Units>();
            lst= model_units.GetAll();
            return View(lst);
        }

        // GET: UnitsController/Details/5
        public ActionResult Details(int id)
        {
            Units obj_units = new Units();
            return View(obj_units.GetfromDB(id));
        }

        // GET: UnitsController/Create
        public ActionResult Create()
        {
            ViewBag.Status_lst = new List<SelectListItem>
            {  new SelectListItem{ Text="Active", Value="Active"},
            new SelectListItem{Text="InActive",Value="InActive"},

            };
            return View();
        }

        // POST: UnitsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Units objUnits)
        {
            try
            {
                if (objUnits.AddToDB())
                {

                    return RedirectToAction(nameof(Index));
                }
                else
                
                {
                    return RedirectToAction(nameof(ErrorViewModel));
                }
            }
            catch
            {
                return View();
            }
        }

        // GET: UnitsController/Edit/5
        public ActionResult Edit(int id)
        {
            Units obj_units = new Units();
            return View(obj_units.GetfromDB(id));
        }

        // POST: UnitsController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Units obj_units)
        {
            try
            {

                obj_units.UpdateToDB();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: UnitsController/Delete/5
        public ActionResult Delete1(int id)
        {
            return View();
        }

        // POST: UnitsController/Delete/5
      
        public ActionResult Delete(int id)
        {
            try
            {
                Units obj_units = new Units();

                if (obj_units.DeleteFromDB(id))
                {
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    return RedirectToAction(nameof(ErrorViewModel));
                }
            }
            catch
            {
                return View();
            }
        }
    }
}
