  public class SurveyResult
    {
    public int Id { get; set; } // Jedinstveni identifikator rezultata ankete
    public int SurveyId { get; set; } // ID ankete na koju se rezultati odnose
    public DateTime SubmissionTime { get; set; } // Vrijeme podnošenja rezultata ankete
    public string RespondentName { get; set; } // Ime ispitanika koji je dao odgovore na anketu
    public List<QuestionResult> QuestionResults { get; set; } // Lista rezultata pojedinačnih pitanja u anketi
}
