SurveyManagementAPI
This is a simple RESTful API project built with ASP.NET Core and PostgreSQL database. It provides endpoints for managing surveys, questions, and survey responses.

Endpoints
POST /login: Authenticates users and generates JWT tokens.
GET /todos: Retrieves a list of todos.
GET /todos/{id}: Retrieves a todo item by its ID.
POST /survey/{id}/response: Submits a response for a survey.
GET /survey/{id}/results: Retrieves the results of a survey.
Project Structure
Controllers: Contains the API controllers.
Models: Defines the data models used in the application.
Services: Provides business logic for survey management.
Technologies Used
ASP.NET Core
Entity Framework Core
Dapper
PostgreSQL
JSON Web Tokens (JWT) for authentication
Contributing
Contributions are welcome! Please feel free to submit issues and pull requests.

License
This project is licensed under the MIT License. See the LICENSE file for details.





