import 'package:flutter/material.dart';
import 'package:plan_shop_app/screens/category/organic_category_product_details.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../helpers/sql_helpers.dart';
import '../../models/organic_category_product.dart';

class OrganicCategory extends StatefulWidget {
  const OrganicCategory({super.key});

  @override
  State<OrganicCategory> createState() => _OrganicCategoryState();
}

class _OrganicCategoryState extends State<OrganicCategory> {
  int selectedIndex = 0;
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: product.length,
      mainAxisSpacing: 22,
      crossAxisSpacing: 22,
      itemBuilder: (context, index) {
        final organicProduct = product[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrganicCategoryProductDetails(
                            product: organicProduct,
                          )));
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      /// For Image base
                      Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: const BorderRadius.all(
                                        Radius.elliptical(100, 25))),
                              ),
                            ),
                          ),
                          Center(
                              child: Hero(
                            tag: organicProduct.image,
                            child: Image.asset(
                              organicProduct.image,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )),
                        ],
                      ),

                      /// Favourite Icon
                      GestureDetector(
                        onTap: () async {
                          if (!organicProduct.isFavourite) {
                            // Insert data only when it is not already a favourite (isFavourite is false)
                            await dbHelper.insert({
                              DatabaseHelper.columnTitle: organicProduct.title,
                              DatabaseHelper.columnImage: organicProduct.image,
                              DatabaseHelper.columnDescription:
                                  organicProduct.description,
                              DatabaseHelper.columnPrice: organicProduct.price,
                            });
                          } else {
                            // Remove data from the database when isFavourite is true and toggled to false
                            await dbHelper.delete(organicProduct.image);
                          }

                          // Toggle favourite status
                          setState(() {
                            organicProduct.isFavourite =
                                !organicProduct.isFavourite;
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: organicProduct.isFavourite
                                    ? Colors.pink.shade50
                                    : Colors.grey.shade400),
                            child: organicProduct.isFavourite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.black,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Product Name
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    organicProduct.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${organicProduct.price}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: selectedIndex == index
                                ? Colors.green
                                : Colors.grey.shade400),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
        // );
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    ));
  }
}
