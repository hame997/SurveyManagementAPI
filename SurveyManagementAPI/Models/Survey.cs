public class Survey
{
    public int Id { get; set; }
    public string Title { get; set; }
    public DateTime SurveyStartTime { get; set; }
    public DateTime SurveyEndTime { get; set; }
    public string Description { get; set; }
    public string CreatedBy { get; set; }
    public List<Question> Questions { get; set; }
}