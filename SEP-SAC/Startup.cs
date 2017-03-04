using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SEP_SAC.Startup))]
namespace SEP_SAC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
