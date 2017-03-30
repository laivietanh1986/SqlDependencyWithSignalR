namespace SignalRWithSqlDependency.Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BlogDemo : DbContext
    {
        public BlogDemo()
            : base("name=BlogDemo")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
