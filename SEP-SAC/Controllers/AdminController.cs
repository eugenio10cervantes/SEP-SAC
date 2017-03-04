using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using SEP_SAC.Models;
using System.Data.Entity;
using Microsoft.AspNet.Identity;
using System.IO;
using PagedList;

namespace SEP_SAC.Controllers
{
    public class AdminController : Controller
    {
        private SACEntities db = new SACEntities();

        // GET: Admin
        [Authorize(Roles = "Superadmin,Admin,Evaluador,CProfesionistas")]
        public ActionResult Index()
        {
            return View();
        }

        /* Inicia seccion de Procedimientos */
        [Authorize(Roles = "Superadmin")]
        public ActionResult Procedimientos()
        {
            return View(db.Procedimientos.ToList());
        }

        // GET: Admin/Procedimiento/5
        [Authorize(Roles = "Superadmin")]
        public ActionResult Procedimiento(int? id)
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

        // GET: Admin/CrearProcedimiento
        [Authorize(Roles = "Superadmin")]
        public ActionResult CrearProcedimiento()
        {
            return View();
        }

        // POST: Admin/CrearProcedimiento
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult CrearProcedimiento([Bind(Include = "id,nombre")] Procedimiento procedimientos)
        {
            if (ModelState.IsValid)
            {
                procedimientos.creacion = DateTime.Now;
                procedimientos.modificacion = DateTime.Now;
                db.Procedimientos.Add(procedimientos);
                db.SaveChanges();
                return RedirectToAction("Procedimientos");
            }

            return View(procedimientos);
        }

        [Authorize(Roles = "Superadmin")]
        public ActionResult EditarProcedimiento(int? id)
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult EditarProcedimiento([Bind(Include = "id,nombre,creacion,modificacion")] Procedimiento procedimientos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(procedimientos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Procedimientos");
            }
            return View(procedimientos);
        }

        // GET: Procedimientos/Delete/5
        [Authorize(Roles = "Superadmin")]
        public ActionResult BorrarProcedimiento(int? id)
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
        [HttpPost, ActionName("BorrarProcedimiento")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Procedimiento procedimientos = db.Procedimientos.Find(id);
            db.Procedimientos.Remove(procedimientos);
            db.SaveChanges();
            return RedirectToAction("Procedimientos");
        }

        /* Termina seccion de Procedimientos */

        /* Seccion de Niveles */

        // GET: Niveles/Details/5
        [Authorize(Roles = "Superadmin")]
        public ActionResult Nivel(int? id)
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

        // GET: Admin/CrearProcedimiento
        [Authorize(Roles = "Superadmin")]
        public ActionResult AgregarNivel(int? id)
        {
            ViewBag.id = id;
            Procedimiento procedimientos = db.Procedimientos.Find(id);
            ViewBag.nombre_procedimiento = procedimientos.nombre;
            return View();
        }

        // POST: Admin/CrearProcedimiento
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult AgregarNivel([Bind(Include = "id,nombre,procedimiento_id")] Nivel niveles)
        {
            if (ModelState.IsValid)
            {
                niveles.creacion = DateTime.Now;
                niveles.modificacion = DateTime.Now;
                db.Niveles.Add(niveles);
                db.SaveChanges();
                return RedirectToAction("Procedimiento", new { id = niveles.procedimiento_id });
            }

            return View(niveles);
        }

        [Authorize(Roles = "Superadmin")]
        public ActionResult EditarNivel(int? id)
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult EditarNivel([Bind(Include = "id,nombre,procedimiento_id,creacion,modificacion")] Nivel niveles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(niveles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Procedimiento", new { id = niveles.procedimiento_id });
            }
            return View(niveles);
        }

        // GET: Niveles/Delete/5
        [Authorize(Roles = "Superadmin")]
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
        [Authorize(Roles = "Superadmin")]
        public ActionResult DeleteConfirmedNvl(int id)
        {
            Nivel niveles = db.Niveles.Find(id);
            db.Niveles.Remove(niveles);
            db.SaveChanges();
            return RedirectToAction("Procedimiento", "Admin", new { id = niveles.procedimiento_id });
            /* return RedirectToAction("Index"); */
        }

        /*Termina seccion de Niveles */


        /* Seccion de Perfiles */

