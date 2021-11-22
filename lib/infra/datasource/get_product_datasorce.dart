import 'package:test_ecommerce/model/product.dart';

abstract class GetProductDatasource {
  Future<List<Product>> getProduct(String nameProduct);
}
