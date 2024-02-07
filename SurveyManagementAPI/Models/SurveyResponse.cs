public class SurveyResponse
{
    public int Id { get; set; }
    public int SurveyId { get; set; }
    public string UserId { get; set; } // ID korisnika koji je odgovorio na anketu
    public List<Answer> Answers { get; set; } // Odgovori korisnika na pitanja ankete
}