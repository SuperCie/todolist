// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
