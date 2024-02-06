﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

[Route("api/[controller]")]
[ApiController]
public class KorisniciController : ControllerBase
{
    private readonly MojDbContext _context;

    public KorisniciController(MojDbContext context)
    {
        _context = context;
    }

    // GET: api/Korisnici
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Korisnik>>> GetKorisnici()
    {
        return await _context.Korisnici.ToListAsync();
    }

    // GET: api/Korisnici/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Korisnik>> GetKorisnik(int id)
    {
        var korisnik = await _context.Korisnici.FindAsync(id);

        if (korisnik == null)
        {
            return NotFound();
        }

        return korisnik;
    }

    // PUT: api/Korisnici/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutKorisnik(int id, Korisnik korisnik)
    {
        if (id != korisnik.Id)
        {
            return BadRequest();
        }

        _context.Entry(korisnik).State = EntityState.Modified;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!KorisnikExists(id))
            {
                return NotFound();
            }
            else
            {
                throw;
            }
        }

        return NoContent();
    }

    // POST: api/Korisnici
    [HttpPost]
    public async Task<ActionResult<Korisnik>> PostKorisnik(Korisnik korisnik)
    {
        _context.Korisnici.Add(korisnik);
        await _context.SaveChangesAsync();

        return CreatedAtAction("GetKorisnik", new { id = korisnik.Id }, korisnik);
    }

    // DELETE: api/Korisnici/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteKorisnik(int id)
    {
        var korisnik = await _context.Korisnici.FindAsync(id);
        if (korisnik == null)
        {
            return NotFound();
        }

        _context.Korisnici.Remove(korisnik);
        await _context.SaveChangesAsync();

        return NoContent();
    }

    private bool KorisnikExists(int id)
    {
        return _context.Korisnici.Any(e => e.Id == id);
    }
}
