using Dapper;
using Npgsql;

public static class DatabaseInitializer
{
    public static void Initialize(string connectionString)
    {
        using (var connection = new NpgsqlConnection(connectionString))
        {
            connection.Open();

            // Kreiranje tabele "Users"
            string createUserTableQuery = @"
                CREATE TABLE IF NOT EXISTS Users (
                    Id SERIAL PRIMARY KEY,
                    Name VARCHAR(100),
                    Email VARCHAR(100),
                    PasswordHash VARCHAR(100),
                    Role VARCHAR(50)
                )";

            connection.Execute(createUserTableQuery);

            // Kreiranje tabele "Survey"
            string createSurveyTableQuery = @"
                CREATE TABLE IF NOT EXISTS Survey (
                    Id SERIAL PRIMARY KEY,
                    Title VARCHAR(100),
                    SurveyStartTime TIMESTAMP,
                    SurveyEndTime TIMESTAMP,
                    Description TEXT,
                    CreatedBy VARCHAR(100)
                )";

            connection.Execute(createSurveyTableQuery);

            // Kreiranje tabele "Question"
            string createQuestionTableQuery = @"
               CREATE TABLE IF NOT EXISTS Question (
                 Id SERIAL PRIMARY KEY,
                 SurveyId INT,
                 Text VARCHAR(255),
                 TypeOfQuestion VARCHAR(50)
        )";

            connection.Execute(createQuestionTableQuery);

            // Kreiranje tabele "QuestionResult"
            string createQuestionResultTableQuery = @"
        CREATE TABLE IF NOT EXISTS QuestionResult (
            Id SERIAL PRIMARY KEY,
            QuestionId INT,
            QuestionText VARCHAR(255),
            AnswerResults JSON
        )";

            connection.Execute(createQuestionResultTableQuery);

            // Kreiranje tabele "Answer"
            string createAnswerTableQuery = @"
        CREATE TABLE IF NOT EXISTS Answer (
            Id SERIAL PRIMARY KEY,
            QuestionId INT,
            Text VARCHAR(255)
        )";

            connection.Execute(createAnswerTableQuery);

            // Kreiranje tabele "AnswerResult"
            string createAnswerResultTableQuery = @"
        CREATE TABLE IF NOT EXISTS AnswerResult (
            Id SERIAL PRIMARY KEY,
            QuestionId INT,
            QuestionText VARCHAR(255),
            AnswerId INT,
            AnswerText VARCHAR(255)
        )";

            connection.Execute(createAnswerResultTableQuery);

            // Kreiranje tabele "SurveyResponse"
            string createSurveyResponseTableQuery = @"
        CREATE TABLE IF NOT EXISTS SurveyResponse (
            Id SERIAL PRIMARY KEY,
            SurveyId INT,
            UserId VARCHAR(100),
            CONSTRAINT fk_survey_response_survey FOREIGN KEY (SurveyId) REFERENCES Survey(Id)
        )";

            connection.Execute(createSurveyResponseTableQuery);

            // Kreiranje tabele "SurveyResult"
            string createSurveyResultTableQuery = @"
        CREATE TABLE IF NOT EXISTS SurveyResult (
            Id SERIAL PRIMARY KEY,
            SurveyId INT,
            SubmissionTime TIMESTAMP,
            RespondentName VARCHAR(100),
            CONSTRAINT fk_survey_result_survey FOREIGN KEY (SurveyId) REFERENCES Survey(Id)
        )";

            connection.Execute(createSurveyResultTableQuery);

            // Kreiranje tabele "SurveyManagement"
            string createSurveyManagementTableQuery = @"
        CREATE TABLE IF NOT EXISTS SurveyManagement (
            Id SERIAL PRIMARY KEY,
            SurveyId INT,
            UserId VARCHAR(100),
            CONSTRAINT fk_survey_management_survey FOREIGN KEY (SurveyId) REFERENCES Survey(Id)
        )";

            connection.Execute(createSurveyManagementTableQuery);
        }
    }
}