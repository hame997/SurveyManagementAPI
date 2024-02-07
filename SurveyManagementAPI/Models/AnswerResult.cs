public class AnswerResult
{
    public int Id { get; set; } // Jedinstveni identifikator rezultata odgovora
    public int QuestionId { get; set; } // ID pitanja na koje se odgovor odnosi
    public string QuestionText { get; set; } // Tekst pitanja na koje je odgovoreno
    public int AnswerId { get; set; } // ID odgovora na koje se rezultat odnosi
    public string AnswerText { get; set; } // Tekst odgovora
}