import 'package:flutter/material.dart';

class OrganicCategory extends StatefulWidget {
  const OrganicCategory({super.key});

  @override
  State<OrganicCategory> createState() => _OrganicCategoryState();
}

class _OrganicCategoryState extends State<OrganicCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.category),
      ),
    );
  }
}
