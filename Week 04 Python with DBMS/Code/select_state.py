import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "Alamin@apple10",
    database = "hr",
)
mycurser = mydb.cursor()

#Create table

sql_command =   """
                select *
                from employees
                where salary > 20000
                limit 10;
                """

mycurser.execute(sql_command)
data = mycurser.fetchall()

for i in data:
    print(i)