using System;
using System.Collections.Generic;

namespace Khrameeva3.Models;

public partial class Supllier
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
