using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Khrameeva3.Models;

public partial class DeDbContext : DbContext
{
    public DeDbContext()
    {
    }

    public DeDbContext(DbContextOptions<DeDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Macker> Mackers { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<AdressPVZ> AdressPVZs { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<RolesUser> RolesUsers { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<Supllier> Suplliers { get; set; }

    public virtual DbSet<Unit> Units { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=169.254.131.1;Initial Catalog=user14;User ID=user14;Password=dYWba#;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False;Command Timeout=30");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.ToTable("Categories");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Macker>(entity =>
        {
            entity.ToTable("Mackers");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.ToTable("Orders");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.TovarId).HasColumnName("tovarId");
            entity.Property(e => e.Count).HasColumnName("count");
            entity.Property(e => e.DateOrder).HasColumnName("dateOrder");
            entity.Property(e => e.DateDelivery).HasColumnName("dateDelivery");
            entity.Property(e => e.PVZId).HasColumnName("PVZId");
            entity.Property(e => e.User_id).HasColumnName("user_id");
            entity.Property(e => e.IssueCode).HasColumnName("issueCode");
            entity.Property(e => e.StatusId).HasColumnName("statusId");
            entity.Property(e => e.NumderOrder).HasColumnName("numderOrder");

            entity.HasOne(d => d.AdressPVZ).WithMany(p => p.Orders)
                .HasForeignKey(d => d.PVZId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Orders_AdressPVZ");

            entity.HasOne(d => d.Status).WithMany(p => p.Orders)
                .HasForeignKey(d => d.StatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Orders_Statuses");

            entity.HasOne(d => d.User).WithMany(p => p.Orders)
                .HasForeignKey(d => d.User_id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Orders_Users");

            entity.HasOne(d => d.Product).WithMany(p => p.Orders)
                .HasForeignKey(d => d.TovarId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Orders_Products");
        });

        modelBuilder.Entity<AdressPVZ>(entity =>
        {
            entity.ToTable("AdressPVZ");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IndexPVZ).HasColumnName("indexPVZ");
            entity.Property(e => e.City).HasMaxLength(150).HasColumnName("city");
            entity.Property(e => e.Street).HasMaxLength(150).HasColumnName("street");
            entity.Property(e => e.House).HasColumnName("house");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.ToTable("Products");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Articul)
                .HasMaxLength(150)
                .HasColumnName("articul");
            entity.Property(e => e.Name).HasMaxLength(500).HasColumnName("name");
            entity.Property(e => e.UnitId).HasColumnName("unitId");
            entity.Property(e => e.Price).HasColumnName("price");
            entity.Property(e => e.SupllierId).HasColumnName("supllierId");
            entity.Property(e => e.MackerId).HasColumnName("mackerId");
            entity.Property(e => e.CategoryId).HasColumnName("categoryId");
            entity.Property(e => e.Discount).HasColumnName("discount");
            entity.Property(e => e.CountInStock).HasColumnName("countInStock");
            entity.Property(e => e.Discription).HasColumnName("discription");
            entity.Property(e => e.Image)
                .HasMaxLength(100)
                .HasColumnName("image");

            entity.HasOne(d => d.Category).WithMany(p => p.Products)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_Categories");

            entity.HasOne(d => d.Macker).WithMany(p => p.Products)
                .HasForeignKey(d => d.MackerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_Mackers");

            entity.HasOne(d => d.Supllier).WithMany(p => p.Products)
                .HasForeignKey(d => d.SupllierId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_Suplliers");

            entity.HasOne(d => d.Unit).WithMany(p => p.Products)
                .HasForeignKey(d => d.UnitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_Units");
        });

        modelBuilder.Entity<RolesUser>(entity =>
        {
            entity.ToTable("RolesUser");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.ToTable("Statuses");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Supllier>(entity =>
        {
            entity.ToTable("Suplliers");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Unit>(entity =>
        {
            entity.ToTable("Units");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .HasColumnName("name");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("Users");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Lastname).HasMaxLength(100).HasColumnName("lastname");
            entity.Property(e => e.Name).HasMaxLength(100).HasColumnName("name");
            entity.Property(e => e.Patronimic).HasMaxLength(100).HasColumnName("patronimic");
            entity.Property(e => e.Login)
                .HasMaxLength(200)
                .HasColumnName("login");
            entity.Property(e => e.Password)
                .HasMaxLength(100)
                .HasColumnName("password");
            entity.Property(e => e.RoleId).HasColumnName("roleId");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Users_RolesUser");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
