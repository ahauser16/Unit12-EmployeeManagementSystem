DROP DATABASE IF NOT EXISTS employeesDB;
CREATE DATABASE employeesDB;

USE employeesDB;


CREATE TABLE departments (
 id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE roles (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  department_id INTEGER NOT NULL,
  PRIMARY KEY (id),
   CONSTRAINT FOREIGN KEY (departments_id) REFERENCES departments(id) ON DELETE CASCADE
);

CREATE TABLE employees (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  roles_id INT NOT NULL,
  manager_id INT NULL,
  PRIMARY KEY,
  CONSTRAINT FOREIGN KEY (roles_id) REFERENCES roles(id) ON DELETE CASCADE,
  CONSTRAINT FOREIGN KEY (managers_id) REFERENCES employees(id) ON DELETE SET NULL
);
-- ========================
-- [CONSTRAINT [symbol]] FOREIGN KEY
--     [index_name] (col_name, ...)
--     REFERENCES tbl_name (col_name,...)
--     [ON DELETE reference_option]
--     [ON UPDATE reference_option]

-- reference_option:
--     RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT
--     =============================================



INSERT INTO departments
    (name)
VALUES
    ('President Office'),
    ('Human Resources'),
    ('Real Estate Transaction Services Group'),
    ('Accounting'),
    ('Legal'),
    ('Information Technology');


INSERT INTO roles
    (title, departments_id)
VALUES
    ('President', 1),
    ('Vice President', 1),
    ('Assistant Vice President', 1),
    ('Chief Financial Officer', 1),
    ('HR Representative, 2'),
    ('Benefits Specialist, 2'),
    ('Analyst, 3'),
    ('Project Manager, 3'),
    ('Surveyor, 3'),
    ('Tax Specialist, 4'),
    ('Budget Specialist, 4'),
    ('Junior Accountant, 4'),
    ('Senior Accountant, 4'),
    ('General Counsel', 5),
    ('Senior Counsel', 5),
    ('Counsel', 5),
    ('Assistant General Counsel', 5),
    ('Network Specialist', 6),
    ('Technical Support', 6),
    ('Application Developer', 6),
    ('Senior Tech Support Lead', 6),
    ('Senior Tech Lead', 6),
    ('Legal Team Lead', 6);


INSERT INTO employees
    (first_name, last_name, roles_id, manager_id)
VALUES
    ('John', 'Doe', 1, NULL),
    ('Jane', 'Doe', 2, NULL),
    ('Aaron', 'Aaronson', 3, NULL),
    ('Betty', 'Blubridge', 4, NULL),
    ('Cathy', 'Chesterfield', 5, NULL),
    ('Damn', 'Daniel', 6, NULL),
    ('Evan', 'Everyman', 7, NULL),
    ('Frank', 'Ferdinand', 8, NULL),
    ('Gregory', 'Germanhoffer', 9, NULL),
    ('Helen', 'Hartford', 10, NULL),
    ('Karen', 'Sux', 11, NULL),
    ('Liz', 'Lemon', 12, NULL),
    ('Michael', 'Man', 13, NULL),
    ('Nicholas', 'Nackers', 14, NULL),
    ('Olaf', 'Ortenblech', 15, NULL),
    ('Peter', 'Philly', 16, NULL),
    ('Quincy', 'Quartz', 17, NULL),
    ('Randi', 'Ref', 18, NULL),
    ('Steve', 'Stanton', 19, NULL),
    ('Ted', 'Tillary', 20, NULL),
    ('Uma', 'Udderhaven', 21, NULL),
    ('Vinny', 'Vick', 22, NULL),
    ('Wendel', 'Wash', 23, NULL),
    ('Malcolm', 'X', 24, NULL),
    ('Yale', 'Yellow', 25, NULL),
    ('Zed', 'Zinc', 26, NULL),
    ('Irvine', 'Izzard', 27, 1),
    ('Jack', 'Skelington', 28, 2),
    ('Adam', 'Arsenhoffer', 29, 3),
    ('Ben', 'Blackbox', 30, 4),
    ('Christian', 'Chatty', 31, 5),
    ('Devin', 'Dangerfield', 32, 6),
    ('Emily', 'Ebert', 33, 7),
    ('Flat', 'Head', 34, 8),
    ('Gillian', 'Red', 35, 9),
    ('Heerman', 'Stapler', 36, 10),
    ('Mildrid', 'Stanton', 37, 11),
    ('Jennifer', 'Jewels', 38, 12);