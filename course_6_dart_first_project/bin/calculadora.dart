import 'dart:io'; // IO = in - out

void main() {
  print("=== CALCULATOR ===");

  double firstNumber = getValidNumber("Enter the first number:");
  String operation = getValidOperation();
  double secondNumber = getValidNumber("Enter the second number:");

  calculate(firstNumber, secondNumber, operation);
}

double getValidNumber(String message) {
  while (true) {
    print(message);
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Please enter a valid value.");
      continue;
    }

    try {
      return double.parse(input);
    } catch (e) {
      print("Error: Enter only valid numbers (ex: 10, 5.5, -3).");
    }
  }
}

String getValidOperation() {
  while (true) {
    print("Enter the desired operation (+, -, *, /):");
    String? operation = stdin.readLineSync();

    if (operation == null || operation.isEmpty) {
      print("Please enter a valid operation.");
      continue;
    }

    if (["+", "-", "*", "/"].contains(operation)) {
      return operation;
    } else {
      print("Invalid operation! Use only: +, -, *, /");
    }
  }
}

void calculate(double firstNumber, double secondNumber, String operation) {
  switch (operation) {
    case "+":
      add(firstNumber, secondNumber);
      break;
    case "-":
      subtract(firstNumber, secondNumber);
      break;
    case "*":
      multiply(firstNumber, secondNumber);
      break;
    case "/":
      divide(firstNumber, secondNumber);
      break;
  }
}

void add(double firstNumber, double secondNumber) {
  double result = firstNumber + secondNumber;
  print("The sum of $firstNumber and $secondNumber is $result");
}

void subtract(double firstNumber, double secondNumber) {
  double result = firstNumber - secondNumber;
  print("The subtraction of $firstNumber and $secondNumber is $result");
}

void multiply(double firstNumber, double secondNumber) {
  double result = firstNumber * secondNumber;
  print("The multiplication of $firstNumber and $secondNumber is $result");
}

void divide(double firstNumber, double secondNumber) {
  if (secondNumber == 0) {
    print("Error: Cannot divide by zero!");
    return;
  }
  double result = firstNumber / secondNumber;
  print("The division of $firstNumber and $secondNumber is $result");
}
