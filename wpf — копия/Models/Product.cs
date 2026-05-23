using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Khrameeva3.Models;

public partial class Product
{
    public int Id { get; set; }

    public string Articul { get; set; } = null!;

    public string Name { get; set; } = null!;

    public int UnitId { get; set; }

    public double Price { get; set; }

    public int SupllierId { get; set; }

    public int MackerId { get; set; }

    public int CategoryId { get; set; }

    public double Discount { get; set; }

    public int CountInStock { get; set; }

    public string Discription { get; set; } = null!;

    public string? Image { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual Macker Macker { get; set; } = null!;

    public virtual Supllier Supllier { get; set; } = null!;

    public virtual Unit Unit { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    [NotMapped]
    [NotMapped]
    public string CountBackground => CountInStock == 0 ? "Gray" : "White";
    [NotMapped]
    public string PriceColor => Discount > 0 ? "Gray" : "Black";
    [NotMapped]
    public string PriceDecoration => Discount > 0 ? "Strikethrough" : "None";
    [NotMapped]
    public double PriceWithDiscount => Price * (1 - Discount / 100);
    [NotMapped]
    public string DiscountColor => Discount > 15 ? "#7fff00" : "White";
    public string ImagePath {
        get{
            if (string.IsNullOrEmpty(Image))
                return "/Images/picture.png"; 

            return $"/Images/{Image}";

        } }

}
