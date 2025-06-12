import main
import pymysql
import pytest
from testcontainers.mysql import MySqlContainer
import os
import docker

@pytest.fixture(scope="function")
def get_test_mysql_connection() -> pymysql.Connection:
    try:
        client=docker.from_env()
        print("Active Docker Daemon:", client.ping())
    except docker.errors.DockerException:
        raise SystemError("Docker Daemon is not Running. Have you tried restarting Docker Desktop?")

    with MySqlContainer(image="mysql:8.3.0", MYSQL_USER="root", MYSQL_PASSWORD="mytestuserpassword", MYSQL_DATABASE="testdb") as mysql:
        os.environ["EXTERNAL_MYSQL_PORT"] = str(mysql.get_exposed_port("3306"))
        connection = pymysql.connect(host=str(mysql.get_container_host_ip()), user="root", password="mytestuserpassword", database="testdb", port=int(mysql.get_exposed_port("3306")))    
        connection.begin()
        cursor = connection.cursor()
        with open("./tests/resources/data_creation.sql", 'r') as file:
            sql_content = file.read()
            statements = [stmt.strip() for stmt in sql_content.split(';') if stmt.strip()]
            for statement in statements:
                cursor.execute(statement)
        cursor.close()
        connection.commit()
        yield connection

class TestExample:
    def test_main_function(self):

        connection = get_test_mysql_connection
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM users")

        result = main.example_function()

        assert result == True