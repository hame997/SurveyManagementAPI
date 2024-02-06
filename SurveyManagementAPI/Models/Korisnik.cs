using System;
using System.Security.Cryptography;
using System.Text;

public class Korisnik
{
    public int Id { get; set; }
    public string Ime { get; set; }
    public string Email { get; set; }
    public string LozinkaHash { get; set; } // Hashirana lozinka umjesto obične lozinke
    public string Uloga { get; set; }

    // Metoda za hashiranje lozinke | Ovdje se koristi SHA256 algoritam za hashiranje
    public void HashirajLozinku(string lozinka)
    {
        using (var sha256 = SHA256.Create())
        {
            var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(lozinka));
            LozinkaHash = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
        }
    }
}