using AppUserWeb.Configuration;
using Common.App.Core.Dapper;
using Common.App.Core.Dapper.Configuration;
using Common.App.Core.ServiceContracts;
using Common.App.Core.Services;
using Common.App.Data;
using Common.App.Data.Helpers;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

ConfigureDB.ConfigureDBConnection(builder.Configuration);
builder.Services.AddCoreServices();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(5);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
        .AddCookie(options =>
        {
            options.LoginPath = "/Account/Login";
            options.AccessDeniedPath = "/Account/AccessDenied";
        });

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("AppConnection"),
        sqlServerOptions => sqlServerOptions.CommandTimeout(400));
});

var dataConstant = builder.Configuration.GetSection("DataConstant");
builder.Services.Configure<DataConstant>(dataConstant);

builder.Services.AddHttpContextAccessor();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error/Error");
    app.UseStatusCodePagesWithReExecute("/Error/Error","statusCode={0}");

}
app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseCookiePolicy();
app.UseSession();

app.UseAuthentication();
app.UseAuthorization();


app.MapControllerRoute(
    name: "Dashborad",
    pattern: "{controller=Home}/{action=Dashborad}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}");

app.Run();
