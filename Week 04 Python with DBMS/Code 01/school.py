import mysql.connector

import pymysql

connection = pymysql.connect(
    host = "localhost",
    user= "root",
    passwd="enter your local host password",
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
    

def update_grage(stu_id, new_grade):
    query = """
            update students
            set grade = %s
            where id = %s
            """
    cursor = connection.cursor()
    cursor.execute(query,(new_grade,stu_id))
    
    connection.commit()
    print("Grage Update Sussfully")

def increase_age(stu_id, val):
    query = "select age from students where id = %s"
    cursor = connection.cursor()
    cursor.execute(query, (stu_id))
    
    age = cursor.fetchone()
    new_age = age[0] + val
    
    cursor.execute(
                    """
                        update students
                        set age = %s
                        where id = %s
                    """, (new_age, stu_id)
    )
    connection.commit()
    print('Age update sussfully')

def viewAllStudent():
    query = "select * from students"
    cursor = connection.cursor()
    cursor.execute(query)
    
    students = cursor.fetchall()
    # print(student)
    for student in students:
        print(f"""
              ID = {student[0]}
              Name = {student[1]}
              Age = {student[2]}
              Grage = {student[3]}
              """)
        

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
        stu_id = int(input("Enter the student id which you want to update: "))
        new_grage = float(input('Enter New grage: '))
        update_grage(stu_id, new_grage)
    elif(option == 4):
        stu_id = int(input("Enter the student id which you want to update: "))
        val = int(input("Enter number of age you want to increase: "))
        increase_age(stu_id, val)
    elif(option == 5):
        viewAllStudent()
    elif(option == 0):
        break
    else:
        print("You are Entering invalid Input")