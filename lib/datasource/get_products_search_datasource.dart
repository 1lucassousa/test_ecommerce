import 'package:test_ecommerce/controller/products_controller.dart';
import 'package:test_ecommerce/infra/datasource/get_product_datasorce.dart';
import 'package:test_ecommerce/model/product.dart';

class GetProductsSearchDatasource implements GetProductDatasource {
  @override
  Future<List<Product>> getProduct(String nameProduct) async {
    final result = await ProductsController.searchProduct(nameProduct);
    return result;
  }
}
