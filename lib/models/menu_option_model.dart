import 'package:flutter/material.dart';

// Model class to hold menu option data (language and theme)
class MenuOptionsModel {
  final String title;
  final String value;
  final IconData? icon;

  MenuOptionsModel({required this.title, required this.value, this.icon});
}