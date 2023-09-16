import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "Alamin@apple10",
    database = "mydatabase",
)
mycurser = mydb.cursor()

#Create table

sql_command =   """
                CREATE TABLE Student(
                roll int,
                first_name varchar(20),
                last_name varchar(20)
                );
                """

mycurser.execute(sql_command)