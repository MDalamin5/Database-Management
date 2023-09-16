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
                INSERT INTO Student(roll, first_name, last_name)
                values(1,"MD", "Al Amin" );
                """

mycurser.execute(sql_command)
mydb.commit()