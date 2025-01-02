import 'package:flutter/material.dart';

Widget AppElevatedButton(
    {required VoidCallback onPressed, required String text}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
    ),
    onPressed: onPressed,
    child: Center(
        child: Text(
      text,
      style: const TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    )),
  );
}
