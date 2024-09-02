import 'package:flutter/material.dart';

class SyntheticCategory extends StatefulWidget {
  const SyntheticCategory({super.key});

  @override
  State<SyntheticCategory> createState() => _SyntheticCategoryState();
}

class _SyntheticCategoryState extends State<SyntheticCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.access_alarm_sharp),
      ),
    );
  }
}
