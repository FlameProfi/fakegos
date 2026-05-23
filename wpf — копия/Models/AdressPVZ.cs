using System.ComponentModel.DataAnnotations.Schema;
using System;
using System.Collections.Generic;

namespace Khrameeva3.Models;

public partial class AdressPVZ
{
    public int Id { get; set; }

    public int IndexPVZ { get; set; }

    public string City { get; set; } = null!;

    public string Street { get; set; } = null!;

    public int? House { get; set; }
    [NotMapped]
    public string FullName => $"{IndexPVZ}, {City}, {Street}, {House}";

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
