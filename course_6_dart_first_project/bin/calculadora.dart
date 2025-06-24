import 'dart:io'; // IO = in - out

void main() {
  print("=== CALCULADORA ===");
  print("Digite o primeiro número:");
  var number1 = double.parse(stdin.readLineSync()!);

  print("Digite o segundo número:");
  var number2 = double.parse(stdin.readLineSync()!);

  void soma(double number1, double number2) {
    var soma = number1 + number2;
    print("A soma de $number1 e $number2 é $soma");
  }

  void subtracao(double number1, double number2) {
    var subtracao = number1 - number2;
    print("A subtração de $number1 e $number2 é $subtracao");
  }

  void multiplicacao(double number1, double number2) {
    var multiplicacao = number1 * number2;
    print("A multiplicação de $number1 e $number2 é $multiplicacao");
  }

  void divisao(double number1, double number2) {
    var divisao = number1 / number2;
    print("A divisão de $number1 e $number2 é $divisao");
  }

  print("Digite a operação desejada:");
  var operacao = stdin.readLineSync()!;

  if (operacao == "soma") {
    soma(number1, number2);
  } else if (operacao == "subtracao") {
    subtracao(number1, number2);
  } else if (operacao == "multiplicacao") {
    multiplicacao(number1, number2);
  } else if (operacao == "divisao") {
    divisao(number1, number2);
  } else {
    print("Operação inválida");
  }
}
