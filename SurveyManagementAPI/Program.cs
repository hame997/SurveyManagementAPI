using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Dapper;
using Npgsql;

var builder = WebApplication.CreateSlimBuilder(args);

builder.Services.ConfigureHttpJsonOptions(options =>
{
    options.SerializerOptions.TypeInfoResolverChain.Insert(0, AppJsonSerializerContext.Default);
});

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = "your_issuer_here",
        ValidAudience = "your_audience_here",
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("your_secret_key_here"))
    };
});

builder.Services.AddAuthorization();

var app = builder.Build();

// Endpoint za autentifikaciju korisnika
app.MapPost("/login", async (HttpContext httpContext) =>
{
    var username = httpContext.Request.Form["username"];
    var password = httpContext.Request.Form["password"];

    // Ovdje implementirajte logiku za provjeru korisničkih podataka i generiranje JWT tokena
    // Na primjer, možete koristiti EF Core za pristup bazi podataka i provjeru korisničkih podataka

    // Dummy provjera korisničkih podataka
    if (username == "admin" && password == "admin")
    {
        var claims = new[]
        {
            new Claim(ClaimTypes.Name, username),
            // Dodajte dodatne tvrdnje o korisniku ako je potrebno
        };

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("your_secret_key_here"));
        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: "your_issuer_here",
            audience: "your_audience_here",
            claims: claims,
            expires: DateTime.Now.AddMinutes(30), // Vrijeme isteka tokena
            signingCredentials: creds);

        return Results.Ok(new { token = new JwtSecurityTokenHandler().WriteToken(token) });
    }
    else
    {
        return Results.BadRequest("Invalid username or password");
    }
});

// Dodavanje autentifikacije i autorizacije
app.UseAuthentication();
app.UseAuthorization();

// Ostatak koda
var sampleTodos = new Todo[] {
    new(1, "Walk the dog"),
    new(2, "Do the dishes", DateOnly.FromDateTime(DateTime.Now)),
    new(3, "Do the laundry", DateOnly.FromDateTime(DateTime.Now.AddDays(1))),
    new(4, "Clean the bathroom"),
    new(5, "Clean the car", DateOnly.FromDateTime(DateTime.Now.AddDays(2)))
};

var todosApi = app.MapGroup("/todos");
todosApi.MapGet("/", () => sampleTodos);
todosApi.MapGet("/{id}", (int id) =>
    sampleTodos.FirstOrDefault(a => a.Id == id) is { } todo
        ? Results.Ok(todo)
        : Results.NotFound());


// Učitavanje connection string-a iz appsettings.json
string connectionString = builder.Configuration.GetConnectionString("MyPostgresConnection");

// Inicijalizacija baze podataka
DatabaseInitializer.Initialize(connectionString);

app.Run();

public record Todo(int Id, string? Title, DateOnly? DueBy = null, bool IsComplete = false);

[JsonSerializable(typeof(Todo[]))]
internal partial class AppJsonSerializerContext : JsonSerializerContext
{

}
