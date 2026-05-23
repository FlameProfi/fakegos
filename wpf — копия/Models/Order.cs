using System.ComponentModel.DataAnnotations.Schema;
using System;
using System.Collections.Generic;

namespace Khrameeva3.Models;

public partial class Order
{
    public int Id { get; set; }

    public int TovarId { get; set; }

    public int Count { get; set; }

    public DateTime DateOrder { get; set; }

    public DateTime DateDelivery { get; set; }

    public int PVZId { get; set; }

    public int User_id { get; set; }

    public int IssueCode { get; set; }

    public int StatusId { get; set; }

    public int NumderOrder { get; set; }
    [NotMapped]
    public string Articul => Product?.Articul ?? "";

    public virtual AdressPVZ AdressPVZ { get; set; } = null!;

    public virtual Status Status { get; set; } = null!;

    public virtual User User { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
