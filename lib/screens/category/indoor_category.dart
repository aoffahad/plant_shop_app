import 'package:flutter/material.dart';

class IndoorCategory extends StatefulWidget {
  const IndoorCategory({super.key});

  @override
  State<IndoorCategory> createState() => _IndoorCategoryState();
}

class _IndoorCategoryState extends State<IndoorCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.ac_unit_outlined),
      ),
    );
  }
}
