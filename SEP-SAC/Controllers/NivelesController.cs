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
    public class NivelesController : Controller
    {
        private SACEntities db = new SACEntities();

        // GET: Niveles
        public ActionResult Index()
        {
            var niveles = db.Niveles.Include(n => n.Procedimientos);
            return View(niveles.ToList());
        }

        // GET: Niveles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nivel niveles = db.Niveles.Find(id);
            if (niveles == null)
            {
                return HttpNotFound();
            }
            return View(niveles);
        }

        // GET: Niveles/Create
        public ActionResult Create()
        {
            ViewBag.procedimiento_id = new SelectList(db.Procedimientos, "id", "nombre");
            return View();
        }

        // POST: Niveles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nombre,procedimiento_id,creacion,modificacion")] Nivel niveles)
        {
            if (ModelState.IsValid)
            {
                db.Niveles.Add(niveles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.procedimiento_id = new SelectList(db.Procedimientos, "id", "nombre", niveles.procedimiento_id);
            return View(niveles);
        }

        // GET: Niveles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nivel niveles = db.Niveles.Find(id);
            if (niveles == null)
            {
                return HttpNotFound();
            }
            ViewBag.procedimiento_id = new SelectList(db.Procedimientos, "id", "nombre", niveles.procedimiento_id);
            return View(niveles);
        }

        // POST: Niveles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombre,procedimiento_id,creacion,modificacion")] Nivel niveles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(niveles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Details", "Procedimientos",  new { id = niveles.procedimiento_id } );
            }
            ViewBag.procedimiento_id = new SelectList(db.Procedimientos, "id", "nombre", niveles.procedimiento_id.ToString());
            return View(niveles);
        }

        // GET: Niveles/Delete/5
        public ActionResult BorrarNivel(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nivel niveles = db.Niveles.Find(id);
            if (niveles == null)
            {
                return HttpNotFound();
            }
            return View(niveles);
        }

        // POST: Niveles/Delete/5
        [HttpPost, ActionName("BorrarNivel")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Nivel niveles = db.Niveles.Find(id);
            db.Niveles.Remove(niveles);
            db.SaveChanges();
            return RedirectToAction("Details", "Procedimientos", new { id = niveles.procedimiento_id });
            /* return RedirectToAction("Index"); */
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
