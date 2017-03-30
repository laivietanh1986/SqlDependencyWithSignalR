using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SignalRWithSqlDependency.Startup))]
namespace SignalRWithSqlDependency
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
