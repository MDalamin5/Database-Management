create table department (
  dname char(20) not null,
  dnumber numeric(1) not null,  
  mgrssn numeric(9) not null,   
  mgrstartdate date not null, 
  primary key (dnumber), 
  unique (dname)
);
insert into department values ('Research',5,333445555,'22-MAY-1988'),
('Administration',4,987654321,'01-JAN-1996'),
('Headquarters',1,888665555,'19=JUN-1981');


create table employee (
  fname char(10) not null,
  lname char(20) not null,
  ssn numeric(9) not null,  
  bdate date not null,
  address char(30) not null,
  gender char(1) not null,
  salary numeric(5) not null,
  superssn numeric(9),
  dno numeric(1) not null, 
  primary key (ssn), 
  foreign key (dno) references department(dnumber)
); 
insert into employee values ('John','Smith',123456789,'09-JAN-1965','731 Fondren, Houston TX','M',30000,333445555,5),
 ('Franklin','Wong',333445555,'08-DEC-1965','638 Voss, Houston TX','M',40000,888665555,5),
('Alicia','Zelaya',999887777,'19-JAN-1968','3321 Castle, Spring TX','F',25000,987654321,4),
('Jennifer','Wallace',987654321,'20-JUN-1941','291 Berry, Bellaire TX','F',43000,888665555,4),
('Ramesh','Narayan',666884444,'15-SEP-1962','975 Fire Oak, Humble TX','M',38000,333445555,5),
('Joyce','English',453453453,'31-JUL-1972','5631 Rice, Houston TX','F',25000,333445555,5),
('Ahmad','Jabbar',987987987,'29-MAR-1969','980 Dallas, Houston TX','M',25000,987654321,4),
('James','Borg',888665555,'10-NOV-1937','450 Stone, Houston TX','M',55000,null,1);


create table project (
  pname char(20) not null,
  pnumber numeric(2) not null,  
  plocation char(20) not null,
  dnum numeric(1) not null, 
  primary key (pnumber), 
  unique (pname), 
  foreign key (dnum) references department(dnumber)
); 
insert into project values  ('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);


create table works_on (
  essn numeric(9) not null,  
  pno numeric(2) not null, 
  hours numeric(5,1),  
  primary key (essn, pno), 
  foreign key (essn) references employee(ssn),
  foreign key (pno) references project(pnumber)
); 
insert into works_on values  (123456789,1,32.5),
 (123456789,2,7.5),
(666884444,3,40.0),
(453453453,1,20.0),
 (453453453,2,20.0),
 (333445555,2,10.0),
 (333445555,3,10.0),
 (333445555,10,10.0),
 (333445555,20,10.0),
(999887777,30,30.0),
 (999887777,10,10.0),
 (987987987,10,35.0),
 (987987987,30,5.0),
 (987654321,30,20.0),
 (987654321,20,15.0),
 (888665555,20,null);



create table dependent (
  essn numeric(9) not null,  
  dependent_name char(10) not null,
  gender char(1) not null,
  bdate date not null,
  relationship char(30) not null,
  primary key (essn, dependent_name),
  foreign key (essn) references employee(ssn)
); 

insert into dependent values  (333445555,'Alice','F','04-APR-1986','Daughter'),
(333445555,'Theodore','M','25-OCT-1983','Son'),
 (333445555,'Joy','F','03-MAY-1958','Spouse'),
(987654321,'Abner','M','28-FEB-1942','Spouse'),
 (123456789,'Michael','M','04-JAN-1988','Son'),
(123456789,'Alice','F','30-DEC-1988','Daughter'),
 (123456789,'Elizabeth','F','05-MAY-1967','Spouse');


create table dept_locations (
  dnumber numeric(1) not null,
  dlocation char (15) not null,
  primary key (dnumber, dlocation), 
  foreign key (dnumber) references department(dnumber)
);
insert into dept_locations values  (1,'Houston'),
 (4,'Stafford'),
(5,'Bellaire'),
 (5,'Sugarland'),
(5,'Houston');


alter table department 
 add constraint depemp foreign key (mgrssn) references employee(ssn);

alter table employee   
 add constraint empemp foreign key (superssn) references employee(ssn);