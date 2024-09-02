class Product {
  final String title;
  final String image;
  final String description;
  final double price;
  bool isFavourite;

  Product({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    this.isFavourite = false,
  });
}

final List<Product> product = [
  Product(
      title: 'Succulent Plant',
      image: 'images/popular_product/tree1.png',
      description: "This is most expensive",
      price: 200.99),
  Product(
      title: 'Palm Plant',
      image: 'images/popular_product/tree2.png',
      description: "This is most expensive",
      price: 700.99),
  Product(
      title: 'Raintree Plant',
      image: 'images/popular_product/tree3.png',
      description: "This is most expensive",
      price: 90.99),
  Product(
      title: 'Succulent Plant',
      image: 'images/popular_product/tree4.png',
      description: "This is most expensive",
      price: 30.99),
  Product(
      title: 'Oliv Plant',
      image: 'images/popular_product/tree5.png',
      description: "This is most expensive",
      price: 100.99),
  Product(
      title: 'Coco Plant',
      image: 'images/popular_product/tree1.png',
      description: "This is most expensive",
      price: 20.99),
  Product(
      title: 'Succulent Plant',
      image: 'images/popular_product/tree4.png',
      description: "This is most expensive",
      price: 30.99),
  Product(
      title: 'Oliv Plant',
      image: 'images/popular_product/tree5.png',
      description: "This is most expensive",
      price: 100.99),
];
