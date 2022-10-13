using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using OnlineShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.DataAccess.Configurations
{
    public class ProductConfiguration : EntityConfiguration<Product>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Product> builder)
        {
            builder.HasIndex(x => x.Name);

            builder.Property(x => x.Name).HasMaxLength(50).IsRequired();

            builder.Property(x => x.ProdId).HasMaxLength(100).IsRequired();
            builder.HasIndex(x => x.ProdId).IsUnique();

            builder.Property(x => x.Description).HasMaxLength(100).IsRequired();

            builder.Property(x => x.Url).HasMaxLength(100).IsRequired();

            builder.Property(x => x.Price).IsRequired();

            builder.HasMany(x => x.Images)
                              .WithOne(x => x.Product)
                              .HasForeignKey(x => x.ProductId)
                              .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.ProductFeatures)
                             .WithOne(x => x.Product)
                             .HasForeignKey(x => x.ProductId)
                             .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.ProductKeywords)
                             .WithOne(x => x.Product)
                             .HasForeignKey(x => x.ProductId)
                             .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Carts)
                            .WithOne(x => x.Product)
                            .HasForeignKey(x => x.ProductId)
                            .OnDelete(DeleteBehavior.Restrict);
        }
    }

    public class FeatureConfiguration : EntityConfiguration<Feature>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Feature> builder)
        {

            builder.Property(x => x.Text).HasMaxLength(50).IsRequired();

            builder.HasMany(x => x.ProductFeatures)
                             .WithOne(x => x.Feature)
                             .HasForeignKey(x => x.FeatureId)
                             .OnDelete(DeleteBehavior.Restrict);
        }
    }

    public class KeywordConfiguration : EntityConfiguration<Keyword>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Keyword> builder)
        {

            builder.Property(x => x.Text).HasMaxLength(50).IsRequired();

            builder.HasMany(x => x.ProductKeywords)
                             .WithOne(x => x.Keyword)
                             .HasForeignKey(x => x.KeywordId)
                             .OnDelete(DeleteBehavior.Restrict);
        }
    }

    public class ImageConfiguration : EntityConfiguration<Image>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Image> builder)
        {

            builder.Property(x => x.Url).HasMaxLength(100).IsRequired();

        }
    }
}
