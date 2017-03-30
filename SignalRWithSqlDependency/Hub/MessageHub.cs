using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace SignalRWithSqlDependency.Hub
{
    public class MessageHub:Microsoft.AspNet.SignalR.Hub
    {
        public static void Hello()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<MessageHub>();
            context.Clients.All.hello();
        }

        public static void UpdateMessage()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<MessageHub>();
            context.Clients.All.updatedata();
        }
    }
}