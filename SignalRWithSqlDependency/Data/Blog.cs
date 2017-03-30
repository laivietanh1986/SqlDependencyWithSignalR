namespace SignalRWithSqlDependency.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Blog
    {
        public int BlogId { get; set; }

        [Required]
        [StringLength(50)]
        public string Label { get; set; }

        [Required]
        [StringLength(500)]
        public string BlogContain { get; set; }
    }
}
