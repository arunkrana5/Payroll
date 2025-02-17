using Common.App.Core.Dapper;
using Common.App.Core.Dapper.ServiceContracts;
using Common.App.Core.Dapper.ServiceContracts.Services;
using Common.App.Core.ServiceContracts;
using Common.App.Core.Services;
using Common.App.Data;

namespace AppUserWeb.Configuration
{
    public static class ServiceExtensions
    {
        public static IServiceCollection AddCoreServices(this IServiceCollection services)
        {
            // Authentication & Authorization 
            services.AddSingleton<DapperContext>();
            services.AddSingleton<IContextHelper, ContextHelper>();
            //services.AddScoped<IJwtService, JwtService>();
            services.AddScoped<IAccountsServices, AccountsServices>();
            services.AddScoped<ISalaryServices, SalaryServices>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<ICommonServices, CommonServices>();
            services.AddScoped<IMastersServices, MastersServices>();
            services.AddScoped<IEmployeeServices, EmployeeServices>();
            services.AddScoped<IDealerServices, DealerServices>();

            return services;
        }
    }
}
