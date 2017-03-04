using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SEP_SAC.Models;

namespace SEP_SAC.Controllers
{
    public class ProcedimientosController : Controller
    {
        private SACEntities db = new SACEntities();

        // GET: Procedimientos
        public ActionResult Index()
        {
            return View(db.Procedimientos.ToList());
        }

        // GET: Procedimientos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Procedimiento procedimientos = db.Procedimientos.Find(id);
            if (procedimientos == null)
            {
                return HttpNotFound();
            }
            return View(procedimientos);
        }

        // GET: Procedimientos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Procedimientos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nombre,creacion,modificacion")] Procedimiento procedimientos)
        {
            if (ModelState.IsValid)
            {
                db.Procedimientos.Add(procedimientos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(procedimientos);
        }

        // GET: Procedimientos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Procedimiento procedimientos = db.Procedimientos.Find(id);
            if (procedimientos == null)
            {
                return HttpNotFound();
            }
            return View(procedimientos);
        }

        // POST: Procedimientos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombre,creacion,modificacion")] Procedimiento procedimientos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(procedimientos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(procedimientos);
        }

        // GET: Procedimientos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Procedimiento procedimientos = db.Procedimientos.Find(id);
            if (procedimientos == null)
            {
                return HttpNotFound();
            }
            return View(procedimientos);
        }

        // POST: Procedimientos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Procedimiento procedimientos = db.Procedimientos.Find(id);
            db.Procedimientos.Remove(procedimientos);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
