using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SEP_SAC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Home",
                url: "registro",
                defaults: new { controller = "Home", action = "Registro" }
            );

            routes.MapRoute(
                name: "Certificados",
                url: "certificados",
                defaults: new { controller = "Home", action = "Certificados" }
            );

            routes.MapRoute(
                name: "Tramite",
                url: "Tramite/{id}",
                defaults: new { controller = "Home", action = "Tramite", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
