import 'package:test_ecommerce/model/product.dart';

class ProductsController {
  static List<Product> products = [
    Product('Maçã', 'assets/maca.jpg'),
    Product('Pêra', 'assets/pera.jpg'),
    Product('Banana', 'assets/banana.png'),
    Product('Abacaxi', 'assets/abacaxi.jpg'),
    Product('Manga', 'assets/manga.jpg'),
  ];

  get getProducts => products;

  static searchProduct(String nameProduct) {
    List<Product> resultSearch = [];

    for (var product in products) {
      if (product.name.toLowerCase() == nameProduct.toLowerCase()) {
        resultSearch.add(product);
      }
    }

    return resultSearch;
  }
}
