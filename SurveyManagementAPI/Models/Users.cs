using System;
using System.Security.Cryptography;
using System.Text;

public class Users
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string PasswordHash { get; set; } // Hashirana lozinka umjesto obične lozinke
    public string Role { get; set; }

    // Metoda za hashiranje lozinke | Ovdje se koristi SHA256 algoritam za hashiranje
    public void HashingPassword(string password)
    {
        using (var sha256 = SHA256.Create())
        {
            var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            PasswordHash = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
        }
    }
}