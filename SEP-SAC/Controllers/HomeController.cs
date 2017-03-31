using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SEP_SAC.Models;
using System.Net;
using System.IO;
using Microsoft.AspNet.Identity;
using System.Text.RegularExpressions;

namespace SEP_SAC.Controllers
{
    public class HomeController : Controller
    {
        private SACEntities db = new SACEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Registro()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Certificados()
        {
            return View(db.Procedimientos.ToList());
        }

        public ActionResult Certificado(int? id)
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

        [Authorize]
        public ActionResult Tramite(int? id)
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

            Datos datos = db.Datos.Find(User.Identity.GetUserId());

            string nombre_completo = datos.nombre + " " + datos.primer_apellido + " " + datos.segundo_apellido;

            ViewBag.nombre_completo = nombre_completo;

            return View(perfiles);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Tramite(FormCollection fc)
        {

            // Creamos la entidad para hacer el insert en la base de datos
            Solicitud solicitud = new Solicitud();

            // Seteamos los datos
            solicitud.evaluador_id = fc["evaluador_id"];
            solicitud.entidad_federativa = fc["entidad_federativa"];
            solicitud.perfil_id = Int32.Parse(fc["perfil_id"]);
            solicitud.solicitante_id = User.Identity.GetUserId();
            solicitud.estatus = "Asignado";
            solicitud.created = DateTime.Now;
            solicitud.modified = DateTime.Now;

            // Revisamos que no haya errores en el modelo
            if(ModelState.IsValid)
            {
                // Agregamos la tupla y guardamos los cambios
                db.Solicitudes.Add(solicitud);
                db.SaveChanges();

                // Obtenemos el id de la solicitud creada
                int solicitud_id = solicitud.id;

                // Encontramos todos los archivos subidos
                var files = Request.Files;

                // Recorremos los archivos
                foreach (var archivo in files)
                {

                    // Encontramos el id del requerimiento al que se refiere el presente archivo
                    string id_requerimiento = archivo.ToString();

                    // Obtenemos el archivo especifico de la lista de archivos
                    HttpPostedFileBase file = Request.Files[archivo.ToString()];

                    // Validamos que el archivo no sea nulo y que tenga un peso positivo
                    if (file != null && file.ContentLength > 0)
                    {
                        
                        // Le damos un nombre unico al archivo y mantenemos su extension
                        string fname = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);

                        // Elegimos la ruta en la que queremos guardar el archivo
                        string path = "/files/";

                        // Guardamos el archivo
                        file.SaveAs(Server.MapPath(Path.Combine("~"+path, fname)));

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

                        Adjunto adjunto = new Adjunto();

                        adjunto.solicitud_id = solicitud_id;
                        adjunto.requerimiento_id = Int32.Parse(Regex.Match(id_requerimiento, "\\d+").Value);
                        adjunto.archivo_id = id_archivo;

                        db.Adjuntos.Add(adjunto);
                        db.SaveChanges();

                    }
                }

            }

            return RedirectToAction("Index");
        }
    }
}