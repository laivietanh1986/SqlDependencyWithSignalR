using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            return View();
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