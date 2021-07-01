using System;
using System.Collections.Generic;

namespace SmartphoneShopping.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public byte Status { get; set; }
        public string Note { get; set; }
        public DateTime OrderedDate { get; set; }
        public int CustomerId { get; set; }

        public virtual User Customer { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
