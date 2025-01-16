using BIA.Data;
using BIA.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Configuration.AddEnvironmentVariables();
// Add services to the container.
builder.Services.AddControllersWithViews();
var user = builder.Configuration["DB_USER"];
var password = builder.Configuration["DB_PWD"];
var host = builder.Configuration["DB_HOST"];
var port = builder.Configuration["DB_PORT"];
var db = builder.Configuration["DB"];

string conectionstring =  String.Format("User ID={0};Password={1};Server={2};Port={3};Database={4}; Pooling=true;", user, password,host,port,db);
builder.Services.AddDbContext<MeuDbContext>(options => options.UseNpgsql(conectionstring));
// builder.Services.AddDbContext<MeuDbContext>(options => options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));
builder.Services.AddTransient<IServiceApi, ServiceApi>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
