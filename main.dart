// Encapsulation: Creating a class with private variables and controlled access methods.
class BankAccount {
  // Private variables
  double _balance;

  // Constructor to initialize the balance
  BankAccount(this._balance);

  // Method to deposit money (controlled access)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount.');
    }
  }

  // Method to withdraw money (controlled access)
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrew: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid or insufficient funds.');
    }
  }

  // Method to get the current balance (controlled access)
  double getBalance() {
    return _balance;
  }
}

// Inheritance: Implementing a subclass that inherits properties and methods from a superclass.
class SavingsAccount extends BankAccount {
  // Additional property specific to SavingsAccount
  double interestRate;

  // Constructor initializing balance and interest rate
  SavingsAccount(double balance, this.interestRate) : super(balance);

  // Method to add interest to the balance
  void addInterest() {
    double interest = getBalance() * interestRate / 100;
    deposit(interest);
    print('Interest Added: \$${interest.toStringAsFixed(2)}');
  }
}

// Polymorphism: Demonstrating method overriding in subclasses.
class CheckingAccount extends BankAccount {
  double overdraftLimit;

  CheckingAccount(double balance, this.overdraftLimit) : super(balance);

  // Overriding the withdraw method to include overdraft protection
  @override
  void withdraw(double amount) {
    if (amount > 0 && amount <= getBalance() + overdraftLimit) {
      super.withdraw(amount);
    } else {
      print('Withdrawal exceeds overdraft limit.');
    }
  }
}

// Abstraction: Creating an abstract class with abstract methods implemented by subclasses.
abstract class Employee {
  String name;

  Employee(this.name);

  // Abstract method
  double calculateSalary();

  // Concrete method
  void displayInfo() {
    print('Employee Name: $name');
  }
}

// Subclass implementing abstract methods
class FullTimeEmployee extends Employee {
  double monthlySalary;

  FullTimeEmployee(String name, this.monthlySalary) : super(name);

  @override
  double calculateSalary() {
    return monthlySalary;
  }
}

// Another subclass implementing abstract methods
class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;

  PartTimeEmployee(String name, this.hourlyRate, this.hoursWorked)
      : super(name);

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }
}

void main() {
  // Demonstrating Encapsulation
  var account = BankAccount(1000);
  account.deposit(500);
  account.withdraw(200);
  print('Current Balance: \$${account.getBalance().toStringAsFixed(2)}\n');

  // Demonstrating Inheritance
  var savings = SavingsAccount(1500, 5);
  savings.addInterest();
  print(
      'Savings Account Balance: \$${savings.getBalance().toStringAsFixed(2)}\n');

  // Demonstrating Polymorphism
  var checking = CheckingAccount(2000, 500);
  checking.withdraw(2400);
  print(
      'Checking Account Balance: \$${checking.getBalance().toStringAsFixed(2)}\n');

  // Demonstrating Abstraction
  Employee fullTime = FullTimeEmployee('Alice', 3000);
  Employee partTime = PartTimeEmployee('Bob', 20, 80);

  fullTime.displayInfo();
  print(
      'Full-Time Salary: \$${fullTime.calculateSalary().toStringAsFixed(2)}\n');

  partTime.displayInfo();
  print('Part-Time Salary: \$${partTime.calculateSalary().toStringAsFixed(2)}');
}
