using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

[Route("api/[controller]")]
[ApiController]
public class SurveyController : ControllerBase
{
    private readonly MojDbContext _context;

    public SurveyController(MojDbContext context)
    {
        _context = context;
    }

    // GET: api/Survey
    [HttpGet]
    [Authorize(Roles = "admin, user")]
    public async Task<ActionResult<IEnumerable<Survey>>> GetSurveys()
    {
        return await _context.Surveys.ToListAsync();
    }

    // GET: api/Survey/5
    [HttpGet("{id}")]
    [Authorize(Roles = "admin, user")]
    public async Task<ActionResult<Survey>> GetSurvey(int id)
    {
        var survey = await _context.Surveys.FindAsync(id);

        if (survey == null)
        {
            return NotFound();
        }

        return survey;
    }

    // POST: api/Survey
    [HttpPost]
    [Authorize(Roles = "admin")]
    public async Task<ActionResult<Survey>> PostSurvey(Survey survey)
    {
        _context.Surveys.Add(survey);
        await _context.SaveChangesAsync();

        return CreatedAtAction("GetSurvey", new { id = survey.Id }, survey);
    }

    // PUT: api/Survey/5
    [HttpPut("{id}")]
    [Authorize(Roles = "admin")]
    public async Task<IActionResult> PutSurvey(int id, Survey survey)
    {
        if (id != survey.Id)
        {
            return BadRequest();
        }

        _context.Entry(survey).State = EntityState.Modified;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!SurveyExists(id))
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

    // DELETE: api/Survey/5
    [HttpDelete("{id}")]
    [Authorize(Roles = "admin")]
    public async Task<IActionResult> DeleteSurvey(int id)
    {
        var survey = await _context.Surveys.FindAsync(id);
        if (survey == null)
        {
            return NotFound();
        }

        _context.Surveys.Remove(survey);
        await _context.SaveChangesAsync();

        return NoContent();
    }

    private bool SurveyExists(int id)
    {
        return _context.Surveys.Any(e => e.Id == id);
    }
}
