using System;
using System.Collections.Generic;

namespace Khrameeva3.Models;

public partial class Order
{
    public int Id { get; set; }

    public int OrderNumber { get; set; }

    public string Article { get; set; } = null!;

    public int Quanity { get; set; }

    public DateOnly OrderDate { get; set; }

    public DateOnly DeliveriDate { get; set; }

    public int PointId { get; set; }

    public int UserId { get; set; }

    public int Code { get; set; }

    public int StatusId { get; set; }

    public virtual Point Point { get; set; } = null!;

    public virtual Statue Status { get; set; } = null!;

    public virtual User User { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
