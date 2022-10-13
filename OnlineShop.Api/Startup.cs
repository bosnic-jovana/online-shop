using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using OnlineShop.Application.UseCases.Commands;
using OnlineShop.Application.UseCases.Queries;
using OnlineShop.DataAccess;
using OnlineShop.Implementation.UseCases.Commands;
using OnlineShop.Implementation.UseCases.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnlineShop.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddTransient(x =>
            {
                var optionsBuilder = new DbContextOptionsBuilder();

                optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-KS3EQ1L\SQLEXPRESS;Initial Catalog=onlineShop;Integrated Security=True").UseLazyLoadingProxies();

                var options = optionsBuilder.Options;

                return new OnlineShopContext(options);
            });

            services.AddControllers();
            services.AddHttpContextAccessor();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "OnlineShop.Api", Version = "v1" });
            });

            services.AddTransient<IFindProductQuery, EFFindProductQuery>();
            services.AddTransient<IGetProductsQuery, EFGetProductsQuery>();
            services.AddTransient<IGetCartQuery, EFGetCartQuery>();
            services.AddTransient<IAddToCartCommand, EFAddToCartCommand>();
            services.AddTransient<IRemoveFromCartCommand, EFRemoveFromCartCommand>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "OnlineShop.Api v1"));
            }

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
