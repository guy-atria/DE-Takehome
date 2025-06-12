## Atria Take Home Data Engineer Problem

This is designed to be a semi-straightforward Python/SQL based task to quickly asses your ability to write SQL statements that include JOINS, SELECTS, CREATE VIEW etc - all tasks that will be required as a Data Engineer at Atria.
As an engineering team, we dislike Leetcode problems and would prefer to asses a situation similar to what you would face in your day-to-day at Atria.
## Problem

This scenario this represents a "production" cloud SQL database of a web application - though it will be represented in this test as a Containerized MySQL (using pymysql) connection. An initialization script for the test data can be found under /application/tests/resources/data_creation.sql

The business has asked that a new database view is made so that the Data Visualization team can import it to display the amount of user interactions per day, by type.

The view will need to show the count(s) of user interactions with the business application broke down by the type of interaction, broke down by the date of the interaction - IE:

|Date       | User ID | Full Name          | Interactions | Interaction Type  |
|-----------|---------|--------------------|--------------|-------------------|
|2025-01-01 | 1       | Mr Kelsey Grammer  | 1            | Modified Password |

In the main.py file, the class `MyClass` will need to be modified to be initialized with a PyMySQL connection. A new method will need to be built inside this class that builds this view from a DDL definition of your creation inside the Database connection, returning a value/case class/dataclass to show wether this has been successful or not.

A simple PyTest unit test to validate this would be a bonus, to be ran with the command(s):

**cd application**  
**py -3.12 -m pytest -s --verbose --log-cli-level=INFO --disable-warnings**

An example simple unit test under test_example.py is provided with an example pytest fixture for creating a containerized MySQL instance.

If the code used for this could be written in a Service Oriented OOP manner, with seperation of callable modules/responses placed under a /util/ folder, this would be a bonus also.
## How to Submit

To work on this project, we reccomend you take a working branch from main inside your forked repository and makle changes to that branch. When it is ready to submit, merge your changes into the main branch via pull request. Once a commit has been pushed to the main branch in your forked repository, it will mark it as complete on our side.
## Links to useful guides

[Pytest Documentation](https://docs.pytest.org/en/stable/)  
[PyMySQL Documentation](https://pymysql.readthedocs.io/en/latest/)  
[Test Containers Documentation](https://testcontainers.com/guides/getting-started-with-testcontainers-for-python/)  