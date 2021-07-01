using System;
using System.Collections.Generic;

namespace SmartphoneShopping.Models
{
    public partial class ProductAttachedImage
    {
        public ProductAttachedImage()
        {
            ProductImages = new HashSet<ProductImage>();
        }

        public int ImageId { get; set; }
        public string ImageName { get; set; }

        public virtual ICollection<ProductImage> ProductImages { get; set; }
    }
}
