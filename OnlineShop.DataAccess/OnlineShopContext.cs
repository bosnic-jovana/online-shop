using Microsoft.EntityFrameworkCore;
using OnlineShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.DataAccess
{
    public class OnlineShopContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);
            modelBuilder.Entity<UserUseCase>().HasKey(x => new { x.UserId, x.UseCaseId });
            modelBuilder.Entity<ProductFeature>().HasKey(x => new { x.ProductId, x.FeatureId });
            modelBuilder.Entity<ProductKeyword>().HasKey(x => new { x.ProductId, x.KeywordId });
            modelBuilder.Entity<Cart>().HasKey(x => new { x.ProductId, x.UserId });


            base.OnModelCreating(modelBuilder);
        }

        public OnlineShopContext(DbContextOptions options = null) : base(options)
        {

        }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-KS3EQ1L\SQLEXPRESS;Initial Catalog=onlineShop;Integrated Security=True")
        //        .UseLazyLoadingProxies();
        //}

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Feature> Features { get; set; }
        public DbSet<Keyword> Keywords { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<ProductFeature> ProductFeatures { get; set; }
        public DbSet<ProductKeyword> ProductKeywords { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
    }
}
