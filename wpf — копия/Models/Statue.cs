using System;
using System.Collections.Generic;

namespace Khrameeva3.Models;

public partial class Statue
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
