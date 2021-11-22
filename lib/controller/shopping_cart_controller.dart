import 'package:test_ecommerce/model/product.dart';

class ShoppingCartController {
  static var shoppingCart = [];

  static addProductInShoppingCart(Product product, int amount) {
    var newProduct = {
      'product': {'name': product.name, 'pathImage': product.pathImage},
      'amount': amount
    };
    shoppingCart.add(newProduct);
  }
}
