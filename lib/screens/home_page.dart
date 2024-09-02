import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plan_shop_app/screens/category/indoor_category.dart';
import 'package:plan_shop_app/screens/category/organic_category.dart';
import 'package:plan_shop_app/screens/category/popular_category.dart';

import 'category/synthetic_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> titles = ["Popular", "Organic", "Indoor", "Synthetic"];
  int selectedIndex = 0;

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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Welcome Text
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Plant Shop",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),

            /// Search  Box
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  searchField(),
                  const SizedBox(
                    width: 10,
                  ),
                  shortItemButton()
                ],
              ),
            ),

            /// Category

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(titles.length, (index) {
                return sortCategoryItems(
                  isActive: selectedIndex == index,
                  title: titles[index],
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      print(selectedIndex);
                    });
                  },
                );
              }),
            ),

            SizedBox(
              height: 20,
            ),
            categoryTabs[selectedIndex]
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Expanded(
        child: TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15)),
      ),
    ));
  }

  Widget shortItemButton() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15)),
      child: const RotatedBox(
        quarterTurns: 4,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  // Widget sortCategoryItems({
  //   bool isActive = false,
  //   required String title,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [],
  //       ),
  //       TextButton(
  //         onPressed: () {
  //           setState(() {
  //             isActive = true;
  //             print(isActive);
  //           });
  //         },
  //         child: Text(
  //           title,
  //           style: TextStyle(color: isActive ? Colors.green : Colors.grey),
  //         ),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: Container(
  //           margin: EdgeInsets.only(top: 5),
  //           // padding: EdgeInsets.symmetric(horizontal: 10),
  //           height: 5,
  //           width: 35,
  //           decoration: isActive
  //               ? BoxDecoration(
  //                   color: Colors.green,
  //                   borderRadius: BorderRadius.circular(10))
  //               : BoxDecoration(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget sortCategoryItems({
    required bool isActive,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(color: isActive ? Colors.green : Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedContainer(
            margin: EdgeInsets.only(top: 2, left: 5),
            height: 5,
            width: isActive ? 35 : 0,
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            duration: Duration(milliseconds: 300), // Duration of the animation
            curve: Curves.easeInOut, // Ease in out curve
          ),
        ),
      ],
    );
  }
}
