import 'package:flutter/material.dart';
import 'package:plan_shop_app/screens/category/popular_category_product_details.dart';
import 'package:plan_shop_app/models/popular_product_class.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../helpers/sql_helpers.dart';

class PopularCategory extends StatefulWidget {
  const PopularCategory({super.key});

  @override
  State<PopularCategory> createState() => _PopularCategoryState();
}

class _PopularCategoryState extends State<PopularCategory> {
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
        final popularProduct = product[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PopularCategoryProductDetails(
                            product: popularProduct,
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
                            tag: popularProduct.image,
                            child: Image.asset(
                              popularProduct.image,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )),
                        ],
                      ),

                      /// Favourite Icon
                      GestureDetector(
                        onTap: () async {
                          try {
                            if (popularProduct.isFavourite) {
                              print("popular item delete");
                              // Remove data first
                              await dbHelper.delete(popularProduct.image);
                            } else {
                              print("popular item insert");
                              // Insert data first
                              await dbHelper.insert({
                                DatabaseHelper.columnTitle:
                                    popularProduct.title,
                                DatabaseHelper.columnImage:
                                    popularProduct.image,
                                DatabaseHelper.columnDescription:
                                    popularProduct.description,
                                DatabaseHelper.columnPrice:
                                    popularProduct.price,
                              });
                            }
                          } on Exception catch (e) {
                            print(e.toString());
                          } finally {
                            setState(() {
                              popularProduct.isFavourite =
                                  !popularProduct.isFavourite;
                              print(popularProduct.isFavourite);
                            });
                          }
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: popularProduct.isFavourite
                                    ? Colors.pink.shade50
                                    : Colors.grey.shade400),
                            child: popularProduct.isFavourite
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
                    popularProduct.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${popularProduct.price}",
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
