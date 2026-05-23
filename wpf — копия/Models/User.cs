using System;
using System.Collections.Generic;

namespace Khrameeva3.Models;

public partial class User
{
    public int Id { get; set; }

    public int RoleId { get; set; }

    public string Lastname { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Patronimic { get; set; } = null!;

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual RolesUser Role { get; set; } = null!;
}
