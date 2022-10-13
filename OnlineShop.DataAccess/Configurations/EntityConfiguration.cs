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
    public abstract class EntityConfiguration<T> : IEntityTypeConfiguration<T>
          where T : Entity
    {
        public void Configure(EntityTypeBuilder<T> builder)
        {
            ConfigureRules(builder);
        }
        protected abstract void ConfigureRules(EntityTypeBuilder<T> builder);
    }
}
