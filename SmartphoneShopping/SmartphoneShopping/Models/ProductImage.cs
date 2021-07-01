using System;
using System.Collections.Generic;

namespace SmartphoneShopping.Models
{
    public partial class ProductImage
    {
        public int ProductId { get; set; }
        public int ImageId { get; set; }

        public virtual ProductAttachedImage Image { get; set; }
        public virtual Product Product { get; set; }
    }
}
