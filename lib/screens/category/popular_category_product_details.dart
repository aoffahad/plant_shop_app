import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_shop_app/screens/category/popular_product_class.dart';

class PopularCategoryProductDetails extends StatelessWidget {
  final Product product;
  PopularCategoryProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Text(product.title),
            // Text("${product.price.toString()}"),
            // Image.asset(product.image)
            Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Arrow back and Shopping Cart
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const Icon(
                      Icons.shopping_cart_rounded,
                      opticalSize: 30,
                    )
                  ],
                )),

            /// For Product Image and Its Base
            productImage(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 18, top: 28),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.grey.withOpacity(0.1)),
              child: productDetails(),
            )),
          ],
        ),
      ),
    );
  }

  Widget productImage() {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(300, 45))),
            ),
          ),
        ),
        Center(
            child: Hero(
          tag: product.image,
          child: Image.asset(
            product.image,
            width: 320,
            fit: BoxFit.cover,
          ),
        )),
      ],
    );
  }

  Widget productDetails() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        const Row(
          children: [
            SizedBox(
              width: 45,
              child: Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Best Choice",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Colors.green),
              child: Text(
                "\$${product.price}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          "About",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 16),
            )),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                OutlinedButton(onPressed: () {}, child: Icon(Icons.remove)),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "1",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 15,
                ),
                OutlinedButton(onPressed: () {}, child: Icon(Icons.add)),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.green),
                child: Text(
                  "Buy",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
