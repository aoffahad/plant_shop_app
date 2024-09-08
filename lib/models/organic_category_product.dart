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
      title: 'Oliv Plant',
      image: 'images/organic_product/tree5.png',
      description:
          "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
      price: 100.99),
  Product(
      title: 'Succulent Plant',
      image: 'images/organic_product/tree1.png',
      description:
          "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
      price: 200.99),

  Product(
      title: 'Succulent Plant',
      image: 'images/organic_product/tree4.png',
      description:
          "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
      price: 30.99),
  Product(
      title: 'Raintree Plant',
      image: 'images/organic_product/tree3.png',
      description:
          "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
      price: 90.99),
  Product(
      title: 'Palm Plant',
      image: 'images/organic_product/tree2.png',
      description:
          "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
      price: 700.99),

  // Product(
  //     title: 'Coco Plant',
  //     image: 'images/popular_product/tree1.png',
  //     description:
  //         "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
  //     price: 20.99),
  // Product(
  //     title: 'Succulent Plant',
  //     image: 'images/popular_product/tree4.png',
  //     description:
  //         "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
  //     price: 30.99),
  // Product(
  //     title: 'Oliv Plant',
  //     image: 'images/popular_product/tree5.png',
  //     description:
  //         "Introducing the Majestic Oak Tree, a symbol of strength and longevity, perfect for enhancing the beauty and value of your landscape. This deciduous tree is known for its broad, spreading canopy that provides ample shade and a sense of grandeur to any outdoor space. With a mature height of 60 to 70 feet and a spread of 40 to 50 feet, the Majestic Oak is ideal for large gardens, parks, or estates.",
  //     price: 100.99),
];
