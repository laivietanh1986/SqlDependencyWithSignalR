using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SignalRWithSqlDependency.Data;
using SignalRWithSqlDependency.Hub;


namespace SignalRWithSqlDependency.Controllers
{
    public class HomeController : Controller
    {
        private BlogDemo BlogDemo;
      
        public HomeController()
        {
            BlogDemo = new BlogDemo();
          

        }

        public ActionResult Index()
        {
            RegisterNewDependency();
            return View();
        }

        private void RegisterNewDependency()
        {
            using (
                var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString)
                )
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"Select BlogId,Label,BlogContain from dbo.Blogs", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);
                    var red = command.ExecuteReader();
                }
            }
        }


        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
        
            Debug.Print("Test");
            SqlDependency dependency = (SqlDependency)sender;
            dependency.OnChange -= dependency_OnChange;
            RegisterNewDependency();
            MessageHub.UpdateMessage();
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
             MessageHub.Hello();
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            MessageHub.UpdateMessage();
            return View();
        }

        public ActionResult GetBlog()
        {
            var data = BlogDemo.Blogs.ToList();
            return View(data);
        }

        public ActionResult Create()
        {
            return View(new Blog());
        }
        [HttpPost]
        public ActionResult Create(Blog model)
        {
            BlogDemo.Blogs.Add(model);
            BlogDemo.SaveChanges();
            return View(new Blog());
        }
    }
}