var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Endpoints mínimos
app.MapGet("/", () => new { message = "Hello from .NET 8 Minimal API" });

app.MapGet("/time", () =>
{
    var now = DateTimeOffset.UtcNow;
    return Results.Ok(new { utc = now, iso8601 = now.ToString("o") });
});

app.Run();
