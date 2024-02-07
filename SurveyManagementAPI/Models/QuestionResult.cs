public class QuestionResult
{
    public int Id { get; set; } // Jedinstveni identifikator rezultata pitanja
    public int QuestionId { get; set; } // ID pitanja na koje se rezultati odnose
    public string QuestionText { get; set; } // Tekst pitanja na koje su odgovoreni
    public List<AnswerResult> AnswerResults { get; set; } // Lista rezultata odgovora na pitanje
}