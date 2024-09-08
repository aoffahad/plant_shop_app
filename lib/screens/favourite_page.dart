import 'package:flutter/material.dart';

import '../helpers/sql_helpers.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<Map<String, dynamic>> favouriteItems = [];
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _loadFavouriteItems();
  }

  // Load favourite items from the database
  void _loadFavouriteItems() async {
    final data = await dbHelper.queryAll();
    setState(() {
      favouriteItems = data;
    });
  }

  void _deleteItem(String image) async {
    await dbHelper.delete(image);
    _loadFavouriteItems(); // Refresh the list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Page"),
      ),
      body: favouriteItems.isEmpty
          ? Center(
              child: Text('No favourites added yet.'),
            )
          : ListView.builder(
              itemCount: favouriteItems.length,
              itemBuilder: (context, index) {
                final item = favouriteItems[index];
                return ListTile(
                  // leading: Image.network(item['image']),
                  leading: Image.asset(item['image']),
                  title: Text(item['title']),
                  // subtitle: Text(
                  //   item['description'],
                  //   textScaler: TextScaler.linear(1.0),
                  // ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _deleteItem(item['image']);
                        print("Item Deleated");
                      });
                    },
                  ),
                  subtitle: Text("\$${item['price'].toString()}"),
                );
              },
            ),
    );
  }
}
