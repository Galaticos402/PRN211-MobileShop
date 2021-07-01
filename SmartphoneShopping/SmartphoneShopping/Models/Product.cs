using System;
using System.Collections.Generic;

namespace SmartphoneShopping.Models
{
    public partial class Product
    {
        public Product()
        {
            Feedbacks = new HashSet<Feedback>();
            OrderDetails = new HashSet<OrderDetail>();
            ProductImages = new HashSet<ProductImage>();
        }

        public int Id { get; set; }
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public byte Status { get; set; }
        public DateTime DateCreated { get; set; }
        public int ProductCategoryId { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
    }
}
