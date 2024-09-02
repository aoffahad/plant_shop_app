import 'package:flutter/material.dart';
import 'package:plan_shop_app/screens/category/indoor_category.dart';
import 'package:plan_shop_app/screens/category/organic_category.dart';
import 'package:plan_shop_app/screens/category/popular_category.dart';
import 'package:plan_shop_app/screens/category/synthetic_category.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedCategoryTab = 0;
  late final List<Widget> categoryTabs;
  @override
  void initState() {
    categoryTabs = [
      PopularCategory(),
      OrganicCategory(),
      IndoorCategory(),
      SyntheticCategory()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        categoryTabs[selectedCategoryTab],
      ],
    ));
  }
}
