using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Khrameeva3.Models;

public partial class Product
{
    public int Id { get; set; }

    public string Article { get; set; } = null!;

    public string TypeId { get; set; } = null!;

    public int UnitId { get; set; }

    public int Price { get; set; }

    public int SupplierId { get; set; }

    public int ManufacturerId { get; set; }

    public int CategoryId { get; set; }

    public int Discount { get; set; }

    public int QuanityInStock { get; set; }

    public string Description { get; set; } = null!;

    public string Image { get; set; } = null!;

    public virtual Category Category { get; set; } = null!;

    public virtual Manufacturer Manufacturer { get; set; } = null!;

    public virtual Supplier Supplier { get; set; } = null!;

    public virtual Unit Unit { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
    [NotMapped]
    public string Name { get; internal set; }

    [NotMapped]
    public string ImagePath {
        get{
            if (Image == null)
                return "/Images/picture.png"; 

            return $"/Images/{Image}";

        } }

}
