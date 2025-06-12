import main
import pymysql
import pytest
from testcontainers.mysql import MySqlContainer
import os
import docker
from main import MyClass

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
        cursor.execute("""
            CREATE TABLE test (
                test_field INT
            );
        """)
        cursor.close()
        connection.commit()
        yield connection

class TestExample:
    def test_main_function(self):

        test_class = MyClass()

        result = test_class.example_function()

        assert result == True