        [Authorize(Roles = "Superadmin")]
        public ActionResult Perfil(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Perfil perfiles = db.Perfiles.Find(id);
            if (perfiles == null)
            {
                return HttpNotFound();
            }
            return View(perfiles);
        }


        // GET: Admin/CrearProcedimiento
        [Authorize(Roles = "Superadmin")]
        public ActionResult CrearPerfil(int? id)
        {
            ViewBag.id = id;
            Nivel niveles = db.Niveles.Find(id);
            ViewBag.nombre_procedimiento = niveles.Procedimientos.nombre;
            ViewBag.id_procedimiento = niveles.procedimiento_id;
            ViewBag.nombre_nivel = niveles.nombre;
            return View();
        }

        // POST: Admin/CrearProcedimiento
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult CrearPerfil([Bind(Include = "id,nombre,nivel_id")] Perfil perfiles)
        {
            if (ModelState.IsValid)
            {
                perfiles.creacion = DateTime.Now;
                perfiles.modificacion = DateTime.Now;
                db.Perfiles.Add(perfiles);
                db.SaveChanges();
                return RedirectToAction("Nivel", new { id = perfiles.nivel_id });
            }

            return View(perfiles);
        }

        [Authorize(Roles = "Superadmin")]
        public ActionResult EditarPerfil(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Perfil perfiles = db.Perfiles.Find(id);
            if (perfiles == null)
            {
                return HttpNotFound();
            }
            return View(perfiles);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult EditarPerfil([Bind(Include = "id,nombre,nivel_id,creacion,modificacion")] Perfil perfiles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(perfiles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Nivel", new { id = perfiles.nivel_id });
            }
            return View(perfiles);
        }

        // GET: Niveles/Delete/5
        [Authorize(Roles = "Superadmin")]
        public ActionResult BorrarPerfil(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Perfil perfiles = db.Perfiles.Find(id);
            if (perfiles == null)
            {
                return HttpNotFound();
            }
            return View(perfiles);
        }

        // POST: Niveles/Delete/5
        [HttpPost, ActionName("BorrarPerfil")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult DeleteConfirmedPfl(int id)
        {
            Perfil perfiles = db.Perfiles.Find(id);
            db.Perfiles.Remove(perfiles);
            db.SaveChanges();
            return RedirectToAction("Nivel", "Admin", new { id = perfiles.nivel_id });
            /* return RedirectToAction("Index"); */
        }

        /* Termina sección de Perfiles */



        /* Seccion de Requerimientos */

        // GET: Admin/CrearProcedimiento
        [Authorize(Roles = "Superadmin")]
        public ActionResult CrearRequerimiento(int? id)
        {
            ViewBag.id = id;
            Perfil perfiles = db.Perfiles.Find(id);
            ViewBag.nombre_perfil = perfiles.nombre;
            Nivel niveles = perfiles.Niveles;
            ViewBag.nombre_procedimiento = niveles.Procedimientos.nombre;
            ViewBag.id_procedimiento = niveles.procedimiento_id;
            ViewBag.nombre_nivel = niveles.nombre;
            ViewBag.nivel_id = niveles.id;
            return View();
        }

        // POST: Admin/CrearProcedimiento
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult CrearRequerimiento([Bind(Include = "id,nombre,perfil_id,tipo_requerimiento")] Requerimiento requerimientos)
        {
            if (ModelState.IsValid)
            {
                requerimientos.creacion = DateTime.Now;
                requerimientos.modificacion = DateTime.Now;
                if(requerimientos.tipo_requerimiento == null)
                {
                    requerimientos.tipo_requerimiento = "Dato";
                }
                db.Requerimientos.Add(requerimientos);
                db.SaveChanges();
                return RedirectToAction("Perfil", new { id = requerimientos.perfil_id });
            }

            return View(requerimientos);
        }

        // GET: Niveles/Delete/5
        [Authorize(Roles = "Superadmin")]
        public ActionResult BorrarRequerimiento(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Requerimiento requerimientos = db.Requerimientos.Find(id);
            if (requerimientos == null)
            {
                return HttpNotFound();
            }
            return View(requerimientos);
        }

        // POST: Niveles/Delete/5
        [HttpPost, ActionName("BorrarRequerimiento")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Superadmin")]
        public ActionResult DeleteConfirmedReq(int id)
        {
            Requerimiento requerimientos = db.Requerimientos.Find(id);
            db.Requerimientos.Remove(requerimientos);
            db.SaveChanges();
            return RedirectToAction("Perfil", "Admin", new { id = requerimientos.perfil_id});
            /* return RedirectToAction("Index"); */
        }

        /* Termina Seccion de Requerimientos */



        [Authorize(Roles = "Superadmin,Admin,Evaluador,CProfesionistas")]
        public ActionResult Solicitudes()
        {

            if (User.IsInRole("Evaluador"))
            {
                var usr_id = User.Identity.GetUserId();

                var soli = from sol in db.Solicitudes
                           where sol.evaluador_id == usr_id
                           select sol;

                return View(soli.ToList());
            }

            List<Solicitud> solicitudes = db.Solicitudes.ToList();
            return View(solicitudes);
        }

        [Authorize]
        public ActionResult Solicitud(int? id)
        {
            Solicitud solicitudes = db.Solicitudes.Find(id);
            ViewBag.evaluador_id = new SelectList(db.Evaluadores, "id", "nombre");
            ViewBag.colegio_id = new SelectList(db.Colegios, "id", "nombre");

            /* 
                Estatus de solicitudes:
                - Registrado
                - Asignado
                - Reasignado
                - Colegio
                - Aprobado por Colegio
                - Desechado
                - Autorizado
                - Evaluado
                - Admitido
                - Prevencion
                - Finalizado
            */

            return View(solicitudes);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AsignarEvaluador(FormCollection fc)
        {
            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.evaluador_id = fc["evaluador_id"];
            solicitud.estatus = "Asignado";

            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            /* Notificar a Evaluador */

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Reasignacion(FormCollection fc)
        {



            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.estatus = "Colegio";
            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            /* Notificar a Admins */

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AsignarColegio(FormCollection fc)
        {
            ColegioAsignado ca = new ColegioAsignado();
            ca.id = Int32.Parse(fc["solicitud_id"]);
            ca.colegio_id = fc["colegio_id"];
            ca.jefe_departamento = fc["jefe_departamento"];
            ca.cargo = fc["cargo"];
            ca.antecedente = fc["antecedente"];
            ca.periodo = fc["periodo"];
            ca.destinatario = fc["destinatario"];
            ca.puesto = fc["puesto"];
            ca.universidad = fc["universidad"];

            db.ColegiosAsignados.Add(ca);
            db.SaveChanges();

            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.estatus = "Colegio";
            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            /* Crear oficio */

            /* Notificar a Colegio */

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Desechar(FormCollection fc)
        {
            SolicitudDeshechada sd = new SolicitudDeshechada();
            sd.solicitud_id = Int32.Parse(fc["solicitud_id"]);
            sd.jefe_departamento = fc["jefe_departamento"];
            sd.cargo = fc["cargo"];
            sd.documentos = fc["documentos_faltantes"];

            db.SolicitudesDeshechadas.Add(sd);
            db.SaveChanges();

            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.estatus = "Desechado";
            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            /* Notificar al usuario */

            /* Generar el oficio */

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Validar(FormCollection fc)
        {
            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.estatus = "Aprobado por Colegio";
            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Autorizar(FormCollection fc)
        {
            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.estatus = "Autorizado";
            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Evaluar(FormCollection fc)
        {
            Solicitud solicitud = db.Solicitudes.Find(Int32.Parse(fc["solicitud_id"]));
            solicitud.estatus = "Autorizado";
            db.Entry(solicitud).State = EntityState.Modified;
            db.SaveChanges();

            HttpPostedFileBase file = Request.Files["primerarchivo"];

            if (file != null && file.ContentLength > 0)
            {
                string fname = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                string path = "/files/";

                file.SaveAs(Server.MapPath(Path.Combine("~" + path, fname)));

                // Inicializacion de entidad Adjuntos
                Archivo arch = new Archivo();

                // Seteado de datos
                arch.path = path;
                arch.nombre_archivo = fname;
                arch.created = DateTime.Now;
                arch.modified = DateTime.Now;
                arch.mime = file.ContentType;

                // Insercion de tupla y guardado de datos
                db.Archivos.Add(arch);
                db.SaveChanges();

                int id_archivo = arch.id;

            }

            return RedirectToAction("Solicitud", "Admin", new { id = solicitud.id });
        }
    }
}