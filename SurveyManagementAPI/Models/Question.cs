﻿public class Question
{
    public int Id { get; set; }
    public int SurveyId { get; set; }
    public string Text { get; set; }
    public string TypeOfQuestion { get; set; }
    public List<Answer> Answers { get; set; }
}