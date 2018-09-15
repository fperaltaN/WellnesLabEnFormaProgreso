using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DataTicketChart.Startup))]
namespace DataTicketChart
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
