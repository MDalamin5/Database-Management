import mysql.connector

import pymysql

connection = pymysql.connect(
    host = "localhost",
    user= "root",
    passwd="Alamin@apple10",
    database="school",
)

query = "CREATE DATABASE IF NOT EXISTS school "
# query = "CREATE DATABASE school "
cursor = connection.cursor()
cursor.execute(query)


#............................
#Maint Coding Part
def create_table(tablename):
    query = f"""
        CREATE TABLE if not exists {tablename} (
            id int primary key auto_increment,
            name varchar(255) not null,
            age int,
            grade float
        )
    """
    cursor = connection.cursor()
    cursor.execute(query)
    print("Table Create Sussfully")

def add_student(name, age, grade):
    query = """
            insert into students(name, age, grade)
            values(%s, %s, %s)
            """
    cursor = connection.cursor()
    cursor.execute(query, (name, age, grade))
    connection.commit()
    
    print("Student Added Sussfully")
    

def update_grage():
    pass

def increase_age():
    pass

def viewAllStudent():
    pass

while True:
    print("""
          1. Create Table
          2. Add Student
          3. Update Grade
          4. Increase Age
          5. View All Student
          0. Exit
          """)
    option = int(input("Enter Your Option: "))
    
    if(option == 1):
        tablename = input('Enter your table name: ')
        create_table(tablename)
    elif(option == 2):
        name = input("Enter Student Name: ")
        age = int(input('Enter Student age: '))
        grade = float(input("Enter student grade: "))
        add_student(name,age,grade)
    elif(option == 3):
        update_grage()
    elif(option == 4):
        increase_age()
    elif(option == 5):
        viewAllStudent()
    elif(option == 0):
        break
    else:
        print("You are Entering invalid Input")