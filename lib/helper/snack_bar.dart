import 'package:flutter/material.dart';
void ShowSnack(BuildContext context,String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}