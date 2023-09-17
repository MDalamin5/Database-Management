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
                UPDATE Student
                SET first_name = "HI"
                where roll = 1;
                """

mycurser.execute(sql_command)
mydb.commit()



