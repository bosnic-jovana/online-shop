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
    public class UserConfiguration : EntityConfiguration<User>
    {
        protected override void ConfigureRules(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.FirstName).HasMaxLength(40).IsRequired();
            builder.Property(x => x.LastName).HasMaxLength(40).IsRequired();
            builder.Property(x => x.Email).HasMaxLength(40).IsRequired();
            builder.Property(x => x.Password).HasMaxLength(100).IsRequired();

            builder.HasIndex(x => x.Email).IsUnique();

            builder.HasMany(x => x.UseCases).WithOne(x => x.User).HasForeignKey(x => x.UserId);

            builder.HasMany(x => x.Carts)
                           .WithOne(x => x.User)
                           .HasForeignKey(x => x.UserId)
                           .OnDelete(DeleteBehavior.Restrict);
        }
    }

    public class CartConfiguration : EntityConfiguration<Cart>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Cart> builder)
        {
            builder.Property(x => x.Quantity).HasMaxLength(40).IsRequired();

        }
    }
}
