import 'dart:io'; // IO = in - out

void main() {
  print("Hello World");

  var nome = stdin.readLineSync();
  print("Seu nome é $nome");

  var idade = int.parse(stdin.readLineSync()!);
  print("Você tem $idade anos");
}
