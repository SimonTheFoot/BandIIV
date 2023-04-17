using BandiIVWebApiGetter.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Syncfusion.Blazor;
using Syncfusion.Blazor.Cards;
var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";
//var builder = WebApplication.CreateBuilder(args);
var builder = WebApplication.CreateBuilder(new WebApplicationOptions
{
    EnvironmentName = Environments.Development
});
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
        builder =>
        {
            builder.WithOrigins("http://bloodandiron.co.uk",
                "https://bloodandiron.co.uk");
        });
});
// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSyncfusionBlazor(); 
builder.Services.AddHttpClient();

//builder.Services.AddSyncfusionBlazor(options => { options.IgnoreScriptIsolation = true; });

var app = builder.Build();
Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("Mgo+DSMBaFt+QHFqVkNrXVNbdV5dVGpAd0N3RGlcdlR1fUUmHVdTRHRcQl5hSn9Tc0BgXXpWeHA=;Mgo+DSMBPh8sVXJ1S0d+X1RPd11dXmJWd1p/THNYflR1fV9DaUwxOX1dQl9gSX1RdURjXHpddHJVR2Q=;ORg4AjUWIQA/Gnt2VFhhQlJBfV5AQmBIYVp/TGpJfl96cVxMZVVBJAtUQF1hSn5QdEZiWXpbc3BTR2VY;MTQzODc0MUAzMjMxMmUzMTJlMzMzNVhCVGlidW9SU2diYXV5VE5uZDNCeDdnaDB1RlViZStGTUV0OUN1RTRFR2c9;MTQzODc0MkAzMjMxMmUzMTJlMzMzNWR2dTIxM2Q4bEdZaGV1cDl3TEFSVGtWMjNEcis4VE96dkZJUEN5WUh5WEE9;NRAiBiAaIQQuGjN/V0d+XU9Hc1RDX3xKf0x/TGpQb19xflBPallYVBYiSV9jS31TdUdgWH9bdXdRQGlcWQ==;MTQzODc0NEAzMjMxMmUzMTJlMzMzNVJHZDNkNzVBLzVlRTdnOHN2dXFsWVVoVmZGa0xlQ0NCT2xPZEw2T1dtVXc9;MTQzODc0NUAzMjMxMmUzMTJlMzMzNVdSaHlYNExMVGczR3N6aDhJc3lWRDdNbUkzaG9YNFZMY0doYXA1ZlBOVUE9;Mgo+DSMBMAY9C3t2VFhhQlJBfV5AQmBIYVp/TGpJfl96cVxMZVVBJAtUQF1hSn5QdEZiWXpbc3BSQGVU;MTQzODc0N0AzMjMxMmUzMTJlMzMzNVkwRDY2azhKVHVJZ00vSGhxSGZGWTBFalU0czhKMVdDUzAwM0grSU5rdzQ9;MTQzODc0OEAzMjMxMmUzMTJlMzMzNWtpUm10UHgwajd5WkpwbmZXOWR2dmpOcmxGZWZZRVZsUmRzR1ZLQytnMVU9;MTQzODc0OUAzMjMxMmUzMTJlMzMzNVJHZDNkNzVBLzVlRTdnOHN2dXFsWVVoVmZGa0xlQ0NCT2xPZEw2T1dtVXc9");
// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseCors(MyAllowSpecificOrigins);

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

//Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("Njk1NDc0QDMyMzAyZTMyMmUzMFJxcmFTTkhJaUZrQnVRT0h5WUNzSG9DSWxaTGpPWW5HZDBkbVhrZnFXQzQ9");

app.Run();
