var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "password",
  database: "employeesDB"
});

// connect to the mysql server and sql database
connection.connect(function (err) {
  if (err) throw err;
  runSearch();
});

function runSearch() {
  inquirer
    .prompt({
      name: "choice",
      type: "list",
      message: "What would you like to do?",
      choices: [
        "Add department",
        "Add role",
        "Add employee",
        "View departments",
        "View roles",
        "View employees",
        "Update an employee roles",
        "View employees by manager",
        "Delete departments",
        "Delete roles",
        "Delete employees",
        "View the total utilized budget of a department",
        "exit"

      ]
    })
    .then(function (answer) {
      switch (answer.action) {

        case "Add department":
          addDep();
          break;

        case "Add role":
          addRole();
          break;

        case "Add employee":
          addEmp();
          break;

        case "View departments":
          viewDeps();
          break;

        case "View roles":
          viewRoles();
          break;

        case "View employees":
          viewEmps();
          break;

        case "Update employee roles":
          upEmpRoles();
          break;

        case "exit":
          connection.end();
          break;
      }
    });
  //=================================
  function addDep() {
    inquirer
      .prompt({
        name: "newDepartmentName",
        type: "input",
        message: "What is the new department would you like to add to the database?"
      })
      .then(function (answer) {
        var query = "INSERT INTO departments SET ?";
        connection.query(query, { department_name: answer.name }, function (err) {
          if (err) throw err;
          console.log("Your entry was added to the database");
          runSearch();
        });
      });
  }

  function addRole() {
    inquirer
      .prompt({
        name: "newRoleName",
        type: "input",
        message: "What is the new role would you like to add to the database?"
      })
      .then(function (answer) {
        var query = "INSERT INTO roles SET ?";
        connection.query(query, { role_name: answer.role }, function (err) {
          if (err) throw err;
          console.log("Your entry was added to the database");
          runSearch();
        });
      });
  }


  function addEmp() {
    inquirer
      .prompt({
        name: "newEmployeeName",
        type: "input",
        message: "Who is the new employee would you like to add to the database?"
      })
      .then(function (answer) {
        var query = "INSERT INTO employees SET ?";
        connection.query(query, { employee_name: answer.employee }, function (err) {
          if (err) throw err;
          console.log("Your entry was added to the database");
          runSearch();
        });
      });
  }



  function viewDeps() {
    console.log("Selecting all departments...\n");
    connection.query("SELECT * FROM departments", function (err, res) {
      if (err) throw err;
      // Log all results of the SELECT statement
      console.log(res);
      runSearch();
    });
  }

  function viewRoles() {
    console.log("Selecting all roles...\n");
    connection.query("SELECT * FROM roles", function (err, res) {
      if (err) throw err;
      // Log all results of the SELECT statement
      console.log(res);
      runSearch();
    });
  }

  function viewEmps() {
    console.log("Selecting all employees...\n");
    connection.query("SELECT * FROM employees", function (err, res) {
      if (err) throw err;
      // Log all results of the SELECT statement
      console.log(res);
      runSearch();
    });
  }


  function upEmpRoles() {
    console.log("Updating all employee roles...\n");
    var query = connection.query(
      "UPDATE employee SET roles_id = ? WHERE id = ?",
      [roles_Id, employees_Id],
      function (err, res) {
        if (err) throw err;
        console.log(res.affectedRows + " roles updated!\n");
        // Call deleteProduct AFTER the UPDATE completes
        deleteRole();
      }
    );
  }

  function deleteRole() {
    connection.query(
      "DELETE FROM roles WHERE ?",
      [roles_Id, employees_Id],
      function (err, res) {
        if (err) throw err;
        console.log(res.affectedRows + " roles deleted!\n");
        // Call readProducts AFTER the DELETE completes
        viewRoles();
      }
    );
  }
