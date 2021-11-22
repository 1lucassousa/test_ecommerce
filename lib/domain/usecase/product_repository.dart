import 'package:dartz/dartz.dart';
import 'package:test_ecommerce/controller/products_controller.dart';
import 'package:test_ecommerce/domain/error/error.dart';
import 'package:test_ecommerce/domain/repository/get_product_repository.dart';
import 'package:test_ecommerce/model/product.dart';

abstract class GetProducts {
  Future<Either<Failure, List<Product>>> call(String nameProduct);
}

class GetProductsImpl implements GetProducts {
  final GetProductRepository repository;

  GetProductsImpl(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(String nameProduct) async {
    if (nameProduct == null) {
      return Left(InvalidError());
    }
    return repository.getProduct(nameProduct);
  }
}
