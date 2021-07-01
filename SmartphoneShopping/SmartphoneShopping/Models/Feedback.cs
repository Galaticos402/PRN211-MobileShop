using System;
using System.Collections.Generic;

namespace SmartphoneShopping.Models
{
    public partial class Feedback
    {
        public int Id { get; set; }
        public string FeedbackContent { get; set; }
        public byte RatedStar { get; set; }
        public byte Status { get; set; }
        public int ProductId { get; set; }
        public int CustomerId { get; set; }

        public virtual User Customer { get; set; }
        public virtual Product Product { get; set; }
    }
}
