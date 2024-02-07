using Microsoft.EntityFrameworkCore;

public class MojDbContext : DbContext
{
    public DbSet<Survey> Surveys { get; set; } // Dodajte DbSet za entitet Survey
    public DbSet<Users> Users { get; set; } // Dodajte DbSet za svaki entitet koji želite mapirati u bazu podataka

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer("your_connection_string_here"); // Postavite svoj connection string
        }
    }
}