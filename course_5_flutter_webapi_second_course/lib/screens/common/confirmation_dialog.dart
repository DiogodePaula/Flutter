import 'package:flutter/material.dart';

Future<dynamic> showConfirmationDialog(
  BuildContext context, {
  String title = "Atenção",
  String content = "Deseja executar esta operação?",
  String confirmButtonText = "Confirmar",
  String cancelButtonText = "Cancelar",
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(cancelButtonText),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(
            confirmButtonText.toUpperCase(),
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
